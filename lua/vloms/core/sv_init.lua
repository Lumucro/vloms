include('vloms/config.lua')

function Vinclude(file)

	--Fancy way of including so it prints to console
	print(file)
	include(file)

end

function VLog(msg)

	if !(Vloms.Logging) then return end

	print('VLOMS LOG: ' .. msg)

end

print('\n\n----------------------------------------')
print('---------Vloms v' .. Vloms.Version .. ' by Lumucro----------')
print('----------------------------------------\n')

/*
	CORE
*/

print('*Loading Core\n')

Vinclude('vloms/core/data/' .. Vloms.DataType .. '.lua')
Vinclude('vloms/core/meta/level.lua')

if (Vloms.PerksEnabled) then
	Vinclude('vloms/core/meta/perks.lua')
	Vinclude('vloms/core/perks.lua')
end

Vinclude('vloms/core/timers.lua')
Vinclude('vloms/core/hooks.lua')
Vinclude('vloms/core/modules.lua')
Vinclude('vloms/core/net.lua')

/*
	UI
*/

print('\n*Loading Clientside\n')

include('vloms/cl/include.lua')

/*
	PERKS
*/

print('\n*Loading Perks\n')

if (Vloms.PerksEnabled) then
	VLoadPerks()
else
	print('Perks disabled')
end

/*
	MODULES
*/

print('\n*Loading Modules\n')

VLoadModules()

print('\n----------------------------------------')
print('----------------------------------------\n')