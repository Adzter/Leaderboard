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
			draw.RoundedBox( 0, -215, -75, 215, 25, leaderboardConfig.bgColors[1] )
			draw.SimpleText( self:GetNWString( "1name" ) .. " - $" .. string.Comma( self:GetNWString( "1wallet" ) ), "Trebuchet18", -100, -65, leaderboardConfig.textColors[1], 1, 1 )
		end
		
		if self:GetNWString( "2name", false ) then
			draw.RoundedBox( 0, -215, -45, 215, 25, leaderboardConfig.bgColors[2] )
			draw.SimpleText( self:GetNWString( "2name" ) .. " - $" .. string.Comma( self:GetNWString( "2wallet" ) ), "Trebuchet18", -100, -35, leaderboardConfig.textColors[2], 1, 1 )
		end
		
		if self:GetNWString( "3name", false ) then
			draw.RoundedBox( 0, -215, -15, 215, 25, leaderboardConfig.bgColors[3] )
			draw.SimpleText( self:GetNWString( "3name" ) .. " - $" .. string.Comma( self:GetNWString( "3wallet" ) ), "Trebuchet18", -100, -5, leaderboardConfig.textColors[3], 1, 1 )
		end
		
		if self:GetNWString( "4name", false ) then
			draw.RoundedBox( 0, -215, 25, 215, 25, leaderboardConfig.bgColors[4] )
			draw.SimpleText( self:GetNWString( "4name" ) .. " - $" .. string.Comma( self:GetNWString( "4wallet" ) ), "Trebuchet18", -100, 35, leaderboardConfig.textColors[4], 1, 1 )
		end
		
		if self:GetNWString( "5name", false ) then
			draw.RoundedBox( 0, -215, 55, 215, 25, leaderboardConfig.bgColors[4] )
			draw.SimpleText( self:GetNWString( "5name" ) .. " - $" .. string.Comma( self:GetNWString( "5wallet" ) ), "Trebuchet18", -100, 65, leaderboardConfig.textColors[4], 1, 1 )
		end
		
		------------------------------------------------------------------------------------

		if self:GetNWString( "1timename", false ) then
			draw.RoundedBox( 0, 5, -75, 190, 25, leaderboardConfig.bgColors[1] )
			draw.SimpleText( self:GetNWString( "1timename" ), "Trebuchet18", 100, -67, leaderboardConfig.textColors[1], 1, 1 )
			draw.SimpleText( timeToStr( self:GetNWString( "1time" ) ), "leaderboardSmall", 100, -56, leaderboardConfig.textColors[1], 1, 1 )
		end
		
		if self:GetNWString( "2timename", false ) then
			draw.RoundedBox( 0, 5, -45, 190, 25, leaderboardConfig.bgColors[2] )
			draw.SimpleText( self:GetNWString( "2timename" ), "Trebuchet18", 100, -37, leaderboardConfig.textColors[2], 1, 1 )
			draw.SimpleText( timeToStr( self:GetNWString( "2time" ) ), "leaderboardSmall", 100, -26, leaderboardConfig.textColors[2], 1, 1 )
		end
		
		if self:GetNWString( "3timename", false ) then
			draw.RoundedBox( 0, 5, -15, 190, 25, leaderboardConfig.bgColors[3] )
			draw.SimpleText( self:GetNWString( "3timename" ), "Trebuchet18", 100, -7, leaderboardConfig.textColors[3], 1, 1 )
			draw.SimpleText( timeToStr( self:GetNWString( "3time" ) ), "leaderboardSmall", 100, 4, leaderboardConfig.textColors[3], 1, 1 )
		end
		
		if self:GetNWString( "4timename", false ) then
			draw.RoundedBox( 0, 5, 25, 190, 25, leaderboardConfig.bgColors[4] )
			draw.SimpleText( self:GetNWString( "4timename" ), "Trebuchet18", 100, 33, leaderboardConfig.textColors[4], 1, 1 )
			draw.SimpleText( timeToStr( self:GetNWString( "4time" ) ), "leaderboardSmall", 100, 45, leaderboardConfig.textColors[4], 1, 1 )
		end
		
		if self:GetNWString( "5timename", false ) then
			draw.RoundedBox( 0, 5, 55, 190, 25, leaderboardConfig.bgColors[4] )
			draw.SimpleText( self:GetNWString( "5timename" ), "Trebuchet18", 100, 63, leaderboardConfig.textColors[4], 1, 1 )
			draw.SimpleText( timeToStr( self:GetNWString( "5time" ) ), "leaderboardSmall", 100, 75, leaderboardConfig.textColors[4], 1, 1 )
		end
	cam.End3D2D()
end

function timeToStr( time )
	local tmp = time
	local s = tmp % 60
	tmp = math.floor( tmp / 60 )
	local m = tmp % 60
	tmp = math.floor( tmp / 60 )
	local h = tmp % 24
	tmp = math.floor( tmp / 24 )
	local d = tmp % 7
	local w = math.floor( tmp / 7 )

	return string.format( "%02iw %id %02ih %02im %02is", w, d, h, m, s )
end

surface.CreateFont( "leaderboardSmall", {
	font = "Arial",
	size = 12,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )