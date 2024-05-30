



citypack = {994, 986, 992, 990, 996, 998, 988, 1004, 1006, 1002}
clist = {1008}
cityprice = 24000

function drop(id)
    SendPacket(2, "action|dialog_return\ndialog_name|drop_item\nitemID|" .. id .. "|\ncount|" .. GetItemCount(id) .. "\n")
end

function trash(id)
    SendPacket(2, "action|dialog_return\ndialog_name|trash_item\nitemID|" .. id .. "|\ncount|" .. GetItemCount(id) .. "\n")
end

function buy(id)
    SendPacket(2, "action|buy\nitem|" .. id)
end

AddCallback("test", "OnVarlist", function(vlist)
    if vlist[0]:find("OnTextOverlay") and vlist[1]:find("drop that") then
		FindPath(GetLocal().pos_x // 32 + 1, GetLocal().pos_y // 32)
	return  false
    end
end)

    while GetLocal().gems > cityprice do
for i = 0, 19 do
        buy("city_pack")
        Sleep(450)
end
        for s, v in ipairs(citypack) do
            trash(v)
            Sleep(200)
	      Sleep(100)
        end
        drop(1008)
        Sleep(200)
    end

