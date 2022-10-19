-- Function to find a player by name :)
local function queryPlayer(name)
    if !name || !isstring(name) then return nil end

    for _,v in ipairs(player.GetAll()) do if string.find( string.lower(v:Nick()), name, 1, true) then return v end end
end

-- Borrowed code from uTime :)
local function timeToStr( time )
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

-- Convert bools to a string :)
local convertBool = {}
convertBool[true] = "Yes"
convertBool[false] = "No"

concommand.Add("playerquery", function(ply, cmd, args)
    local target = queryPlayer(args[1])
    if !target || !IsValid(target) || !ply:IsSuperAdmin() then return end

    -- Player info :)
    print("--------------------=[ INFORMATION ]=--------------------")
    print("NAME: " .. target:Nick())
    print("MODEL: " .. target:GetModel())
    print("IP: " .. target:IPAddress())
    print("")
    print("RANK: " .. target:GetUserGroup())
    print("ADMIN: " .. convertBool[target:IsAdmin()])
    print("SUPERADMIN: " .. convertBool[target:IsSuperAdmin()])
    print("")
    print("STEAMID: " .. target:SteamID())
    print("STEAMID64: " .. target:SteamID64())
    print("ACCOUNT ID: " ..  target:AccountID())
    print("UNIQUE ID: " .. target:UniqueID())
    print("")
    print("ALIVE: " .. convertBool[target:Alive()])
    print("HEALTH: " .. target:Health() .. "/" .. target:GetMaxHealth())
    print("ARMOR: " .. target:Armor() .. "/" .. (target:GetMaxArmor() || 100))
    print("")
    print("POSITION: " .. tostring(target:GetPos()))
    print("ANGLE: " .. tostring(target:GetAngles()))
    print("")
    print("WEAPONS:")
    for _,v in ipairs(target:GetWeapons()) do print("- " .. v:GetPrintName() .. " (" .. v:GetClass() .. ")") end

    -- Gamemode info :)
    if DarkRP then -- DARKRP :)
        print("")
        print("----------------------=[ DARKRP ]=----------------------")
        print("WALLET: " ..  DarkRP.formatMoney(target:getDarkRPVar("money")))
        print("SALARY: " .. DarkRP.formatMoney(target:getDarkRPVar("salary")))
        print("")
        print("JOB: " .. team.GetName( target:Team() ))
        print("ARRESTED: " .. convertBool[target:isArrested() || false])
    elseif engine.ActiveGamemode() == "terrortown" then -- TROUBLE IN TERRORIST TOWN :)
        print("")
        print("-------------=[ TROUBLE IN TERRORIST TOWN ]=-------------")

        -- let's determine their role :)
        local role

        if !target:Alive() then role = "Spectator" elseif target:IsTraitor() then role = "Traitor" elseif target:IsDetective() then role = "Detective" else role = "Innocent" end

        print("ROLE: " .. role)
    end

    -- UTime info :)
    if timer.Exists("UTimeTimer") then
        print("")
        print("-----------------------=[ UTIME ]=-----------------------")
        print("TOTAL PLAYTIME: " .. timeToStr(target:GetUTimeTotalTime()))
        print("SESSION PLAYTIME: " .. timeToStr(target:GetUTimeSessionTime()))
    end

    print("")
    print("-------------------=[ END OF QUERY ]=--------------------")
end)
