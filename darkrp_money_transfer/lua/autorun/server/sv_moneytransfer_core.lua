local meta = FindMetaTable("Player")

function meta:TransferMoney(target, amount)
    if not amount or not isnumber(amount) or amount <= 0 then return end -- Make sure we have an amount (greater than 0) to send
    if not target or not IsValid(target) or not target:IsPlayer() then return end -- Make sure we have a person to send to
    if not self:canAfford(amount) then DarkRP.notify(self, 1, 3, "You cannot afford to transfer " .. DarkRP.formatMoney(amount) .. ".") return end -- If the person cannot afford to pay

    -- Take away money and notify sender
    self:addMoney( -math.abs(amount) )
    DarkRP.notify(self, 3, 5, "You have transferred " .. DarkRP.formatMoney(amount) .. " to " .. target:Nick() .. ".")

    -- Add money and notify receiver
    target:addMoney( math.abs(amount) )
    DarkRP.notify(target, 3, 5, self:Nick() .. " has transferred " .. DarkRP.formatMoney(amount) .. " to you.")
end
