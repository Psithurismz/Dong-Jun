



surgpack = {1258, 1260, 1262, 1264, 1266, 1268, 1270, 4308, 4310, 4312, 4314, 4316, 4318, 4296}
trashlist = {1240, 1256, 8500 }
fishprice = 12000


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

    while GetLocal().gems > fishprice do
for i = 0, 19 do
        buy("surg")
        Sleep(450)
end
        for s, v in ipairs(surgpack) do
            drop(v)
            Sleep(200)
	      Sleep(100)
        end
		
		for f, a in ipairs(trashlist) do
			trash(a)
			Sleep(200)
		end
        Sleep(100)
    end

