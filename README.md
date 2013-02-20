
# Julia functions for computing a Bezier curve

```
using Winston

x0 = [0.0, 0.0] # start point
x1 = [1.0, 0.0] # end point
t0 = [0.0, 2.0] # starting tangent vector
t1 = [0.0, 2.0] # end tangent vector

T = linspace(0.0, 1.0, 100)

curve = bezier_curve(T, x0, x1, t0, t1)
plot(curve[:,1], curve[:,2])
```
