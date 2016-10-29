AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/props_c17/display_cooler01a.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)

    local physique = self:GetPhysicsObject()
    if (physique:IsValid()) then
      physique:Wake()
    end
end

function ENT:Use(activator)

  local rd = math.random(1,2)

  if (rd == 1) then
    activator:Give("weapon_melucario")
  elseif (rd == 2) then
    activator:Give("weapon_mebrazegali")
  else
    activator:Give("weapon_mebrazegali")
    activator:Give("weapon_melucario")
  end
  
  self:Remove()

end
