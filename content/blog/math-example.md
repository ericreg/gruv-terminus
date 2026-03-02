+++
title = "Math Example"
date = 2026-03-02
description = "A tour of Riemannian surface theory: metrics, curvature, the Gauss-Bonnet theorem, holomorphic 1-forms, and the Uniformization theorem."

[taxonomies]
tags = ["mathematics", "geometry", "complex-analysis"]

[extra]
katex = true
+++

A **Riemann surface** is a one-dimensional complex manifold — which means it looks locally like
$\mathbb{C}$, but globally can have fascinating topology. The interplay between its complex
structure and the geometry of any compatible Riemannian metric is one of the richest areas of
modern mathematics.

## Riemannian Metrics and the Gaussian Curvature

A smooth Riemannian metric on a surface $\Sigma$ is a smoothly varying inner product on each
tangent space. In local isothermal coordinates $(x, y)$ it takes the conformally flat form

$$
g = e^{2\varphi(x,y)}\bigl(dx^2 + dy^2\bigr),
$$

where $\varphi : U \to \mathbb{R}$ is a smooth function called the **conformal factor**.

The **Gaussian curvature** $K$ of this metric is

$$
K = -e^{-2\varphi}\,\Delta\varphi,
$$

where $\Delta = \partial_{xx} + \partial_{yy}$ is the standard Laplacian. For the round unit
sphere, $e^{2\varphi} = \tfrac{4}{(1+r^2)^2}$ under stereographic projection, giving $K \equiv 1$.
The hyperbolic plane in the Poincaré disk model has $K \equiv -1$.

## The Gauss-Bonnet Theorem

The Gauss-Bonnet theorem is a profound global statement connecting curvature to topology. For a
compact Riemannian surface $(\Sigma, g)$ without boundary,

$$
\int_\Sigma K\, dA = 2\pi\,\chi(\Sigma),
$$

where $\chi(\Sigma) = 2 - 2g$ is the **Euler characteristic** of a surface of genus $g$, and
$dA = e^{2\varphi}\,dx\,dy$ is the area element.

For a surface with piecewise smooth boundary $\partial\Sigma$ and exterior angles $\theta_i$ at
each corner, the full theorem reads

$$
\int_\Sigma K\, dA + \int_{\partial\Sigma} \kappa_g\, ds + \sum_i \theta_i = 2\pi\,\chi(\Sigma),
$$

where $\kappa_g$ is the **geodesic curvature** of $\partial\Sigma$. This is the engine behind
results like "the angles of a triangle on the sphere sum to more than $\pi$."

## The Riemann Curvature Tensor

On a general Riemannian manifold $(M, g)$, curvature is encoded by the **Riemann curvature
tensor** $R$. Given vector fields $X, Y, Z$, it is defined by

$$
R(X, Y)Z = \nabla_X\nabla_Y Z - \nabla_Y\nabla_X Z - \nabla_{[X,Y]}Z,
$$

where $\nabla$ is the Levi-Civita connection. In local coordinates the components are

$$
R^l{}_{kij} = \partial_i\Gamma^l_{jk} - \partial_j\Gamma^l_{ik}
  + \Gamma^l_{i m}\Gamma^m_{jk} - \Gamma^l_{j m}\Gamma^m_{ik}.
$$

In dimension two, all the information in $R$ reduces to the single scalar $K$: specifically,

$$
R_{ijkl} = K\,(g_{ik}g_{jl} - g_{il}g_{jk}).
$$

## Holomorphic 1-Forms and Their Periods

The complex structure on a compact Riemann surface $\Sigma_g$ of genus $g$ gives a
$g$-dimensional $\mathbb{C}$-vector space $\Omega^1(\Sigma_g)$ of **holomorphic 1-forms**
(also called abelian differentials of the first kind). Choose a symplectic basis
$\{a_1, \ldots, a_g, b_1, \ldots, b_g\}$ for $H_1(\Sigma_g; \mathbb{Z})$ with

$$
a_i \cdot b_j = \delta_{ij}, \qquad a_i \cdot a_j = b_i \cdot b_j = 0.
$$

Normalise a basis $\{\omega_1, \ldots, \omega_g\}$ of $\Omega^1(\Sigma_g)$ by requiring

$$
\oint_{a_i} \omega_j = \delta_{ij}.
$$

The **period matrix** $\Omega \in \mathrm{Mat}_{g \times g}(\mathbb{C})$ is then defined by

$$
\Omega_{ij} = \oint_{b_i} \omega_j.
$$

By Riemann's bilinear relations, $\Omega$ is symmetric and its imaginary part $\mathrm{Im}(\Omega)$
is positive definite. The associated **Jacobian variety** is the complex torus

$$
J(\Sigma_g) = \mathbb{C}^g / (\mathbb{Z}^g + \Omega\mathbb{Z}^g),
$$

and the **Abel-Jacobi map** $\Sigma_g \to J(\Sigma_g)$, $p \mapsto \left(\int_{p_0}^p \omega_j\right)_j$,
is an embedding for $g \geq 1$.

## The Uniformization Theorem

Every simply connected Riemann surface is biholomorphic to exactly one of:

$$
\hat{\mathbb{C}} = \mathbb{C} \cup \{\infty\}, \quad \mathbb{C}, \quad \text{or} \quad \mathbb{H} = \{z \in \mathbb{C} : \mathrm{Im}(z) > 0\}.
$$

These carry, respectively, constant curvatures $K = +1$, $K = 0$, and $K = -1$.

A compact Riemann surface $\Sigma_g$ is therefore uniformised by:

| Genus | Universal cover | Curvature |
|-------|-----------------|-----------|
| $g = 0$ | $\hat{\mathbb{C}}$ (sphere) | $K > 0$ |
| $g = 1$ | $\mathbb{C}$ (flat torus) | $K = 0$ |
| $g \geq 2$ | $\mathbb{H}$ (hyperbolic plane) | $K < 0$ |

The hyperbolic case is the generic one: every compact surface of genus $g \geq 2$ admits a
unique (up to isometry) hyperbolic metric of constant curvature $K = -1$, and the moduli space
$\mathcal{M}_g$ of such structures has (real) dimension $6g - 6$.

## The Prescribed Curvature Equation

Given a compact Riemann surface $(\Sigma, g_0)$ and a smooth function $f : \Sigma \to \mathbb{R}$,
one asks: does there exist a conformally equivalent metric $g = e^{2u}g_0$ with $K_g = f$?
Writing $K_0$ for the curvature of $g_0$, the conformal change formula gives

$$
\Delta_{g_0} u = K_0 - f\,e^{2u},
$$

the **Kazdan-Warner equation**. By the Gauss-Bonnet theorem, a necessary condition is that
$\int_\Sigma f\,dA$ has the same sign as $\chi(\Sigma)$. Existence (and uniqueness) results
in each of the three cases $\chi > 0$, $\chi = 0$, $\chi < 0$ form the core of the
**Uniformization theorem** via PDE.