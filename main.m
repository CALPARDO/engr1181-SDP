clc
clear

%global scene_bs disp_bs;

% Import sprite sheet files
scene_bs = simpleGameEngine('src/img/battleship.png', 84, 84);
scene_menu = simpleGameEngine('src/img/menu_back_full.png', 720, 1080);
s_menu_bg = 1;

%menu(scene_menu, s_menu_bg);
%game(scene_bs);
%mouse_test();
[coor_2c, coor_3c_1, coor_3c_2, coor_4c, coor_5c, dir_2c, dir_3c_1, dir_3c_2, dir_4c, dir_5c] = rand_ship();
disp_test(coor_2c, coor_3c_1, coor_3c_2, coor_4c, coor_5c, dir_2c, dir_3c_1, dir_3c_2, dir_4c, dir_5c, scene_bs);

%{
disp_brd = 2 * ones(10,10);
disp_bs = disp_brd;
disp_bs(4,5) = 3;
drawScene(scene_bs,disp_bs);
%}