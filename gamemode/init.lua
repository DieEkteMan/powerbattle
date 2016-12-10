AddCSLuaFile( "cl_init.lua")
AddCSLuaFile( "shared.lua")
AddCSLuaFile( "vgui/main_menu.lua" )
include( "shared.lua")

// Network
util.AddNetworkString("f2menu")
util.AddNetworkString("player")
util.AddNetworkString("spectator")
-- util.AddNetworkString("checkchosen")
-- util.AddNetworkString("didntchoose")
util.AddNetworkString("welcomemsg")


function GM:PlayerInitialSpawn( ply ) // On the initial spawn we want to welcome to user and open up the team selecting menu
		ply:SetTeam(3)
		ply:Spectate(OBS_MODE_ROAMING) // Need to make a fix, this still doesnt set the player into Spectate.....

		net.Start("welcomemsg")
		net.Send(ply)

		net.Start("f2menu")
		net.Send(ply)
end

function GM:PlayerLoadout(ply) // Here you can change the loadout of the teams

	if ply:Team() == 1 then 
		ply:Give( "weapon_smg1" )
		ply:Give( "weapon_spiderman")
	elseif ply:Team() == 2 then
		ply:StripWeapons()
	end
end

function GM:PlayerSpawnProp( ply, model )
	if ( !ply:IsAdmin() ) then
		return false
	end
end

function GM:ShowTeam( ply )
		net.Start("f2menu")
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
		ply:ChatPrint("You are already spectating!")
	else
	ply:SetTeam(2);
	ply:StripWeapons();
 	ply:ChatPrint("You are now spectating");
 	ply:Spectate(OBS_MODE_ROAMING);
 	end
end

net.Receive("spectator", spectatorteam);
-- function checkifchosen( len, ply ) // Hmmm
-- 	if ply:Team() == 3 then
-- 		net.Start("didntchoose")
-- 		net.Send(ply)
-- 	else
-- 		return false;
-- end

-- net.Receive("checkchosen", checkifchosen)




local hooks = {
    "Effect",
    "NPC",
    "Prop",
    "Ragdoll",
    "SENT",
    "Vehicle"
}


for _, v in pairs (hooks) do


    hook.Add("PlayerSpawn"..v, "Disallow_user_"..v, function(client)
        if (client:IsUserGroup("admin") or client:IsUserGroup("superadmin")) then
            return true
        end
        
        return false
    end)
    
end