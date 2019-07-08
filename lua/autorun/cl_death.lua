if CLIENT then 
	surface.CreateFont( "DarkSoulsFont", {
		font = "times new Roman",
		size = 120
	} )

	CreateClientConVar( "ds_text", "YOU DIED", true, false )

	hook.Add("PlayerDeathSound", "DeFlatline", function() 
		return true 
	end)

	net.Receive( "StartDS", function()
        local Time = 0
		local Start = net.ReadBool()

        if Start then
            timer.Create( "DShud", 0.01, 50	, function()
                Time = Time + 4
            end)        
        end

        hook.Add( "HUDPaint", "DsScrean", function()
			if Start then
				surface.SetDrawColor( 0, 0, 0, Time )
				surface.DrawRect( 0,0,ScrW(), ScrH() )
				surface.SetDrawColor( 0, 0, 0, Time )
				surface.DrawRect( 0, ScrH() / 2 - 145, ScrW(), 169 )
				draw.DrawText( GetConVar( "ds_text"):GetString(), "DarkSoulsFont", ScrW() / 2, ScrH() / 2 - 120, Color(255, 0, 0, Time), TEXT_ALIGN_CENTER)
            end
        end )
    end )
end	
