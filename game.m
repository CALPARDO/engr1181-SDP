function game(scene_bs_f)
    %sprite ID assignments
    %s_menu_btn = [1081:1242, 1:161];
    
    s_black = 1; % Blank sprite
    s_water = 2; % Water sprite
    
    s_hor_1 = 3; % 1st part of horizontal ship
    s_hor_2 = 4; % 2nd part of horizontal ship
    s_hor_3 = 5; % 3rd part of horiztontal ship
    
    s_ver_1 = 6; % 1st part of vertical ship
    s_ver_2 = 7; % 2nd part of vertical ship
    s_ver_3 = 8; % 3rd part of vertical ship
    
    s_hit = 9;   % Hit sprite
    s_miss = 10; % Miss sprite
    
    %assembled ships
    a_hor_5 = [3, 4, 4, 4, 5]; % 5-cell horizontal ship
    a_hor_4 = [3, 4, 4, 5];    % 4-cell horizontal ship
    a_hor_3 = [3, 4, 5];       % 3-cell horizontal ship
    a_hor_2 = [3, 5];          % 2-cell horizontal ship
    
    a_ver_5 = [6; 7; 7; 7; 8]; % 5-cell vertical ship
    a_ver_4 = [6; 7; 7; 8];    % 4-cell vertical ship
    a_ver_3 = [6; 7; 8];       % 3-cell vertical ship
    a_ver_2 = [6; 8];          % 2-cell vertical ship
    
    %display empty board
    disp_bs = s_water * ones(10,10); % create a 10x10 matrix consists of 1's
    
    %drawScene
    drawScene(scene_bs_f, disp_bs);
    
    %add ships
    %{
    disp_brd = disp_bs;
    disp_brd(8, 8:9) = a_hor_2;     % place 2-cell horizontal ship
    disp_brd(3:4, 2) = a_ver_2;     % place 2-cell vertical ship
    disp_brd(4, 7:9) = a_hor_3;     % place 3-cell horizontal ship
    disp_brd(1, 6:9) = a_hor_4;     % place 4-cell horizontal ship
    disp_brd(6:10, 3) = a_ver_5;    % place 5-cell vertical ship
    %}


    %drawScene(scene_bs_f, disp_bs);
    uiwait(msgbox("Welcome to Battleship! Please place your ships...",'Battleship'));
    p1_name = inputdlg("Enter P1's Name:", '', [1,20]);
    uiwait(msgbox("Hi "+ p1_name + ", please place your 2-cell ships",'Battleship'));

    %count_2c = 0;
    %skip_key = 0;

    %disp_brd(1, 1:2) = a_hor_2;
    %drawScene(scene_bs_f, disp_bs);
    
    function rand_ship_coor = rand_ship()
        %2-cell ver or hor (0=hor, 1=ver)
        dir_2c = randi(2,1,1)-1;
        %2-cell coordinate
        coor_2c = randi(10,1,2);
        if dir_2c == 0
            coor_2c(2,1) = coor_2c(1,1);
            coor_2c(2,2) = coor_2c(1,2) + 1;
        elseif dir_2c == 1
            coor_2c(2,2) = coor_2c(1,2);
            coor_2c(2,1) = coor_2c(1,1) + 1;
        end
        rand_ship_coor(1:2,1:2) = coor_2c;

        %first 3-cell ver or hor (0=hor, 1=ver)
        dir_3c_1 = randi(2,1,1)-1;
        %first 3-cell coordinate
        coor_3c_1 = randi(10,1,2);
        if dir_3c == 0
            coor_3c(2,1) = coor_3c(1,1);
            coor_3c(2,2) = coor_3c(1,2) + 1:2;
        elseif dir_3c == 1
            coor_3c(2,2) = coor_3c(1,2);
            coor_3c(2,1) = coor_3c(1,1) + 1;
        end
    end

end

%1-2c, 2-3c, 1-4c, 1-5c