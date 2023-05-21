using JuMP, Cbc

function P(G::Matrix{Int64}, s::Integer,t::Integer)
    m = JuMP.Model(Cbc.Optimizer)
    n = size(G,1)

    @variable(m, p[i in 1:n , j in 1:n], Bin)

    @constraint(m, [i in 1:n,j in 1:n], G[i,j]-p[i,j] >= 0)
    @constraint(m, [i in filter(x -> x != s && x != t, 1:n)], sum(p[i,j] for j in 1:n) == sum(p[j,i] for j in 1:n))
    @constraint(m,sum(p[i,s] for i in 1:n) == 0)

    @objective(m,Max, sum(p[s,j] for j in 1:n))

    optimize!(m)

    return JuMP.objective_value(m)
end

function sec(G::Matrix{Int64})
    n = size(G,1)
    min = P(G,n,1)
    edge = n

    for i in 1:n-1
        f = P(G,i,i+1)

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
