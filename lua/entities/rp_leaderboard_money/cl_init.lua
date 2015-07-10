include('shared.lua')

function ENT:Draw()
	self:DrawModel()
	
	local pos = self:LocalToWorld( Vector( 1.5, 0, 0 ) )
	local rot = Angle( 0, 90, 90 )
	local ang = self:GetAngles()
	
	ang:RotateAroundAxis(ang:Right(), 	rot.x)
	ang:RotateAroundAxis(ang:Up(), 		rot.y)
	ang:RotateAroundAxis(ang:Forward(), rot.z)
	
	cam.Start3D2D( pos, ang, 0.5 )
		draw.RoundedBox( 0, -225, -120, 450, 250, leaderboardConfig.bg )
		draw.SimpleText( leaderboardConfig.title, "Trebuchet18", 0, -90, leaderboardConfig.titleColor, 1, 1 )
		
		if self:GetNWString( "1name", false ) then
			draw.RoundedBox( 0, -200, -75, 400, 25, leaderboardConfig.bgColors[1] )
			draw.SimpleText( self:GetNWString( "1name" ) .. " - $" .. string.Comma( self:GetNWString( "1wallet" ) ), "Trebuchet18", 0, -65, leaderboardConfig.textColors[1], 1, 1 )
		end
		
		if self:GetNWString( "2name", false ) then
			draw.RoundedBox( 0, -190, -45, 380, 25, leaderboardConfig.bgColors[2] )
			draw.SimpleText( self:GetNWString( "2name" ) .. " - $" .. string.Comma( self:GetNWString( "2wallet" ) ), "Trebuchet18", 0, -35, leaderboardConfig.textColors[2], 1, 1 )
		end
		
		if self:GetNWString( "3name", false ) then
			draw.RoundedBox( 0, -180, -15, 360, 25, leaderboardConfig.bgColors[3] )
			draw.SimpleText( self:GetNWString( "3name" ) .. " - $" .. string.Comma( self:GetNWString( "3wallet" ) ), "Trebuchet18", 0, -5, leaderboardConfig.textColors[3], 1, 1 )
		end
		
		if self:GetNWString( "4name", false ) then
			draw.RoundedBox( 0, -150, 25, 300, 25, leaderboardConfig.bgColors[4] )
			draw.SimpleText( self:GetNWString( "4name" ) .. " - $" .. string.Comma( self:GetNWString( "4wallet" ) ), "Trebuchet18", 0, 35, leaderboardConfig.textColors[4], 1, 1 )
		end
		
		if self:GetNWString( "5name", false ) then
			draw.RoundedBox( 0, -120, 55, 240, 25, leaderboardConfig.bgColors[4] )
			draw.SimpleText( self:GetNWString( "5name" ) .. " - $" .. string.Comma( self:GetNWString( "5wallet" ) ), "Trebuchet18", 0, 65, leaderboardConfig.textColors[4], 1, 1 )
		end
	cam.End3D2D()
end