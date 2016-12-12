function HUD()
	local client = LocalPlayer()
	
	if !client:Alive() then
		return
	end
	
	draw.RoundedBox(6, 0, ScrH() - 100, 250, 100, Color(30, 30, 30, 230))
	
	draw.SimpleText('Health: '..client:Health()..'%','DermaDefaultBold', 10, ScrH() - 90, Color(255, 255, 255, 255), 0, 0)
	draw.RoundedBox(0, 10, ScrH() - 75, 100 * 2.25, 15, Color(255, 0, 0, 30))
	draw.RoundedBox(0, 10, ScrH() - 75, math.Clamp(client:Health(), 0, 100) * 2.25, 15, Color(204, 0, 0, 255))
	draw.RoundedBox(0, 10, ScrH() - 75, math.Clamp(client:Health(), 0, 100) * 2.25, 5, Color(204, 30, 30, 255))
	
	draw.SimpleText('Armor: '..client:Armor()..'%','DermaDefaultBold', 10, ScrH() - 45, Color(255, 255, 255, 255), 0, 0)
	draw.RoundedBox(0, 10, ScrH() - 30, 100 * 2.25, 15, Color(0, 0, 255, 30))
	draw.RoundedBox(0, 10, ScrH() - 30, math.Clamp(client:Armor(), 0, 100) * 2.25, 15, Color(0, 0, 255, 255))
	draw.RoundedBox(0, 10, ScrH() - 30, math.Clamp(client:Armor(), 0, 100) * 2.25, 5, Color(15, 15, 255, 255))
	
	draw.RoundedBox(6, 255, ScrH() -70, 125, 70, Color(30, 30, 30, 230))
	
	if(client:GetActiveWeapon():IsValid()) then
		local curWeapon = client:GetActiveWeapon():GetClass()
	
		if(client:GetActiveWeapon() :GetPrintName() !=nil) then
			draw.SimpleText(client:GetActiveWeapon():GetPrintName(), 'DermaDefaultBold', 260, ScrH() - 60, Color(255, 255, 255, 255), 0, 0)
		end
		
		if(curWeapon != 'pb_weapon_slinger') then
			if (client:GetActiveWeapon():Clip1() != -1) then 
				draw.SimpleText('Ammo: ' .. client:GetActiveWeapon():Clip1() .. '/' .. client:GetAmmoCount(client:GetActiveWeapon():GetPrimaryAmmoType()), 'DermaDefaultBold', 260, ScrH() - 40, Color(255, 255, 255, 255), 0, 0)
			else
				draw.SimpleText('Ammo: ' .. client:GetAmmoCount(client:GetActiveWeapon():GetPrimaryAmmoType()), 'DermaDefaultBold', 260, ScrH() - 40, Color(255, 255, 255, 255), 0, 0)
			end
			
			if (client:GetAmmoCount(client:GetActiveWeapon():GetSecondaryAmmoType()) > 0) then
				draw.SimpleText('Secondary: ' .. client:GetAmmoCount(client:GetActiveWeapon():GetSecondaryAmmoType()), 'DermaDefaultBold', 260, ScrH() - 25, Color(255, 255, 255, 255), 0, 0)
			end
		end
	end
end
hook.Add("HUDPaint", "TestHud", HUD)

local hide = {
	CHudHealth = true,
	CHudBattery = true,
	CHudAmmo = true,
	CHudSecondaryAmmo = true,
}

hook.Add( "HUDShouldDraw", "HideHUD", function( name )
	if ( hide[ name ] ) then return false end
end)