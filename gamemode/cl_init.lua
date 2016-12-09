include( "shared.lua" )


// Derma menu to choose team
function set_team()
 
local frame = vgui.Create( "DFrame" )
frame:SetPos( ScrW() / 2, ScrH() / 2 ) 
frame:SetSize( 200, 210 )
frame:SetTitle( "Change Team" )
frame:SetVisible( true )
frame:SetDraggable( false )
frame:ShowCloseButton( true )
frame:MakePopup()
 
team_1 = vgui.Create( "DButton", frame )
team_1:SetPos( frame:GetTall() / 2, 5 )
team_1:SetSize( 50, 100 )
team_1:SetText( "Team 1" )
team_1.DoClick = function() 
    RunConsoleCommand( "team_1" )
end
 
team_2 = vgui.Create( "DButton", frame )
team_2:SetPos( frame:GetTall() / 2, 105 ) 
team_2:SetSize( 50, 100 )
team_2:SetText( "Team 2" )
team_2.DoClick = function()
    RunConsoleCommand( "team_2" )
end
 
end
net.Receive( "team_menu", set_team )