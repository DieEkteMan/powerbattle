include( "shared.lua" )
include( "vgui/main_menu.lua")


function GM:SpawnMenuEnabled() // Should disable the spawn menu
	return false;
end

function GM:SpawnMenuOpen()
	return true
end

function GM:ContextMenuOpen()
	return false
end

// Derma menu to choose team
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

net.Receive("welcomemsg", function()
	local ply = LocalPlayer()
	chat.AddText( Color( 100, 100, 255 ), "Welcome to our Power Battle Server! We hope you enjoy your stay!")
end)