AddCSLuaFile( "cl_init.lua")
AddCSLuaFile( "shared.lua")
AddCSLuaFile( "vgui/main_menu.lua" )
AddCSLuaFile( "vgui/f4_menu.lua" )
AddCSLuaFile( 'vgui/hud.lua' )
AddCSLuaFile( 'vgui/scoreboard.lua' )

include( "shared.lua")

// Network
util.AddNetworkString("f2menu")
util.AddNetworkString("f4menu")
util.AddNetworkString("player")
util.AddNetworkString("spectator")
util.AddNetworkString("getpowerup")
-- util.AddNetworkString("checkchosen")
-- util.AddNetworkString("didntchoose")
util.AddNetworkString("welcomemsg")

function GM:PlayerInitialSpawn( ply ) // On the initial spawn we want to welcome to user and open up the team selecting menu
		ply:SetTeam(3)
		ply:Spectate(OBS_MODE_ROAMING)

		net.Start("welcomemsg")
		net.Send(ply)

		net.Start("f2menu")
		net.Send(ply)
end

function GM:PlayerLoadout(ply) // Here you can change the loadout of the teams

	if ply:Team() == 1 then 
		ply:Give( "weapon_smg1" )
		ply:GiveAmmo(200, 'SMG1', true)
		//ply:Give( "weapon_spiderman")
	elseif ply:Team() == 2 then
		ply:StripWeapons()
	end
end

// F2 Menu
function GM:ShowTeam( ply )
		net.Start("f2menu")
		net.Send( ply )
end

// F4 Menu
function GM:ShowSpare2( ply )
		if ply:Team() == 3 or ply:Team() == 2 then
			ply:ChatPrint("Before you can access the Power Up menu you will have to be on the playing team first!")
		else
		net.Start("f4menu")
		net.Send( ply )
		end
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

-- function checkifchosen( len, ply )
-- 	if ply:Team() == 3 then
-- 		net.Start("didntchoose")
-- 		net.Send(ply)
-- 	else
-- 		return false;
-- end

-- net.Receive("checkchosen", checkifchosen)

function getpowerup( len, ply )
	ply:Give("pb_powerup_cloak")
	ply:ChatPrint( "Test")
end
net.Receive( "getpowerup", getpowerup)



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


