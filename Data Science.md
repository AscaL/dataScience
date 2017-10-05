# Data Science

## Lesson 1 - Linear Regression


$$ y = \alpha x $$, $$ \alpha^* $$ is the secret
each of the point in the x axis will be moved at random
flip a coin $$10^6$$ times, heads +1, tails -1.
$$x = \sum$$ coinflips.
x/sqrt(n)

i take a gaussian distribution so the value is concentrated around 0

move points on x following gaussiand distrib
i have a cloud of points and i need to find $$\alpha$$ + random noise 
random noise is gaussian

least square method to find $$\alpha^*$$


Input: n points $$(x_i, y_i) ... (x_n, y_n)$$
Goal: come as close as possible to $$\alpha^*$$
To estimate how good out guess is look at:
- $$\sum |y_i - \alpha x_i|$$ sum of the distances $$ \epsilon(\alpha)$$
- $$\sum (y_i - \alpha x_i)^2$$ sum of the square of the distances

increasing the power of the error penalises my guess


if i expand least square i get:
$$\sum (y_i - \alpha x_i)^2$$ = $$\sum (y_i^2 + \alpha^2 x_i^2)^2 - 2x_iy_i\alpha$$ = $$\sum x_i^2 -2\sum(x_iy_i)\alpha + \sum(y^2)$$ then i compute the derivative = 0

in general the secret function y = f(x) + r
let's say f is a polynomial with degree <= k

Why least squares?
Maximum liklyhood: what i compute is the most likely explanation

Fair coin: H/T = 1/2
Biased coin: H/T = 2/10, 8/10

take one of them and flip it 10 times: T,T,T,T,T,T,T,T,T,T
P(fair) for that result is (1/2)^10
P(biased) (8/10)^10 

P(biased) is ~110 times more likely

we need to guess a line not starting at the origin, so:
$$y = \alpha^*x + \beta^* + r$$ 
Input: n points $$(x_i, y_i) ... (x_n, y_n)$$

$$L(\alpha, \beta) = \sum[y_i - \alpha x_i - \beta]^2 $$ = $$(\sum x_i)\alpha^2 + \beta^2 - 2(\sum x_i y_i)\alpha $$
is called **convex** (slice the curve, the surface is below the plane) so there is ***one*** minimum
need to find $$\alpha, \beta$$ that minimize it (lowest point of the valley)

GRADIENT: kind of the same as derivative, it will give me the minimum

Gradient = 0 

$$\delta L / \delta \alpha = 0$$
$$\delta L / \delta \beta = 0$$

let's say i got

$$ y = \theta_1 x^k + \theta_2 x^{k-1} + ... + \theta_k^* x + \theta_k^* x^k $$ 

Gradient descent to not do this, is too inefficient