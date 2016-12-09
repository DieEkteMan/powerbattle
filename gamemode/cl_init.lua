include( "shared.lua" )

// Derma menu to choose team
net.Receive("menu", function()
 
local frame = vgui.Create( "DFrame" )
frame:SetPos(500, 500) 
frame:SetSize( 500, 385 )
frame:SetTitle( "Change Team" )
frame:SetVisible( true )
frame:SetDraggable( false )
frame:ShowCloseButton( false )
frame:MakePopup()
 
team_1 = vgui.Create( "DButton", frame ) // Team 1 = 2 || Team 2 = 3
team_1:SetPos( frame:GetTall() / 2, 5 )
team_1:SetSize( 50, 100 )
team_1:SetText( "Player Team" )
team_1.DoClick = function() 
    net.Start("player")
    net.SendToServer()
    frame:Close()
end
 
team_2 = vgui.Create( "DButton", frame )
team_2:SetPos( frame:GetTall() / 2, 105 ) 
team_2:SetSize( 50, 100 )
team_2:SetText( "Spectate" )
team_2.DoClick = function()
    net.Start("spectator")
    net.SendToServer()
    frame:Close()
end

end)