// Load data on connect

hook.Add('PlayerInitialSpawn', 'VLoadOnConnect', function(ply)

	VLog('Loading data for ' .. ply:Nick() .. ' - ' .. ply:SteamID() .. ' (CONNECT)') --Log this
	ply:VLoadXP()

	ply:VFetchPerks()
	ply:VNetPerks() --Networking perks

end)

// Save data on disconnect

hook.Add('PlayerDisconnected', 'VSaveOnDisconnect', function(ply)

	VLog('Saving data for ' .. ply:Nick() .. ' - ' .. ply:SteamID() .. ' (DISCONNECT)') --Log this
	ply:VSaveXP()

end)

// Save data on shutdown or map change 

hook.Add('ShutDown', 'VSaveOnShutdown', function()

	VLog('Saving all player data (SHUTDOWN or MAPCHANGE)') --Log this

	for k,v in pairs(player.GetAll()) do
		v:VSaveXP()
	end

end)

// Perk stuff on spawn

hook.Add('PlayerSpawn', 'VPerksOnSpawn', function(ply)

	--Weird thing where player hasn't fully spawned yet and perks don't work, so add a 1 second delay
	timer.Simple( 1, function()

		for i=1,#ply.vlomsperks do
			
			Vloms.PerksFunctions[ply.vlomsperks[i]](ply)

		end

	end)

end)