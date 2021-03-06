AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
	self:SetModel( "models/props/cs_assault/Billboard.mdl" )
	
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	phys:EnableMotion( false )
	phys:Wake()

	self:updateLeaderboard()
	
	--Make sure we only have 1 timer
	if !timer.Exists( "leaderboardUpdateTimer" ) then
		--Create said timer using config settings
		timer.Create( "leaderboardUpdateTimer", leaderboardConfig.updateTime, 0, function()
			for k,v in pairs( ents.FindByClass( "rp_leaderboard" ) ) do
				v:updateLeaderboard()
			end
		end )
	end
end

function ENT:updateLeaderboard()
	local walletResult = sql.Query( "SELECT rpname, wallet FROM darkrp_player ORDER BY wallet DESC LIMIT 5" )
	local timeResult = sql.Query( "SELECT totaltime, rpname FROM utime JOIN darkrp_player ON uid = player ORDER BY totaltime DESC LIMIT 5" )
	
	if !walletResult then return end
	if !timeResult then return end
	
	for k,v in pairs( walletResult ) do		
		self:SetNWString( k .. "name", v["rpname"] )
		self:SetNWString( k .. "wallet", v["wallet"] )
	end
	
	for k,v in pairs( timeResult ) do
		self:SetNWString( k .. "timename", v["rpname"] )
		self:SetNWInt( k .. "time", v["totaltime"] )
	end
end