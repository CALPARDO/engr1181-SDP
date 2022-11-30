clc 
clear
BtlShipScn = simpleGameEngine('Battleship.png',84,84);
scene_menu = simpleGameEngine('menu_back.png', 720, 1080);
uiwait(msgbox('Welcome to Battlship! Whenever you see a message box (like this one) press OK before following the instructions given. Have Fun!','Battleship'))
for g = 1:1000
menu(scene_menu);
end