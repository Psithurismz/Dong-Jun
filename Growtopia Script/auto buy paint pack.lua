paintpack = {3494, 3478, 3480, 3482, 3484, 3486, 3488, 3490, 3492 }
trashlist = {}
paintprice = 15000

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

    while GetLocal().gems > paintprice do
for i = 0, 60 do
        buy("paintbrush")
        Sleep(450)
end
        for s, v in ipairs(paintpack) do
            drop(v)
            Sleep(200)
	      Sleep(100)
        end
        Sleep(200)
    end