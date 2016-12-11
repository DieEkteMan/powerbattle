local ScoreboardDerma = nil
local PlayerList = nil

function GM:ScoreboardShow(ply)
	if !IsValid(ScoreboardDerma) then
		ScoreboardDerma = vgui.Create('DFrame')
		ScoreboardDerma:SetSize(900,700)
		ScoreboardDerma:SetPos(ScrW() / 2 -450, ScrH() / 2 - 350)
		ScoreboardDerma:SetTitle('PowerBattle Gaming')
		ScoreboardDerma:SetDraggable(false)
		ScoreboardDerma:ShowCloseButton(false)
		ScoreboardDerma.Paint = function()
			draw.RoundedBox(5, 0, 0, ScoreboardDerma:GetWide(), ScoreboardDerma:GetTall(), Color(60, 60, 60, 200))
		end
		
		local PlayerScrollPanel = vgui.Create('DScrollPanel', ScoreboardDerma)
		PlayerScrollPanel:SetSize(ScoreboardDerma:GetWide(), ScoreboardDerma:GetTall() - 20)
		PlayerScrollPanel:SetPos(0, 20)
		
		PlayerList = vgui.Create('DListLayout', PlayerScrollPanel)
		PlayerList:SetSize(PlayerScrollPanel:GetWide(), PlayerScrollPanel:GetTall())
		PlayerList:SetPos(0, 0)
	end
	
	if IsValid(ScoreboardDerma) then
		PlayerList:Clear()
		
		for k, v in pairs(player.GetAll()) do
			local PlayerPanel = vgui.Create('DPanel', PlayerList)
			PlayerPanel:SetSize(PlayerList:GetWide(),50)
			PlayerPanel:SetPos(0, 0)
			PlayerPanel.Paint = function()
				draw.RoundedBox(0, 0, 0, PlayerPanel:GetWide(), PlayerPanel:GetTall(), Color(50, 50, 50, 255))
				draw.RoundedBox(0, 0, 49, PlayerPanel:GetWide(), 1, Color(255, 255, 255, 255))

				draw.SimpleText(v:GetName(),'Font1',20,15, Color(255,255,255))
				draw.SimpleText("Rank: "..v:GetUserGroup(), "Font2", 200, 15, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER)
				draw.SimpleText("Kills: "..v:Frags(), "Font3", PlayerList:GetWide() - 120, 10, Color( 255, 255, 255 ), TEXT_ALIGN_RIGHT)
				draw.SimpleText("Deaths: "..v:Deaths(), "Font3", PlayerList:GetWide() - 120, 25, Color( 255, 255, 255 ), TEXT_ALIGN_RIGHT)
				draw.SimpleText("Ping "..v:Ping(), "Font3", PlayerList:GetWide() - 15, 15, Color( 255, 255, 255 ), TEXT_ALIGN_RIGHT)
				if v:GetUserGroup() == "Founder" then
					surface.SetMaterial( Material("icon16/shield.png") )
					surface.DrawTexturedRect( PlayerList:GetWide() - 95, 15, 16, 16 )
				elseif v:GetUserGroup() == "SuperAdmin" then
					surface.SetMaterial( Material("icon16/star.png") )
					surface.DrawTexturedRect( PlayerList:GetWide() - 95, 15, 16, 16 )
				elseif v:GetUserGroup() == "Admin" then
					surface.SetMaterial( Material("icon16/medal_gold_3.png") )
					surface.DrawTexturedRect( PlayerList:GetWide() - 95, 15, 16, 16 )
				elseif v:GetUserGroup() == "Moderator" then
					surface.SetMaterial( Material("icon16/medal_bronze_3.png") )
					surface.DrawTexturedRect( PlayerList:GetWide() - 95, 15, 16, 16 )
				elseif v:GetUserGroup() == "Donator" then
					surface.SetMaterial( Material("icon16/heart.png") )
					surface.DrawTexturedRect( PlayerList:GetWide() - 95, 15, 16, 16 )
				elseif v:GetUserGroup() == "user" then
					surface.SetMaterial( Material("icon16/user.png") )
					surface.DrawTexturedRect( PlayerList:GetWide() - 95, 15, 16, 16 )
				end
				end
			end

	
		ScoreboardDerma:Show()
		ScoreboardDerma:MakePopup()
		ScoreboardDerma:SetKeyboardInputEnabled(false)
	end
end

function GM:ScoreboardHide()
	if IsValid(ScoreboardDerma) then
		ScoreboardDerma:Hide()
	end
end

surface.CreateFont( "Font1", {
	font = "Arial", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 19,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "Font2", {
	font = "Arial", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 17,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "Font3", {
	font = "Arial", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 15,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )