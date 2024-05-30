ids = {914,916,918,920,924,}

function collectoid(oid,x,y)
    local p = {
        type = 11,
        int_data = oid,
        pos_x = x,
        pos_y = y
    }
    SendPacketRaw(p)
end

function check(id)
    for _,cur in pairs(GetInventory()) do
        if cur.id == id and cur.count == 200 then
        return true
        end
    end
    return false
    end

    function collect()
        for _, v in pairs(GetObjects()) do
            if GetTile(v.pos_x / 32, v.pos_y / 32).fg ~= 2488 then
                collectoid(v.oid, v.pos_x, v.pos_y)
                Sleep(3)
            end
        end
    end

    while true do
for i, items in pairs(ids) do
    if check(items) == true then
        SendPacket(2, "action|dialog_return\ndialog_name|drop_item\nitemID|"..items.."|\ncount|" .. GetItemCount(items) .. "\n")
        Sleep(700)
    else
        collect()
        Sleep(1000)
    end
end
end