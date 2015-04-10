local pm = FindMetaTable( 'Player' )

function pm:VFetchPerks()

	for i=1,#Vloms.Perks do
		
		if (self.vlomsperks == nil) then self.vlomsperks = {} end --Safety
		if (table.HasValue(self.vlomsperks, i)) then return end --Already has this perk loaded

		if (tonumber(Vloms.Perks[i]['lvl']) <= tonumber(self.vlomslvl)) then
			
			self.vlomsperks[#self.vlomsperks+1] = i

		end

	end

end