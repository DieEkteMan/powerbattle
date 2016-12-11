include( "shared.lua" )
include( "vgui/main_menu.lua")
include( "vgui/f4_menu.lua")
include( "vgui/df4_menu.lua" )
include( 'vgui/hud.lua' )
include( 'vgui/scoreboard.lua' )

function GM:ContextMenuOpen()
	return false
end

local function DisallowSpawnMenu( )
	if not LocalPlayer():IsAdmin() then
		return false
	end
end
 
hook.Add( "SpawnMenuOpen", "DisallowSpawnMenu", DisallowSpawnMenu)
// F2 Menu
net.Receive("f2menu", function()
	if( !MainMenu ) then
		MainMenu = vgui.Create( "main_menu")
		MainMenu:SetVisible(false)
	end

	if( MainMenu:IsVisible() ) then
		MainMenu:SetVisible( false )
	else
		MainMenu:SetVisible( true )
	end

end)

// F4 Menu
net.Receive("f4menu", function()
	if( !F4Menu ) then
		F4Menu = vgui.Create( "f4_menu")
		F4Menu:SetVisible(false)
	end

	if( F4Menu:IsVisible() ) then
		F4Menu:SetVisible( false )
	else
		F4Menu:SetVisible( true )
	end

end)
// Donator F4
net.Receive("df4menu", function()
	if( !DF4Menu ) then
		DF4Menu = vgui.Create( "df4_menu")
		DF4Menu:SetVisible(false)
	end

	if( DF4Menu:IsVisible() ) then
		DF4Menu:SetVisible( false )
	else
		DF4Menu:SetVisible( true )
	end

end)

net.Receive("welcomemsg", function()
	local ply = LocalPlayer()
	chat.AddText( Color( 100, 100, 255 ), "Welcome to our Power Battle Server! We hope you enjoy your stay!")
end)