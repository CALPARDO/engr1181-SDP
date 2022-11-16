clc
clear

%global scene_bs disp_bs;

% Import sprite sheet files
scene_bs = simpleGameEngine('src/img/battleship.png', 84, 84);
scene_menu = simpleGameEngine('src/img/menu_back_full.png', 720, 1080);
s_menu_bg = 1;

%menu(scene_menu, s_menu_bg);
game(scene_bs);
%mouse_test();