
using MathOptInterface
const MOI = MathOptInterface
const MOIU = MOI.Utilities

using SemidefiniteOptInterface
const SOI = SemidefiniteOptInterface

SOI.getnumberofconstraints(opt::SOI.SOItoMOIBridge) = opt.nconstrs
SOI.getnumberofblocks(opt::SOI.SOItoMOIBridge) = opt.nblocks
SOI.getblockdimension(opt::SOI.SOItoMOIBridge, blk) = opt.blockdims[blk]
SOI.getconstraintconstant(opt::SOI.SOItoMOIBridge, c)
SOI.getobjectivecoefficients()
SOI.getconstraintcoefficients()
