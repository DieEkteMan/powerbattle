AddCSLuaFile( "cl_init.lua")
AddCSLuaFile( "shared.lua")
AddCSLuaFile( "vgui/main_menu.lua" )
AddCSLuaFile( "vgui/f4_menu.lua" )
AddCSLuaFile( "vgui/df4_menu.lua" )
AddCSLuaFile( 'vgui/hud.lua' )
AddCSLuaFile( 'vgui/scoreboard.lua' )

include( "shared.lua")

// Network
util.AddNetworkString("f2menu")
util.AddNetworkString("f4menu")
util.AddNetworkString("df4menu")
util.AddNetworkString("player")
util.AddNetworkString("spectator")
util.AddNetworkString("getpowerup")
util.AddNetworkString("welcomemsg")

// Donator network strings
util.AddNetworkString("getcloak")
util.AddNetworkString("getjump")
util.AddNetworkString("getboost")
util.AddNetworkString("getprop")
util.AddNetworkString("getshrunken")



function GM:PlayerInitialSpawn( ply ) // On the initial spawn we want to welcome to user and open up the team selecting menu
		net.Start("welcomemsg")
		net.Send(ply)

		net.Start("f2menu")
		net.Send(ply)

		timer.Simple(2, function() 
		net.Start("spectator")
		net.Send(ply)
		end)
end

function GM:PlayerLoadout(ply) // Here you can change the loadout of the teams

	if ply:Team() == 1 then 
		ply:Give( "weapon_smg1" )
		ply:Give( "pb_weapon_slinger" )
		ply:GiveAmmo(200, 'SMG1', true)
	elseif ply:Team() == 2 then
		ply:StripWeapons()
	end
end

// F2 Menu
function GM:ShowTeam( ply ) // Might be fix? // Add damage support
		net.Start("f2menu")
		net.Send( ply )
end

// F4 Menu
function GM:ShowSpare2( ply )
		if ply:Team() == 3 or ply:Team() == 2 then
			ply:ChatPrint("Before you can access the Power Up menu you will have to be on the playing team first!")
		elseif
		ply:IsUserGroup("donator") then
		net.Start("df4menu")
		net.Send( ply )
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

function getpowerup( len, ply ) 
	if ply:HasWeapon( "pb_powerup_cloak" ) or ply:HasWeapon( "pb_powerup_speed" ) or ply:HasWeapon( "pb_powerup_jump" ) or ply:HasWeapon( "pb_powerup_prop" ) or ply:HasWeapon( "pb_powerup_shrink" ) then // This will be improved later on
		ply:ChatPrint("You still have a powerup left! Use it first before getting a new one!")
	else

	local number = math.random(1, 5)
		if number == 1 then
			ply:Give( "pb_powerup_cloak" )
		elseif number == 2 then
			ply:Give( "pb_powerup_speed" )
		elseif number == 3 then
			ply:Give( "pb_powerup_jump" )
		elseif number == 4 then
			ply:Give( "pb_powerup_prop" )
		elseif number == 5 then
			ply:Give( "pb_powerup_shrink" )
		end
	end
end
net.Receive( "getpowerup", getpowerup)


// DONATORS CAN CHOOSE WHICH POWERUPS THEY WOULD LIKE TO GET THEREFOR THERE HAVE TO BE MADE SINGLE MESSAGES
function getcloak( len, ply )
	if ply:HasWeapon( "pb_powerup_cloak" ) or ply:HasWeapon( "pb_powerup_speed" ) or ply:HasWeapon( "pb_powerup_jump" ) or ply:HasWeapon( "pb_powerup_prop" ) then // This will be improved later on
		ply:ChatPrint("You still have a powerup left! Use it first before getting a new one!")
	else
		ply:Give( "pb_powerup_cloak" )
	end
end
net.Receive( "getcloak", getcloak )



function getjump( len, ply )
	if ply:HasWeapon( "pb_powerup_cloak" ) or ply:HasWeapon( "pb_powerup_speed" ) or ply:HasWeapon( "pb_powerup_jump" ) or ply:HasWeapon( "pb_powerup_prop" ) then // This will be improved later on
		ply:ChatPrint("You still have a powerup left! Use it first before getting a new one!")
	else
		ply:Give( "pb_powerup_jump" )
	end
end
net.Receive( "getjump", getjump )



function getboost( len, ply )
	if ply:HasWeapon( "pb_powerup_cloak" ) or ply:HasWeapon( "pb_powerup_speed" ) or ply:HasWeapon( "pb_powerup_jump" ) or ply:HasWeapon( "pb_powerup_prop" ) then // This will be improved later on
		ply:ChatPrint("You still have a powerup left! Use it first before getting a new one!")
	else
		ply:Give( "pb_powerup_speed" )
	end
end
net.Receive( "getboost", getboost )



function getprop( len, ply )
	if ply:HasWeapon( "pb_powerup_cloak" ) or ply:HasWeapon( "pb_powerup_speed" ) or ply:HasWeapon( "pb_powerup_jump" ) or ply:HasWeapon( "pb_powerup_prop" ) then // This will be improved later on
		ply:ChatPrint("You still have a powerup left! Use it first before getting a new one!")
	else
		ply:Give( "pb_powerup_prop" )
	end
end
net.Receive( "getprop", getprop )

function shrink( len, ply )
	if ply:HasWeapon( "pb_powerup_cloak" ) or ply:HasWeapon( "pb_powerup_speed" ) or ply:HasWeapon( "pb_powerup_jump" ) or ply:HasWeapon( "pb_powerup_prop" ) then // This will be improved later on
		ply:ChatPrint("You still have a powerup left! Use it first before getting a new one!")
	else
		ply:Give( "pb_powerup_shrink" )
	end
end
net.Receive( "getshrunken", shrink )




local hooks = {
    "Effect",
    "NPC",
    "Prop",
    "Ragdoll",
    "SENT",
    "Vehicle"
}

for _, v in pairs (hooks) do // Disable spawning


    hook.Add("PlayerSpawn"..v, "Disallow_user_"..v, function(client)
        if (client:IsUserGroup("admin") or client:IsUserGroup("superadmin")) then
            return true
        end
        
        return false
    end)
    
end


