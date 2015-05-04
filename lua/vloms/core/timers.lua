if (Vloms.AutoXP) then

	// Auto-XP timer
	
	timer.Create( 'VAutoXPTimer', Vloms.AutoXPInterval, 0, function()

		for k,v in pairs(player.GetAll()) do

			if (Vloms.GroupAutoXP && !Vloms.GroupAllXP) then

				v:VGiveXP(math.Round(Vloms.AutoXPAmount * v:VGetXPRate(), 1))

			else

				v:VGiveXP(Vloms.AutoXPAmount)

			end

		end

	end)

end
