Vloms.ResistancePerkOwners = {}

hook.Add('EntityTakeDamage', 'VDamageResistancePerk', function(target, dmginfo)

	if (table.HasValue(Vloms.ResistancePerkOwners, target)) then
		
		dmginfo:SetDamage( math.ceil( dmginfo:GetDamage() * 0.75 ) )

	end

end)

VRegisterPerk( false, 'Resistance', 30, 'You take 25% less damage', function( ply )

	Vloms.ResistancePerkOwners[#Vloms.ResistancePerkOwners+1] = ply

end)