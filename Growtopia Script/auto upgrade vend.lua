EditToggle("modfly", true)
function lethimcock(x, y, id)
    local v9 = {}
    v9.type = 3
    v9.int_data = id
    v9.pos_x = GetLocal().pos_x
    v9.pos_y = GetLocal().pos_y
    v9.int_x = x
    v9.int_y = y
    SendPacketRaw(v9)
end

function check(id)
    for i , item in pairs(GetInventory()) do
        if item.id == id then
            return item.count
        end
    end
return 0
end

function upgrade()
    for i , tile in pairs(GetTiles()) do
        if tile.fg == 2978 then
            log(x)
            FindPath(tile.pos_x, tile.pos_y)
            Sleep(200)
            pkt =
                [[
    action|dialog_return
    dialog_name|vending
    tilex|]] ..
                tile.pos_x .. [[|
    tiley|]] .. tile.pos_y .. [[|
    buttonClicked|upgradedigital

    ]]

            SendPacket(2, pkt)
        end
    end
end

function place()
    for i , tile in pairs(GetTiles()) do
        if tile.fg == 0 and check(2978) >= 1 then
            lethimcock(tile.pos_x, tile.pos_y, 2978)
            Sleep(20)
        end
    end
end

function meat()
    for d, tile in pairs(GetTiles()) do
        if tile.fg == 9268 and check(9268) <= 99 then
            lethimcock(tile.pos_x,tile.pos_y, 18)
            Sleep(200)
        elseif check(9268) >= 100 then
            FindPath(37,23)
            Sleep(2000)
 SendPacket(2, "action|dialog_return\ndialog_name|drop_item\nitemID|9268|\ncount|" .. GetItemCount(9268) .. "\n")
        end
    end
end

while true do
    place()
    Sleep(2000)
    pcall(upgrade(), 1)
    Sleep(2000)
    for i = 0, 10 do
    meat()
    end
    Sleep(1000)
    log("Done i guess")
end