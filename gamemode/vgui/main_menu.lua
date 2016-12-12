local PANEL = {
	Init = function( self )

	self:SetSize( 1000, 720)
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
	framename:SetText( "PowerBattle F2 Menu" )
	framename:SetPos( 4, 4 )
	framename:SizeToContents()

	





	local mainpanel = vgui.Create( "DPanel", self ) // ToDo: Rename sheets to their proper name instead of using sheet1 name it teammenu
	mainpanel:SetPos( 3, 35 )
	mainpanel:SetSize( x - 6, y - 35 - 3 )
	mainpanel.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 100, 100, 100, 100 ) )
	end

	local colsheet = vgui.Create( "DColumnSheet", mainpanel ) // Column Sheet
	colsheet:Dock( FILL )


	local mainmenu = vgui.Create( "DPanel", colsheet )
	mainmenu:Dock( FILL )
	mainmenu.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 10, 10, 10, 100 ) )
	end
	colsheet:AddSheet( "Main Menu", mainmenu, "icon16/box.png" )

	local mainmenulabel = vgui.Create( "DLabel", mainmenu )
	mainmenulabel:SetFont( "DermaLarge" )
	mainmenulabel:SetText( [[Welcome to our PowerBattle Server!
				This gamemode is all about moving around and killing the opponent.
				There will be added a better description later




				In order for you to get started head over to the team menu!       ]]	)
	mainmenulabel:SetPos( 0, 0)
	mainmenulabel:SizeToContents()
	mainmenulabel:SetContentAlignment(5)


	local sheet1 = vgui.Create( "DPanel", colsheet )
	sheet1:Dock( FILL )
	sheet1.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 10, 10, 10, 100 ) )
	end
	colsheet:AddSheet( "Team Menu", sheet1, "icon16/star.png" )


	local player = vgui.Create( "DButton", sheet1 ) // Team button
	player:SetFont("DermaLarge")
	player:SetText( "I would like to play!" )
	player:SetSize( 500, 175)
	player:SetPos( 200, 60)

	function player:Paint( w, h )
		if( player:IsDown() ) then
			player:SetColor( Color( 150, 255, 150 ) )
		elseif( player:IsHovered() ) then 
			player:SetColor( Color( 0, 255, 0 ) )
		else
			player:SetColor( Color( 255, 255, 255 ) )
		end

		draw.RoundedBox(4 ,0, 0, 500, 175, Color( 100, 100, 100, 100 ) )
		draw.RoundedBox(4 ,0, 0 , 500, 175, Color( 10, 10, 10, 100 ) )

	end

	player.DoClick = function()
		net.Start("player")
		net.SendToServer()
		self:SetVisible(false)
	end

	local spectator = vgui.Create( "DButton", sheet1 ) // Team Button
	spectator:SetFont("DermaLarge")
	spectator:SetText( "I would like to spectate." )
	spectator:SetSize( 500, 175)
	spectator:SetPos( 200, 450)

	function spectator:Paint( w, h )
		if( spectator:IsDown() ) then
			spectator:SetColor( Color( 255, 0, 0 ) )
		elseif( spectator:IsHovered() ) then 
			spectator:SetColor( Color( 255, 0, 0 ) )
		else
			spectator:SetColor( Color( 255, 255, 255 ) )
		end

		draw.RoundedBox(4 ,0, 0, 500, 175, Color( 100, 100, 100, 100 ) )
		draw.RoundedBox(4 ,0, 0 , 500, 175, Color( 10, 10, 10, 100 ) )

	end

	spectator.DoClick = function()
		net.Start("spectator")
		net.SendToServer()
		self:SetVisible(false)
	end








	local sheet2 = vgui.Create( "DPanel", colsheet )
	sheet2:Dock( FILL )
	sheet2.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 10, 10, 10, 100 ) )
	end
	colsheet:AddSheet( "Credits", sheet2, "icon16/heart.png" )

	// Add Credits here



	local sheet3 = vgui.Create( "DPanel", colsheet )
	sheet3:Dock( FILL )
	sheet3.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 10, 10, 10, 100 ) )
	end
	colsheet:AddSheet( "Change Log", sheet3, "icon16/wrench.png" )



	// Add changelog here



	local sheet4 = vgui.Create( "DPanel", colsheet )
	sheet4:Dock( FILL )
	sheet4.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 10, 10, 10, 100 ) )
	end
	colsheet:AddSheet( "Donate", sheet4, "icon16/money.png" )


	// Add donation shizzle here


	local sheet5 = vgui.Create( "DPanel", colsheet )
	sheet5:Dock( FILL )
	sheet5.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 10, 10, 10, 100 ) )
	end
	colsheet:AddSheet( "F.A.Q", sheet5, "icon16/comment.png" )

	// FAQ Shizzle here





	local staffsheet = vgui.Create( "DPanel", colsheet )
	staffsheet:Dock( FILL )
	staffsheet.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 10, 10, 10, 100 ) )
	end
	colsheet:AddSheet( "Staff", staffsheet, "icon16/shield.png" )

	// Add staff here




end,

	Paint = function( self, w, h)

		draw.RoundedBox( 0, 0, 0, w, h, Color( 10, 10, 10, 150 ) )
		surface.SetDrawColor( 255, 255, 255, 255)

	end
	
}
vgui.Register( "main_menu", PANEL )