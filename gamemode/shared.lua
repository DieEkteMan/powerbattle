GM.Name = "Power Battle"
GM.Author = "DieEkteMan & Rowie"
GM.Email = "dedennisis@gmail.com & ro.mole68@gmail.com"
GM.Website = "N/A"


// Here we will add the teams we've got
team.SetUp( 1, "Player", Color( 125, 125, 125, 255 ) )
team.SetUp( 2, "Spectator", Color( 125, 125, 125, 255 ) )

function GM:Initialize()

end

function GM:PlayerInitialSpawn(ply)
		ply:SetTeam( 1 )
		ply:ChatPrint("Welcome to our Power Battle Server! You've been put into the player team.")
end

function GM:PlayerLoadout(ply)

	if ply:Team() == 1 then 
		ply:Give( "weapon_physcannon" )
	end
end