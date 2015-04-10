local function VAddLuaFile( file ) 

	print( file )
	AddCSLuaFile( file )

end

VAddLuaFile('vloms/cl/cl_init.lua')
VAddLuaFile('vloms/cl/cl_net.lua')
VAddLuaFile('vloms/cl/cl_perks.lua')
VAddLuaFile('vloms/cl/ui/fonts.lua')
VAddLuaFile('vloms/cl/ui/cl_hud.lua')
VAddLuaFile('vloms/cl/ui/cl_perksmenu.lua')

// Resources

resource.AddFile('sound/vloms/yay.wav')
resource.AddFile('materials/vloms/perklocked.png')
resource.AddFile('materials/vloms/perkunlocked.png')