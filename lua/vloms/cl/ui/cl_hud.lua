local ScreenW = ScrW()
local ScreenH = ScrH()

hook.Add("HUDPaint", "VBaseHUD", function()

	draw.RoundedBox( 12, 90, 8, 200, 24, Color(20, 120, 20, 255) )
	draw.RoundedBox( 12, ScreenW - 290, 8, 200, 24, Color(20, 120, 20, 255) )

	draw.RoundedBox( 10, ScreenW / 2 - 100, 2, 200, 20, Color(0, 80, 0, 255) )  --Background 
	draw.RoundedBox( 10, ScreenW / 2 - 60, 20, 120, 30, Color(0, 80, 0, 255) )  --Background 2

	draw.RoundedBox( 10, ScreenW / 2 - 98, 4, 196, 16, Color(0, 120, 0, 255) )  --Background 3
	draw.RoundedBox( 10, ScreenW / 2 - 58, 22, 116, 26, Color(0, 120, 0, 255) )  --Background 4

	draw.RoundedBox( 0, 100, 12, ScreenW - 200, 16, Color(0, 80, 0, 255) )  --Background 5
	draw.RoundedBox( 0, 102, 14, ScreenW - 204, 12, Color(190, 190, 190, 255) ) --Background 6

	// XP bar

	draw.RoundedBox( 0, 102, 14, math.Clamp((Vloms.XP / Vloms.XPReq * (ScreenW - 204)), 0, ScreenW - 204), 6, Color(20, 160, 20, 180) ) --Top, darker
	draw.RoundedBox( 0, 102, 20, math.Clamp((Vloms.XP / Vloms.XPReq * (ScreenW - 204)), 0, ScreenW - 204), 6, Color(20, 140, 20, 200) ) --Bot, lighter

	// Level text

	draw.DrawText('Lv. ' .. Vloms.Level, font2, ScreenW / 2, 30, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)

end)