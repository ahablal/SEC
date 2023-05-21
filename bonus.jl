using Random
using JuMP, Cbc
using TimerOutputs

to = TimerOutput()

# Génération d'un graphe de 1000 sommets avec des arêtes aléatoires
n = 1000  # Nombre de sommets
MATRIX = zeros(n, n)  # Initialisation de la matrice d'adjacence

function bonus_flow_max(G::Matrix{Float64}, s::Int64, t::Int64)
    print(" >>> flow max \n")
    m = JuMP.Model(Cbc.Optimizer)
    n::Int = size(G,1)

    @variable(m, p[i in 1:n , j in 1:n], Bin)

    @constraint(m, [i in 1:n,j in 1:n], G[i,j]-p[i,j] >= 0)
    @constraint(m, [i in filter(x -> x != s && x != t, 1:n)], sum(p[i,j] for j in 1:n)==sum(p[j,i] for j in 1:n))
    @constraint(m,sum(p[i,s] for i in 1:n)==0)

    @objective(m,Max, sum(p[s,j] for j in 1:n ))

    optimize!(m)

    print(" <<< flow max \n")

    return JuMP.objective_value(m)
end

function bonus_SEC(G::Matrix{Float64})
    print(">>> SEC \n")

    n::Int = size(G,1)
    min::Int = bonus_flow_max(G,n,1)
    edge::Int = n

    for i in 1:n-1
        f = bonus_flow_max(G,i,i+1)
        print(f)
        if f < min
            edge = i
            min = f
        end
    end

    if edge == size(G, 1)
        println("Source = $edge - Target = 1 ")
    else
        println("Source = $edge - Target = $(edge+1) ")
    end

    println("SEC = $min ")

    return min, edge
end


function bonus_coupe_min(G::Matrix{Float64}, s::Integer,t::Integer)
    print(" >>> coupe min \n")
    m = JuMP.Model(Cbc.Optimizer)
    n::Int = size(G,1)
    Capacity = 1

    @variable(m,x[i in 1:n],Bin)
    @variable(m,y[i in 1:n, j in 1:n],Bin)

    @constraint(m,x[s]==1)
    @constraint(m,x[t]==0)
    @constraint(m,[i in 1:n,j in 1:n],y[i,j]<=x[i])
    @constraint(m,[i in 1:n,j in 1:n],y[i,j]<=x[j])
    @constraint(m,[i in 1:n,j in 1:n],y[i,j]>=x[i]+x[j]-1)

    @objective(m,Min,sum(G[i,j]*Capacity*x[i] for i in 1:n,j in 1:n )-sum(G[i,j]*Capacity*y[i,j] for i in 1:n ,j in 1:n))

    optimize!(m)
    xhat = fill(0, n)

    for i in 1:n
        xhat[i] = JuMP.value(x[i])
    end

    print(" <<< coupe min \n")

    return xhat
end

function bonus_edges(G::Matrix{Float64},xhat::Vector{Int64})
    print(" >>> edges \n")
    n::Int = size(G,1)

    for i in 1:n
        for j in 1:n
            if G[i,j]==1 && xhat[i]==1 && xhat[j]==0
                print("remove edge from ",i," to ",j,"\n")
            end
        end
    end

    print(" <<< edges \n")
end

@timeit to "Totale" begin


@timeit to "Génération d'un graphe de 1000" begin
println("Génération d'arêtes aléatoires")
for sommet in 1:n
    voisins = rand(1:n, 20)  # Sélection aléatoire de 3 voisins pour chaque sommet
    MATRIX[sommet, voisins] .= 1  # Définition des entrées correspondantes à 1
end

end

@timeit to "Calcul de la SEC du graphe" begin

# Calcul de la SEC du graphe
min, edge = bonus_SEC(MATRIX)
end

@timeit to "Calcul de l'ensemble minimal d'arêtes à supprimer" begin
# Calcul de l'ensemble minimal d'arêtes à supprimer
if edge == size(MATRIX, 1)
    xhat = bonus_coupe_min(MATRIX, edge, 1)
else
    xhat = bonus_coupe_min(MATRIX, edge, edge + 1)
end
end

@timeit to "Affichage de l'ensemble minimal d'arêtes à supprimer" begin
# Affichage de l'ensemble minimal d'arêtes à supprimer
bonus_edges(MATRIX, xhat)
end

end
println(to)
