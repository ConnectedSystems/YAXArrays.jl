__precompile__()

"""
## The Earth System Data Cube
![](http://earthsystemdatacube.net/wp-content/uploads/2015/07/EarthDataCube3.png "The DataCube")

Some info on the project...
"""
module CABLAB
export Cube, getCubeData,readCubeData,CubeMem,CubeAxis, TimeAxis, VariableAxis, LonAxis, FitAxis, LatAxis, CountryAxis, SpatialPointAxis, saveCube, loadCube,
        RangeAxis, CategoricalAxis, MSCAxis, getSingVal, TimeScaleAxis, QuantileAxis, MethodAxis, RemoteCube #From Cube module
export registerDATFunction, mapCube, reduceCube, getAxis #From DAT module
export axVal2Index, plotTS, plotMAP, plotXY #From Plot module
export DAT_detectAnomalies!, removeMSC, gapFillMSC, normalizeTS,DATfitOnline,
  sampleLandPoints, toPointAxis, getMSC, filterTSFFT, getNpY,timespacequantiles,timelonlatquantiles, getMedSC #From Proc module
export TempCube, openTempCube # From CachedArrays

global const workdir=String["./"]
haskey(ENV,"CABLAB_WORKDIR") && (workdir[1]=ENV["CABLAB_WORKDIR"])
CABLABdir(x::String)=workdir[1]=x
CABLABdir()=workdir[1]
export CABLABdir

include("CABLABTools.jl")
include("Cubes/Cubes.jl")
include("CubeAPI/CubeAPI.jl")
include("DAT/DAT.jl")
include("Proc/Proc.jl")
include("Plot/Plot.jl")

import Vega.VegaVisualization
import Vega.patchwork_repr
#Patch Vega
function Base.show(io::IO, m::MIME"text/html", v::VegaVisualization)
    show(io, m, patchwork_repr(v))
end

importall .Cubes, .CubeAPI, .DAT, .Proc, .Plot

end # module
