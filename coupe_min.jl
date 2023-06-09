using JuMP, Cbc

function coupe_min(G::Matrix{Int64}, s::Integer,t::Integer)
    m = JuMP.Model(Cbc.Optimizer)
    n = size(G, 1)
    Capacity = 1
    
    @variable(m, x[i in 1:n], Bin)
    @variable(m, y[i in 1:n, j in 1:n], Bin)

    @constraint(m, x[s] == 1)
    @constraint(m, x[t] == 0)
    @constraint(m, [i in 1:n,j in 1:n], y[i,j] <= x[i])
    @constraint(m, [i in 1:n,j in 1:n], y[i,j] <= x[j])
    @constraint(m, [i in 1:n,j in 1:n], y[i,j] >= x[i]+x[j]-1)

    @objective(m, Min, sum(G[i,j]*Capacity*x[i] for i in 1:n,j in 1:n ) - sum(G[i,j]*Capacity*y[i,j] for i in 1:n, j in 1:n))

    optimize!(m)
    xhat = fill(0, n)

    for i in 1:n
        xhat[i] = JuMP.value(x[i])
    end

    return xhat
end

function edges(G::Matrix{Int64}, xhat::Vector{Int64})
    n = size(G,1)

    for i in 1:n

        for j in 1:n
            if G[i,j]==1 && xhat[i]==1 && xhat[j]==0
                print("Remove edge from ",i," to ",j,"\n")
            end
        end
    end
end
