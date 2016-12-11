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
			button:SetColor( Color( 0, 255, 0 ) )
		else
			button:SetColor( Color( 255, 255, 255 ) )
		end
	end
	button.DoClick = function()
		self:SetVisible( false )
	end

	local framename = vgui.Create( "DLabel", self )
	framename:SetFont( "DermaLarge" )
	framename:SetText( "PowerBattle Donator F4 Menu" )
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
	
	

	// Add powerup buttons here

	local button = vgui.Create( "DButton", self ) // Cloak
	button:SetFont("DermaDefault")
	button:SetText( "Cloak!" )
	button:SetDisabled(false)
	button:SetSize( 50, 50)
	button:SetPos( 135, 100)
	button:SetColor( Color( 0, 255, 0 ) )

	function button:Paint( w, h )
		draw.RoundedBox(4 ,0, 0, 50, 125, Color( 100, 100, 100, 100 ) )
		draw.RoundedBox(4 ,0, 0 , 50, 125, Color( 10, 10, 10, 100 ) )
	end

	button.DoClick = function()
		net.Start("getcloak")
		net.SendToServer()
		button:SetDisabled(true)
		self:SetVisible( false )
		button:SetColor( Color( 255, 0, 0 ) )
		timer.Simple(30, function() 
		 	button:SetDisabled(false)
		 	button:SetColor( Color( 0, 255, 0 ) )
		 end)
	end

///////////////////////////////////////////////////////////////////////////////////////

	local button = vgui.Create( "DButton", self ) // Jump
	button:SetFont("DermaDefault")
	button:SetText( "Jump Boost!" )
	button:SetDisabled(false)
	button:SetSize( 75, 50)
	button:SetPos( 135 + 82.5, 100)
	button:SetColor( Color( 0, 255, 0 ) )

	function button:Paint( w, h )
		draw.RoundedBox(4 ,0, 0, 75, 125, Color( 100, 100, 100, 100 ) )
		draw.RoundedBox(4 ,0, 0 , 75, 125, Color( 10, 10, 10, 100 ) )
	end

	button.DoClick = function()
		net.Start("getjump")
		net.SendToServer()
		button:SetDisabled(true)
		self:SetVisible( false )
		button:SetColor( Color( 255, 0, 0 ) )
		timer.Simple(30, function() 
		 	button:SetDisabled(false)
		 	button:SetColor( Color( 0, 255, 0 ) )
		 end)
	end

///////////////////////////////////////////////////////////////////////////////////////

	local button = vgui.Create( "DButton", self ) // Speed
	button:SetFont("DermaDefault")
	button:SetText( "Speed Boost!" )
	button:SetDisabled(false)
	button:SetSize( 75, 50)
	button:SetPos( 217.5 + 82.5 + 21.625, 100)
	button:SetColor( Color( 0, 255, 0 ) )

	function button:Paint( w, h )
		draw.RoundedBox(4 ,0, 0, 75, 125, Color( 100, 100, 100, 100 ) )
		draw.RoundedBox(4 ,0, 0 , 75, 125, Color( 10, 10, 10, 100 ) )
	end

	button.DoClick = function()
		net.Start("getboost")
		net.SendToServer()
		button:SetDisabled(true)
		self:SetVisible( false )
		button:SetColor( Color( 255, 0, 0 ) )
		timer.Simple(30, function() 
		 	button:SetDisabled(false)
		 	button:SetColor( Color( 0, 255, 0 ) )
		 end)
	end

///////////////////////////////////////////////////////////////////////////////////////

local button = vgui.Create( "DButton", self ) // Prophunt
	button:SetFont("DermaDefault")
	button:SetText( "Prophunt!" )
	button:SetDisabled(false)
	button:SetSize( 70, 50)
	button:SetPos( 300 + 82.5 + 41.25, 100)
	button:SetColor( Color( 0, 255, 0 ) )

	function button:Paint( w, h )
		draw.RoundedBox(4 ,0, 0, 70, 125, Color( 100, 100, 100, 100 ) )
		draw.RoundedBox(4 ,0, 0 , 70, 125, Color( 10, 10, 10, 100 ) )
	end

	button.DoClick = function()
		net.Start("getprop")
		net.SendToServer()
		button:SetDisabled(true)
		self:SetVisible( false )
		button:SetColor( Color( 255, 0, 0 ) )
		timer.Simple(30, function() 
		 	button:SetDisabled(false)
		 	button:SetColor( Color( 0, 255, 0 ) )
		 end)
	end

///////////////////////////////////////////////////////////////////////////////////////

local button = vgui.Create( "DButton", self ) // Shrink
	button:SetFont("DermaDefault")
	button:SetText( "Shrink!" )
	button:SetDisabled(false)
	button:SetSize( 70, 50)
	button:SetPos( 300 + 82.5 + 41.25 + 19.985, 100)
	button:SetColor( Color( 0, 255, 0 ) )

	function button:Paint( w, h )
		draw.RoundedBox(4 ,0, 0, 70, 125, Color( 100, 100, 100, 100 ) )
		draw.RoundedBox(4 ,0, 0 , 70, 125, Color( 10, 10, 10, 100 ) )
	end

	button.DoClick = function()
		net.Start("getshrunken")
		net.SendToServer()
		button:SetDisabled(true)
		self:SetVisible( false )
		button:SetColor( Color( 255, 0, 0 ) )
		timer.Simple(30, function() 
		 	button:SetDisabled(false)
		 	button:SetColor( Color( 0, 255, 0 ) )
		 end)
	end
	













	-- local button = vgui.Create( "DButton", self ) // Powerup button
	-- button:SetFont("DermaLarge")
	-- button:SetText( "Receive powerup!" )
	-- button:SetDisabled(false)
	-- button:SetSize( 375, 125)
	-- button:SetPos( 360 - 125, 100)
	-- button:SetColor( Color( 0, 255, 0 ) )

	-- function button:Paint( w, h )
	-- 	draw.RoundedBox(4 ,0, 0, 375, 125, Color( 100, 100, 100, 100 ) )
	-- 	draw.RoundedBox(4 ,0, 0 , 375, 125, Color( 10, 10, 10, 100 ) )
	-- end

	-- button.DoClick = function()
	-- 	net.Start("getpowerup")
	-- 	net.SendToServer()
	-- 	button:SetDisabled(true)
	-- 	self:SetVisible( false )
	-- 	button:SetColor( Color( 255, 0, 0 ) )
	-- 	timer.Simple(30, function() 
	-- 	 	button:SetDisabled(false)
	-- 	 	button:SetColor( Color( 0, 255, 0 ) )
	-- 	 end)
	-- end
// END MAIN MENU


end,

	Paint = function( self, w, h)

		draw.RoundedBox( 0, 0, 0, w, h, Color( 10, 10, 10, 150 ) )
		surface.SetDrawColor( 255, 255, 255, 255)

	end
	
}
vgui.Register( "df4_menu", PANEL )