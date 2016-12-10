local PANEL = {
	Init = function( self )

	self:SetSize( 720, 500)
	self:Center()
	self:SetVisible(true)
	self:MakePopup()

	local x, y = self:GetSize()

	local button = vgui.Create( "DButton", self ) // Close button
	button:SetText( "Close" )
	button:SetSize( 50, 30)
	button:SetPos( x - 50, 0)
	function button:Paint( w, h )
		if( button:IsDown() ) then
			button:SetColor( Color( 150, 255, 150 ) )
		elseif( button:IsHovered() ) then 
			button:SetColor( Color( 200, 255, 200 ) )
		else
			button:SetColor( Color( 255, 255, 255 ) )
		end
	end
	button.DoClick = function()
		self:SetVisible( false )
	end

	local framename = vgui.Create( "DLabel", self )
	framename:SetFont( "DermaLarge" )
	framename:SetText( "PowerBattle F4 Menu" )
	framename:SetPos( 4, 4 )
	framename:SizeToContents()

	

	local mainpanel = vgui.Create( "DPanel", self )
	mainpanel:SetPos( 3, 35 )
	mainpanel:SetSize( x - 6, y - 35 - 3 )
	mainpanel.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 100, 100, 100, 100 ) )
	end

	local colsheet = vgui.Create( "DColumnSheet", mainpanel )
	colsheet:Dock( FILL )


// MAIN MENU
	local mainmenu = vgui.Create( "DPanel", colsheet)
	mainmenu:Dock( FILL )
	mainmenu.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 10, 10, 10, 100 ) )
	end
	colsheet:AddSheet( "Power Ups", mainmenu, "icon16/box.png" )
	
	local button = vgui.Create( "DButton", self ) // Close button
	button:SetText( "Receive powerup!" )
	button:SetSize( 50, 30)
	button:SetPos( x - 50, 0)
	-- function button:Paint( w, h )
	-- 	if( button:IsDown() ) then
	-- 		button:SetColor( Color( 150, 255, 150 ) )
	-- 	elseif( button:IsHovered() ) then 
	-- 		button:SetColor( Color( 200, 255, 200 ) )
	-- 	else
	-- 		button:SetColor( Color( 255, 255, 255 ) )
	-- 	end
	-- end
	button.DoClick = function()
		net.Start("getpowerup")
		net.SendToServer()
	end
// END MAIN MENU


end,

	Paint = function( self, w, h)

		draw.RoundedBox( 0, 0, 0, w, h, Color( 10, 10, 10, 150 ) )
		surface.SetDrawColor( 255, 255, 255, 255)

	end
	
}
vgui.Register( "f4_menu", PANEL )