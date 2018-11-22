using Bezier
using Test

x0 = [0.0, 0.0]
x1 = [1.0, 0.0]
t0 = [0.0, 1.0]
t1 = [0.0, -1.0]

@testset "Coefficients" begin
    B = BezierCurve(x0, x1, t0, t1)
    @test B.Xcoef ≈ [-2.0, 3.0, 0.0, 0.0]
    @test B.Ycoef ≈ [0.0, -1.0, 1.0, 0.0]
end

@testset "Start and end points" begin
    B = BezierCurve(x0, x1, t0, t1)
    @test B(0) ≈ x0
    @test B(1) ≈ x1
end

