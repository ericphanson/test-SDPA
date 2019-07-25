using Convex

using MathOptInterface
const MOI = MathOptInterface
const MOIU = MOI.Utilities

using SparseArrays

using SDPA
import LinearAlgebra.I
using SemidefiniteOptInterface
const SDOI = SemidefiniteOptInterface

eye(n) = Matrix(1.0I, n, n)

x = Variable(2,2)
p = minimize(sum(diag(x,1)), x >= 1)
opt = SDPA.Optimizer()
Convex.solve!(p, opt)
mock = SDOI.MockSDOptimizer{Float64}()
mock_optimizer = SDOI.SDOIOptimizer(mock, Float64)
Convex.solve!(p, mock_optimizer)
MOI.write(mock_optimizer, "test.sdpa")

x = [1, 2, 3]
P = Variable(3, 3)
p = minimize(matrixfrac(x, P), P <= 2*eye(3), P >= 0.5 * eye(3))
MOI.empty!(mock_optimizer)

x = Semidefinite(3)
p = minimize(sumlargesteigs(x, 2), x >= 1)
solve!(p, mock_optimizer)
