Vloms.Perks = {}
Vloms.PerksFunctions = {}

function VRegisterPerk( pcat, pname, plvl, pdesc, pfunc )

	local perkindex = #Vloms.Perks + 1

	Vloms.Perks[perkindex] = {}
	Vloms.Perks[perkindex]['cat'] = pcat
	Vloms.Perks[perkindex]['name'] = pname
	Vloms.Perks[perkindex]['lvl'] = plvl
	Vloms.Perks[perkindex]['desc'] = pdesc

	Vloms.PerksFunctions[perkindex] = pfunc --Seperate table because we don't send this to the client

end

function VLoadPerks()

	local fs, dirs = file.Find( 'vloms/perks/*', 'LUA' )

	for i=1,#fs do
		
		print( 'vloms/perks/' .. fs[i] )
		AddCSLuaFile( 'vloms/perks/' .. fs[i] )
		include( 'vloms/perks/' .. fs[i] )

	end

	for i=1, #dirs do

		local perks = file.Find( 'vloms/perks/' .. dirs[i] .. '/*.lua', 'LUA' )

		for perkid=1,#perks do
			
			print( 'vloms/perks/' .. dirs[i] .. '/' .. perks[perkid] )
			AddCSLuaFile( 'vloms/perks/' .. dirs[i] .. '/' .. perks[perkid] )
			include( 'vloms/perks/' .. dirs[i] .. '/' .. perks[perkid] )

		end
		
	end

end