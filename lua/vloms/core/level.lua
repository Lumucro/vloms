/*
	LEVEL META
*/

local pm = FindMetaTable( 'Player' )

------------------------------
---------XP functions---------
------------------------------

function pm:VGiveXP( amount )

	if amount <= 0 then return end --No point

	//Give XP

	local newxp = self.vlomsxp + amount
	local xpreq = VCalcXPReq(self.vlomslvl)

	--Network it to the player
	self:VNetXPReceived( amount )

	if (newxp < xpreq) then

		self.vlomsxp = newxp

	else

		self:VLevelUp()
		self:VGiveXP(newxp - xpreq)

	end

	VLog('Gave ' .. self:Nick() .. ' (' .. self:SteamID() .. ') ' .. amount .. ' xp')

end

function pm:VSetXP( amount )

	if amount < 0 then return end --No point

	self.vlomsxp = amount

	--Network it
	self:VNetStats()

	VLog('Set xp of ' .. self:Nick() .. '(' .. self:SteamID() .. ')' .. ' to ' .. amount)

end

-------------------------------
---------LVL functions---------
-------------------------------

function pm:VGiveLevel( amount ) 

	if amount < 0 then return end --No point
	
	for i=1,amount do	
		self:VLevelUp()
	end

	VLog('Gave ' .. self:Nick() .. ' (' .. self:SteamID() .. ') ' .. amount .. ' level(s)')

end

function pm:VSetLevel( amount ) 

	if amount < 1 then return end --No point

	if (amount <= self.vlomslvl) then
		
		self.vlomslvl = amount

	else

		local diff = amount - self.vlomslvl

		for i=1,diff do
			self:VLevelUp()
		end

	end

end

------------------------------
----------RESET USER----------
------------------------------

function pm:VReset()

	self.vlomslvl = 1
	self.vlomsxp = 0

	self:VSaveXP()

	--Network it to the player
	self:VNetStats()

end

//

function pm:VLevelUp()

	self.vlomslvl = self.vlomslvl + 1
	self.vlomsxp = 0

	--Network it to the player
	self:VNetStats()
	self:VNetLevelUp( self.vlomslvl )

	VLog(self:Nick() .. '(' .. self:SteamID() .. ')' .. ' leveled up to lvl ' .. self.vlomslvl)

	hook.Run("VPlayerLevelUp", self, self.vlomslvl)

end