timer.Create("AthenaMapRotation.RotationTimer", AthenaMapRotation.Config.RotationTimer, 0, function()
    if #player.GetAll() < AthenaMapRotation.Config.MinimumPlayers then return end -- Do not rotate maps if below min player count!

    local simulateMaps = table.Copy(AthenaMapRotation.Config.RotationMaps) -- Clone our map list.

    local curMap = game.GetMap() -- Get our current map
    local curIndex = table.KeyFromValue(simulateMaps, curMap) -- Find our current map in our cloned list.

    table.remove(simulateMaps, curIndex) -- Remove our current map, we don't want to switch to that.

    local newMap = simulateMaps[ math.random( #simulateMaps ) ] -- Pick a random map, minus our current map.

    RunConsoleCommand("changelevel", newMap) -- Change to our new map :)

    timer.Remove("AthenaMapRotation.RotationTimer") -- Get rid of our timer, we don't need you anymore.
end)