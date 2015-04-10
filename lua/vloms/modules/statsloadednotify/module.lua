if CLIENT then

	hook.Add('VClGotStats', 'VNotifyStatsLoaded', function( lvl )

		chat.AddText( Color(255, 165, 0, 255), 'Vloms loaded your stats successfully. Welcome to the server!' )

	end)

end