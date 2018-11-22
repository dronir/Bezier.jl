
module Bezier

export BezierCurve

struct BezierCurve
    Xcoef::Vector{Float64}
    Ycoef::Vector{Float64}
end

function Bezier(r0::Vector, r1::Vector, t0::Vector, t1::Vector)
    X = bezier_coefs(r0[1], r1[1], t0[1], t1[1])
    Y = bezier_coefs(r0[2], r1[2], t0[2], t1[2])
    return Bezier(X, Y)
end

function (curve::Bezier)(t::Real)
    out = zeros(2)
    for i = 1:4
        out[1] += curve.Xcoef[i] * t^(4-i)
        out[2] += curve.Ycoef[i] * t^(4-i)
    end
    return out
end


# Give coefficients of one Bezier curve component
function bezier_coefs(x0::Real, x1::Real, t0::Real, t1::Real)
    a = 2(x0-x1) + t1 + t0
    b = 3(x1-x0) - t1 - 2t0
    c = t0
    d = x0
    return [a,b,c,d]
end



end # module
