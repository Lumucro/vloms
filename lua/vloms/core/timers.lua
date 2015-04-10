if (Vloms.AutoXP) then

	// Auto-XP timer
	
	timer.Create( 'VAutoXPTimer', Vloms.AutoXPInterval, 0, function()

		for k,v in pairs(player.GetAll()) do
			v:VGiveXP(Vloms.AutoXPAmount)
		end

	end)

end
