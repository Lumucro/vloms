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
Vinclude('vloms/core/level.lua')
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
	MODULES
*/

print('\n*Loading Modules\n')

VLoadModules()

print('\n----------------------------------------')
print('----------------------------------------\n')