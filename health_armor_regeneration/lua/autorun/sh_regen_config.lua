-- Do not touch!
AthenaRegeneration = AthenaRegeneration or {}
AthenaRegeneration.Config = AthenaRegeneration.Config or {}
AthenaRegeneration.Config.Health = AthenaRegeneration.Config.Health or {}
AthenaRegeneration.Config.Armor = AthenaRegeneration.Config.Armor or {}

-- Athena Regeneration System
-- Build ALPHA 1

-- Delay to start regeneration (in seconds) after taking damage. Set to 0 for instant.
AthenaRegeneration.Config.DamageCooldown = 12.5

-- How often (in seconds between each heal) should we regenerate?
AthenaRegeneration.Config.Health.Speed = 2.5
-- What percentage (per each heal) of player's maximum health should we heal?
AthenaRegeneration.Config.Health.Percentage = 3.5

-- How often (in seconds between each armor) should we regenerate?
AthenaRegeneration.Config.Armor.Speed = 3.5
-- What percentage (per each armor) of player's maximum armor should we give?
AthenaRegeneration.Config.Armor.Percentage = 7.5