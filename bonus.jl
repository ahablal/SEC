using Random
include("Flot_max.jl")
n=20

matrix=zeros(Int,n,n)
function random(lower, upper)
    random_value = lower + (upper - lower) * rand()
    return random_value
end
for i in 2:n
    matrix[i,rand(Random.GLOBAL_RNG, 1:i-1)]=1
    matrix[rand(Random.GLOBAL_RNG, 1:i-1),i]=1
end

print(SEC(matrix))