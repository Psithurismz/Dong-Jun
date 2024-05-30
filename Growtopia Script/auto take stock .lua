while true do
SendPacket(2,[[
action|dialog_return
dialog_name|itemremovedfromsucker
tilex|1|
tiley|51|
itemtoremove|200
]])
Sleep(700)
SendPacket(2,[[
action|dialog_return
dialog_name|vending
tilex|1|
tiley|52|
buttonClicked|addstock

setprice|0
chk_peritem|1
chk_perlock|0
]])
end