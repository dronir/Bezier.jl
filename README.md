
# Julia functions for computing a Bezier curve

```
using Winston
using Bezier

x0 = [0.0, 0.0] # start point
x1 = [1.0, 0.0] # end point
t0 = [0.0, 2.0] # starting tangent vector
t1 = [0.0, 2.0] # end tangent vector

T = linspace(0.0, 1.0, 100)

curve = bezier_curve(T, x0, x1, t0, t1)
plot(curve[:,1], curve[:,2])
```

The Bezier curve between `x0` and `x1` is drawn as `T` goes from 0 to 1. 
`T` can be either a single `Real` value or a vector of `Real` values.
In the first case, a 2-element array is returned. In the second case,
an (N,2) array, where N is the length of `T`.
