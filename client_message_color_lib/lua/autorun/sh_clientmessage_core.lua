-- EXAMPLE BELOW (SERVERSIDE ONLY)
-- ply:SendColoredChat({Color(255,0,0), "This is red! ", Color(0,0,255), "And this is blue!"})

if SERVER then
    util.AddNetworkString("AthenaTools.SendColoredMessage")

    local meta = FindMetaTable("Player")

    function meta:SendColoredChat(tbl)
        if not tbl or not istable(tbl) then return end

        net.Start("AthenaTools.SendColoredMessage")
            net.WriteTable(tbl)
        net.Send(self)
    end
else
    net.Receive("AthenaTools.SendColoredMessage", function()
        chat.AddText( unpack( net.ReadTable() ) )
    end)
end