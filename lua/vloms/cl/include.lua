local function VAddLuaFile( file ) 

	print( file )
	AddCSLuaFile( file )

end

VAddLuaFile('vloms/cl/cl_init.lua')
VAddLuaFile('vloms/cl/cl_net.lua')
VAddLuaFile('vloms/cl/cl_perks.lua')
VAddLuaFile('vloms/cl/ui/fonts.lua')
VAddLuaFile('vloms/cl/ui/cl_hud.lua')

// Resources

resource.AddFile('sound/vloms/yay.wav')