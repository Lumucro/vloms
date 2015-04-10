// Function to calculate required XP

function VCalcXPReq(lvl)

	return math.ceil((lvl * 72 + ((lvl+3) * 1.5)^2))

end

if SERVER then

	include('vloms/core/sv_init.lua')

end

if CLIENT then
	
	include('vloms/cl/cl_init.lua')

end