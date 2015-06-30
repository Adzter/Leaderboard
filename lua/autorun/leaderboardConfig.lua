--[[

  _                    _           _                         _ 
 | |                  | |         | |                       | |
 | |     ___  __ _  __| | ___ _ __| |__   ___   __ _ _ __ __| |
 | |    / _ \/ _` |/ _` |/ _ \ '__| '_ \ / _ \ / _` | '__/ _` |
 | |___|  __/ (_| | (_| |  __/ |  | |_) | (_) | (_| | | | (_| |
 |______\___|\__,_|\__,_|\___|_|  |_.__/ \___/ \__,_|_|  \__,_|
 
	Created by Adzter: http://steamcommunity.com/id/imadzter
	For NPIGamers: http://npigamers.com/

--]]

leaderboardConfig = {}				--Ignore this
leaderboardConfig.bgColors = {}		--Ignore this
leaderboardConfig.textColors = {}	--Ignore this

leaderboardConfig.updateTime = 300		-- Time, in seconds, to update the leaderboard (default 5 minutes)

leaderboardConfig.bg = Color( 0, 0, 0 )					-- Background colour
leaderboardConfig.title = "Leaderboard"					-- Title text
leaderboardConfig.titleFont = Color( 255, 255, 255 )	-- Title colour	
						
leaderboardConfig.bgColors[1] = Color( 255, 215, 0 )	-- Background colour of 1st place
leaderboardConfig.bgColors[2] = Color( 192, 192, 192 )	-- Background colour of 2nd place
leaderboardConfig.bgColors[3] = Color( 128, 64, 0 )		-- Background colour of 3rd place
leaderboardConfig.bgColors[4] = Color( 255, 255, 255 )	-- Anything afterwards

leaderboardConfig.textColors[1] = Color( 0, 0, 0 )		-- Text colour of the 1st place
leaderboardConfig.textColors[2] = Color( 0, 0, 0 )		-- Text colour of the 2st place
leaderboardConfig.textColors[3] = Color( 0, 0, 0 )		-- Text colour of the 3st place
leaderboardConfig.textColors[4] = Color( 0, 0, 0 )		-- Anything afterwards