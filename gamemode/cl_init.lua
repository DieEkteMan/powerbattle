include( "shared.lua" )
include( "vgui/main_menu.lua")

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



	//net.Start("spectator")
    //net.SendToServer()