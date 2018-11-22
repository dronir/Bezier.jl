
module Bezier

export bezier_curve

# Give coefficients of one Bezier curve component
function bezier_coefs(x0::Real, x1::Real, t0::Real, t1::Real)
    a = 2(x0-x1) + t1 + t0
    b = 3(x1-x0) - t1 - 2t0
    c = t0
    d = x0
    return (a,b,c,d)
end

# Give Bezier curve passing through points r0 and r1,
# with tangents t0 and t1, when t=0 and t=1, respectively.
# Single value t:
function bezier_curve{T<:Real}(t::Real, r0::Vector{T}, r1::Vector{T}, t0::Vector{T}, t1::Vector{T})
    a,b,c,d = bezier_coefs(r0[1], r1[1], t0[1], t1[1])
    e,f,g,h = bezier_coefs(r0[2], r1[2], t0[2], t1[2])
    out = zeros(2)
    out[1] = a*t^3 + b*t^2 + c*t + d
    out[2] = e*t^3 + f*t^2 + g*t + h
    return out
end

# Vector t:
function bezier_curve{S<:Real}(T::Vector{S}, r0::Vector{S}, r1::Vector{S}, t0::Vector{S}, t1::Vector{S})
    a,b,c,d = bezier_coefs(r0[1], r1[1], t0[1], t1[1])
    e,f,g,h = bezier_coefs(r0[2], r1[2], t0[2], t1[2])
    N = size(T,1)
    out = zeros(eltype(T), (N, 2))
    for i = 1:N
        t = T[i]
        out[i,1] =  a*t^3 + b*t^2 + c*t + d
        out[i,2] =  e*t^3 + f*t^2 + g*t + h
    end
    return out
end

end # module
