using Random
include("flow_max.jl")
include("coupe_min.jl")
include("common.jl")

# Démo et résultats du graphe G1
min, edge = sec(G1)

if edge == size(G1, 1)
    xhat = coupe_min(G1,edge,1)
else
    xhat = coupe_min(G1,edge,edge+1)
end

edges(G1,xhat)

if edge == size(G1, 1)
    println("Source = $edge - Target = 1 ")
else
    println("Source = $edge - Target = $(edge+1) ")
end

println("SEC = $min ")
