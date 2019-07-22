using Convex

using MathOptInterface
const MOI = MathOptInterface
const MOIU = MOI.Utilities

using SparseArrays

using SDPA

using SemidefiniteOptInterface

x = Variable(2,2)
p = minimize(sum(diag(x,1)), x >= 1)
opt = SDPA.Optimizer()
Convex.solve!(p, opt)
MOI.write(opt, "test.sdpa")
