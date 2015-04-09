local CATEGORY_NAME = "Vloms - XP Tools"

/*
	GIVE XP
*/

function ulx.givexp( calling_ply, target_plys, amount )

	local affected_plys = {}

	for i=1, #target_plys do
		local v = target_plys[ i ]
			v:VGiveXP( amount )
			table.insert( affected_plys, v )
	end

	ulx.fancyLogAdmin( calling_ply, "#A gave #T #i experience", affected_plys, amount )

end

local givexp = ulx.command( CATEGORY_NAME, "ulx givexp", ulx.givexp, "!givexp" )
givexp:addParam{ type=ULib.cmds.PlayersArg }
givexp:addParam{ type=ULib.cmds.NumArg, min=0, default=0, hint="experience", ULib.cmds.optional, ULib.cmds.round }
givexp:defaultAccess( ULib.ACCESS_SUPERADMIN )
givexp:help( "Grants target(s) given amount of experience" )

/*
	SET XP
*/

function ulx.setxp( calling_ply, target_plys, amount )

	local affected_plys = {}

	for i=1, #target_plys do
		local v = target_plys[ i ]
			v:VSetXP( amount )
			table.insert( affected_plys, v )
	end

	ulx.fancyLogAdmin( calling_ply, "#A set experience of #T to #i", affected_plys, amount )

end

local setxp = ulx.command( CATEGORY_NAME, "ulx setxp", ulx.setxp, "!setxp" )
setxp:addParam{ type=ULib.cmds.PlayersArg }
setxp:addParam{ type=ULib.cmds.NumArg, min=0, default=0, hint="experience", ULib.cmds.optional, ULib.cmds.round }
setxp:defaultAccess( ULib.ACCESS_SUPERADMIN )
setxp:help( "Sets target(s) experience to given amount" )

/*
	GIVE LEVEL
*/

function ulx.givelvl( calling_ply, target_plys, amount )

	local affected_plys = {}

	for i=1, #target_plys do
		local v = target_plys[ i ]
			v:VGiveLevel( amount )
			table.insert( affected_plys, v )
	end

	ulx.fancyLogAdmin( calling_ply, "#A gave #T #i levels", affected_plys, amount )

end

local givelvl = ulx.command( CATEGORY_NAME, "ulx givelvl", ulx.givelvl, "!givelvl" )
givelvl:addParam{ type=ULib.cmds.PlayersArg }
givelvl:addParam{ type=ULib.cmds.NumArg, min=0, default=0, hint="levels", ULib.cmds.optional, ULib.cmds.round }
givelvl:defaultAccess( ULib.ACCESS_SUPERADMIN )
givelvl:help( "Give target(s) given amount of levels" )

/*
	SET LEVEL
*/

function ulx.setlvl( calling_ply, target_plys, amount )

	local affected_plys = {}

	for i=1, #target_plys do
		local v = target_plys[ i ]
			v:VSetLevel( amount )
			table.insert( affected_plys, v )
	end

	ulx.fancyLogAdmin( calling_ply, "#A set level of #T to #i", affected_plys, amount )

end

local setlvl = ulx.command( CATEGORY_NAME, "ulx setlvl", ulx.setlvl, "!setlvl" )
setlvl:addParam{ type=ULib.cmds.PlayersArg }
setlvl:addParam{ type=ULib.cmds.NumArg, min=0, default=0, hint="levels", ULib.cmds.optional, ULib.cmds.round }
setlvl:defaultAccess( ULib.ACCESS_SUPERADMIN )
setlvl:help( "Sets target(s) level to given amount" )

/*
	RESET USER
*/

function ulx.reset( calling_ply, target_plys )

	local affected_plys = {}

	for i=1, #target_plys do
		local v = target_plys[ i ]
			v:VReset( amount )
			table.insert( affected_plys, v )
	end

	ulx.fancyLogAdmin( calling_ply, "#A reset xp and level of #T", affected_plys )

end

local reset = ulx.command( CATEGORY_NAME, "ulx reset", ulx.reset, "!reset" )
reset:addParam{ type=ULib.cmds.PlayersArg }
reset:defaultAccess( ULib.ACCESS_SUPERADMIN )
reset:help( "Resets target(s)' level and xp" )

/*
	GET USER STATS
*/

function ulx.stats( calling_ply, target_plys )

	local affected_plys = {}

	for i=1, #target_plys do
		local v = target_plys[ i ]
			calling_ply:ChatPrint('VIEWING STATS OF ' .. v:Nick() .. ' (' .. v:SteamID() .. ')')
		 	calling_ply:ChatPrint('Level: ' .. v.vlomslvl)
		 	calling_ply:ChatPrint('XP: ' .. v.vlomsxp)
			table.insert( affected_plys, v )
	end

	ulx.fancyLogAdmin( calling_ply, "#A is looking at the stats of #T", affected_plys )

end

local stats = ulx.command( CATEGORY_NAME, "ulx stats", ulx.stats, "!stats" )
stats:addParam{ type=ULib.cmds.PlayersArg }
stats:defaultAccess( ULib.ACCESS_ADMIN )
stats:help( "Print player(s)' stats to chat" )

/*
	GET ALL USER STATS
*/

function ulx.getstats( calling_ply )

	local affected_plys = {}

	calling_ply:PrintMessage(HUD_PRINTCONSOLE, '\n')

	for k,v in pairs(player.GetAll()) do
		calling_ply:PrintMessage(HUD_PRINTCONSOLE, '--VIEWING STATS OF ' .. v:Nick() .. ' (' .. v:SteamID() .. ')--')
		calling_ply:PrintMessage(HUD_PRINTCONSOLE, 'Level: ' .. v.vlomslvl)
		calling_ply:PrintMessage(HUD_PRINTCONSOLE, 'XP: ' .. v.vlomsxp)
	end

	calling_ply:PrintMessage(HUD_PRINTCONSOLE, '\n')

	ulx.fancyLogAdmin( calling_ply, "#A is looking at everyone's stats" )

end

local getstats = ulx.command( CATEGORY_NAME, "ulx getstats", ulx.getstats, "!getstats" )
getstats:defaultAccess( ULib.ACCESS_ADMIN )
getstats:help( "Print everyone's stats to your console" )

/*
	GET USER LEVEL - for regular players
*/

function ulx.viewlevel( calling_ply, target_plys )

	local affected_plys = {}

	for i=1, #target_plys do
		local v = target_plys[ i ]
		 	calling_ply:ChatPrint(v:Nick() .. ' is level ' .. v.vlomslvl)
			table.insert( affected_plys, v )
	end

	ulx.fancyLogAdmin( calling_ply, "#A is looking at the level of #T", affected_plys )

end

local viewlevel = ulx.command( CATEGORY_NAME, "ulx viewlevel", ulx.viewlevel, "!viewlevel" )
viewlevel:addParam{ type=ULib.cmds.PlayersArg }
viewlevel:defaultAccess( ULib.ACCESS_ALL )
viewlevel:help( "Print player(s)' level to chat" )