
# Julia functions for computing a Bezier curve

```
using Bezier
using Plots

x0 = [0.0, 0.0] # start point
x1 = [1.0, 0.0] # end point
t0 = [0.0, 2.0] # starting tangent vector
t1 = [0.0, 2.0] # end tangent vector

curve = BezierCurve(x0, x1, t0, t1)

T = range(0, 1 ; length=100)

points = [curve(t) for t in T]

points = hcat(points...)'

plot(points[:,1], points[:,2])

```

The Bezier curve `curve(t)` goes between `x0` and `x1` is drawn as `t` goes from 0 to 1. 
