// Function to calculate required XP

function VCalcXPReq(lvl)

	return (lvl * 20 + (lvl+1)^2)

end

if SERVER then

	include('vloms/core/sv_init.lua')

elseif CLIENT then
	
	include('vloms/cl/cl_init.lua')

end