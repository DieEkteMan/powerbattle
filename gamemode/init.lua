AddCSLuaFile( "cl_init.lua")
AddCSLuaFile( "shared.lua")
include( "shared.lua")

// Network
util.AddNetworkString("menu")
util.AddNetworkString("player")
util.AddNetworkString("spectator")



function GM:PlayerInitialSpawn(ply) // On the initial spawn we want to welcome to user and open up the team selecting menu
		//ply:Spectate(OBS_MODE_ROAMING)
		net.Start("menu")
		net.Send(ply)
		ply:ChatPrint("Welcome to our Power Battle Server!")
end

function GM:PlayerLoadout(ply) // Here you can change the loadout of the teams

	if ply:Team() == 1 then 
		ply:Give( "weapon_smg1" )
		ply:Give( "weapon_spiderman")
	elseif ply:Team() == 2 then
		ply:Give()
	end
end

function GM:ShowTeam( ply )
		net.Start("menu")
		net.Send( ply )
end

function playerteam( len, ply )
	if ply:Team() == 1 then
		ply:ChatPrint("You are already on this team!")
	else
	ply:SetTeam(1);
	ply:ChatPrint("You've been put into the playing team!");
	ply:Spawn();
	end
end

net.Receive("player",  playerteam ); // Team 1 

function spectatorteam( len, ply )
	if ply:Team() == 2 then
		ply:ChatPrint("You are already on this team!")
	else
	ply:SetTeam(2);
	ply:StripWeapons();
 	ply:ChatPrint("You are now spectating");
 	ply:Spectate(OBS_MODE_ROAMING);
end

net.Receive("spectator", spectatorteam);