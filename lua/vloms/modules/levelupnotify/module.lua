if SERVER then

	hook.Add("VPlayerLevelUp", "VNotifyOthersLevelUp", function(ply, lvl)

		for k,v in pairs(player.GetAll()) do
			v:ChatPrint(ply:Nick() .. ' has reached level ' .. lvl .. '!')
		end

	end)

end