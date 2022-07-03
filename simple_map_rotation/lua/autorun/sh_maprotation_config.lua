AthenaMapRotation = AthenaMapRotation or {}
AthenaMapRotation.Config = AthenaMapRotation.Config or {}

-- This will be the list that we pick a map from to rotate!
AthenaMapRotation.Config.RotationMaps = {"gm_construct","gm_flatgrass"}

-- This is how often (in seconds) we will rotate the map!
AthenaMapRotation.Config.RotationTimer = 60

-- Minimum player count to begin map rotation
AthenaMapRotation.Config.MinimumPlayers = 2