timer.Create("AthenaRegeneration.Health", AthenaRegeneration.Config.Health.Speed, 0, function()
    for _,ply in ipairs(player.GetAll()) do
        if ply.athenaBlockRegen && ply.athenaBlockRegen > CurTime() then continue end -- If they cannot regen

        local projectedHeal = math.ceil(ply:Health() + ((AthenaRegeneration.Config.Health.Percentage / 100) * ply:GetMaxHealth()))
        if projectedHeal > ply:GetMaxHealth() then ply:SetHealth(ply:GetMaxHealth()) else ply:SetHealth(projectedHeal) end
    end
end)

timer.Create("AthenaRegeneration.Armor", AthenaRegeneration.Config.Armor.Speed, 0, function()
    for _,ply in ipairs(player.GetAll()) do
        if ply.athenaBlockRegen && ply.athenaBlockRegen > CurTime() then continue end -- If they cannot regen
        if ply:Health() ~= ply:GetMaxHealth() then continue end -- If they are not at max health yet

        local projectedHeal = math.ceil(ply:Armor() + ((AthenaRegeneration.Config.Armor.Percentage / 100) * (ply:GetMaxArmor() || 100)))
        if projectedHeal > (ply:GetMaxArmor() || 100) then ply:SetArmor(ply:GetMaxArmor() || 100) else ply:SetArmor(projectedHeal) end
    end
end)

hook.Add("EntityTakeDamage", "AthenaRegeneration.Hooks.DamageStopper", function(target, dmg)
    if IsValid(target) && target:IsPlayer() then
        target.athenaBlockRegen = CurTime() + AthenaRegeneration.Config.DamageCooldown
    end
end)