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
	local result = sql.Query( "SELECT rpname, wallet FROM darkrp_player ORDER BY wallet DESC LIMIT 5" )
	
	if !result then return end
	
	if result[1] then
		self:SetNWString( "firstName", result[1]["rpname"] )
		self:SetNWString( "firstCash", result[1]["wallet"] )
	end
	
	if result[2] then
		self:SetNWString( "secondName", result[2]["rpname"] )
		self:SetNWString( "secondCash", result[2]["wallet"] )
	end
		
	if result[3] then
		self:SetNWString( "thirdName", result[3]["rpname"] )
		self:SetNWString( "thirdCash", result[3]["wallet"] )
	end
	
	if result[4] then
		self:SetNWString( "fourthName", result[4]["rpname"] )
		self:SetNWString( "fourthCash", result[4]["wallet"] )
	end
	
	if result[5] then
		self:SetNWString( "fifthName", result[5]["rpname"] )
		self:SetNWString( "fifthCash", result[5]["wallet"] )
	end
end