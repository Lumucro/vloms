Vloms = {}
Vloms.Perks = {}

Vloms.XP = 0
Vloms.XPReq = VCalcXPReq(1)
Vloms.Level = 1

// Includes

include('vloms/cl/cl_net.lua')
include('vloms/cl/cl_perks.lua')
include('vloms/cl/ui/fonts.lua')
include('vloms/cl/ui/cl_hud.lua')

// Include the modules, too

local fs,  dir = file.Find( 'vloms/modules/*', 'LUA' )

for i=1,#dir do
	
	include( 'vloms/modules/' .. dir[i] .. '/module.lua' )

end

// Update required XP on levelup

hook.Add("VClPlayerLevelUp", "VLevelUpReqXP", function( lvl )

	Vloms.XPReq = VCalcXPReq( lvl )

end)