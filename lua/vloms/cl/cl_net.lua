net.Receive( "VSendStats", function(length)

	local plystats = net.ReadTable()

	Vloms.XP = plystats['xp']
	Vloms.Level = plystats['lvl']

	Vloms.XPReq = VCalcXPReq(Vloms.Level)

end)

net.Receive( "VExperienceReceived", function(length)

	Vloms.XP = Vloms.XP + net.ReadInt( 16 )
	print(Vloms.XP)

end)

net.Receive( "VLevelUp", function(length)

	print('ding')

end)