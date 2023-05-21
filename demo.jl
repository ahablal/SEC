using Random
using TimerOutputs

include("flow_max.jl")
include("coupe_min.jl")
include("common.jl")

to = TimerOutput()

# Démo et résultats du graphe G1
@timeit to "Totale" begin

@timeit to "sec" begin
min, edge = sec(G1)
end

@timeit to "coupe_min" begin
if edge == size(G1, 1)
    xhat = coupe_min(G1,edge,1)
else
    xhat = coupe_min(G1,edge,edge+1)
end
end

@timeit to "edges" begin
edges(G1,xhat)
end

if edge == size(G1, 1)
    println("Source = $edge - Target = 1 ")
else
    println("Source = $edge - Target = $(edge+1) ")
end

println("SEC = $min ")
end
println(to)
