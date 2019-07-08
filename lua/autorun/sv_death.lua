
if SERVER then
	local dsSound = Sound("DSdeath.wav")
	util.AddNetworkString( "StartDS" )
	hook.Add("PlayerDeath", "DSDS", function(ply) 

		ply:EmitSound(dsSound)
		net.Start( "StartDS" )
		net.WriteBool(true)
		net.Send( ply )
	end)
	hook.Add( "PlayerSpawn", "GalaxyPlayerSpawned", function( ply )
        net.Start( "StartDS" )
        net.WriteBool(false)
        net.Send( ply )
    end )
end
