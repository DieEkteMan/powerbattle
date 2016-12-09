AddCSLuaFile( "cl_init.lua")
AddCSLuaFile( "shared.lua")
util.AddNetworkString( 'openteammenu' )
include( "shared.lua")


function GM:PlayerInitialSpawn(ply)
		net.Start( 'openteammenu' )
		net.Send ( ply )
		ply:ChatPrint("Welcome to our Power Battle Server!")
end

function GM:PlayerLoadout(ply)

	if ply:Team() == 1 then 
		ply:Give( "weapon_physcannon" )
	end
end


function team_1(ply)
	ply:SetTeam(1)
	ply:ChatPrint("You've been put into the playing team!")
end

function team_2(ply)
	ply:SetTeam(2)
	ply:ChatPrint("You are now spectating")
end

concommand.Add( "team_1", team_1 ) 
concommand.Add( "team_2", team_2 )