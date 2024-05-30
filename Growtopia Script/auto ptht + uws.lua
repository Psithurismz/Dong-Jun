pkt = [[
action|dialog_return
dialog_name|world_spray
]]
function punch(x,y,id)
    local v9 = {}
    v9.type = 3
    v9.int_data = id
    v9.pos_x = GetLocal().pos_x
    v9.pos_y = GetLocal().pos_y
    v9.int_x = x
    v9.int_y = y
    SendPacketRaw(v9)
end

function plant()
for w, tile in pairs(GetTiles())  do
if tile.fg == 9773 and tile.ready == true then
punch(tile.pos_x, tile.pos_y, 18)
Sleep(120)
punch(tile.pos_x, tile.pos_y, 5640)
elseif tile.fg == 0 then
punch(tile.pos_x, tile.pos_y, 5640)
Sleep(20)
end
end
end

function takemag(x,y)
    SendPacket(2, "action|dialog_return\ndialog_name|itemsucker_block\ntilex|" .. x .. "|\ntiley|" .. y .. "|\nbuttonClicked|getplantationdevice\n")
end

while true do
takemag(13,53)
Sleep(10000)
for i = 0, 10 do
    pcall(plant(), 1)
end
Sleep(2000)
SendPacket(2, pkt)
end