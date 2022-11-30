clear
clc

scene_bs = simpleGameEngine('src/img/Battleship.png', 84, 84);
scene_menu = simpleGameEngine('src/img/menu_back.png', 720, 1080);

for g = 1:1000
    menu(scene_menu,scene_bs);
end