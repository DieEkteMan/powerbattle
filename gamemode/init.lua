AddCSLuaFile( "cl_init.lua")
AddCSLuaFile( "shared.lua")
include( "shared.lua")


function GM:PlayerInitialSpawn(ply) // On the initial spawn we want to welcome to user and open up the team selecting menu
		ply:ConCommand("team_menu")
		ply:ChatPrint("Welcome to our Power Battle Server!")
end

function GM:PlayerLoadout(ply) // Here you can change the loadout of the teams

	if ply:Team() == 2 then 
		ply:Give( "weapon_smg1" )
		ply:Give( "weapon_spiderman")
	elseif ply:Team() == 3 then
		ply:Give()
	end
end

function GM:ShowTeam(ply)
	if ply:Team() == 1 then
		ply:ConCommand("team_menu")
	elseif ply:Team() == 2 then
		ply:ConCommand("spec_menu")
	elseif ply:Team() == 3 then
		ply:ConCommand("playermenu")
	end
end

function team_2(ply) // Team 1 
	ply:SetTeam(2)
	ply:ChatPrint("You've been put into the playing team!")
	ply:Spawn()
end

function team_3(ply) // Team 2
	ply:SetTeam(3)
	ply:StripWeapons()
	ply:ChatPrint("You are now spectating")
	ply:Spectate(OBS_MODE_ROAMING)
end

concommand.Add( "team_2", team_2 ) // Add command so the game knows what to do.
concommand.Add( "team_3", team_3 )