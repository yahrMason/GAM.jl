function optimal_knots(x::Array{Float64, 1}, degree::Int, n_knots::Int)
    
    knots = range(minimum(x), stop=maximum(x), length=n_knots)
    knots = knots[2:end-1]
    knots = sort(unique(knots))
    knots = vcat(knots[1] .- (knots[2] - knots[1]), knots, knots[end] .+ (knots[end] - knots[end-1]))

    if length(knots) < 2
        error("Error: Number of knots must be at least 2.")
    end

    return knots, length(knots) - degree - 1
end
