#case 3
# x'' + 0.2x' + 10x = 0.5cos(2t)
using DifferentialEquations

function lorenz!(du, u, p, t)
    a, b = p
    du[1] = u[2]
    du[2] = -a*du[1] - b*u[1] + 0.5*cos(2*t)
end

const x = 0.4
const y = 2.1
u0 = [x, y]

p = (sqrt(1), 10)
tspan = (0.0, 51.0)
prob = ODEProblem(lorenz!, u0, tspan, p)
sol = solve(prob, dtmax = 0.05)

using Plots; gr()

#решение системы уравнений
plot(sol)
savefig("lab4_julia_3.png")

#фазовый портрет
plot(sol, vars=(2,1))
savefig("lab4_julia_3_phase.png")