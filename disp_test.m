function disp_test(coor_2c, coor_3c_1, coor_3c_2, coor_4c, coor_5c, dir_2c, dir_3c_1, dir_3c_2, dir_4c, dir_5c, scene_bs)   
    s_water = 2; % Water sprite
    
    s_hor_1 = 3; % 1st part of horizontal ship
    s_hor_2 = 4; % 2nd part of horizontal ship
    s_hor_3 = 5; % 3rd part of horiztontal ship
    
    s_ver_1 = 6; % 1st part of vertical ship
    s_ver_2 = 7; % 2nd part of vertical ship
    s_ver_3 = 8; % 3rd part of vertical ship

    disp_brd = s_water * ones(10,10);
    disp_bs = disp_brd;
    
    %2-cell
    switch dir_2c
        case 0
            disp_bs(coor_2c(1,1), coor_2c(1,2)) = s_hor_1;
            disp_bs(coor_2c(2,1), coor_2c(2,2)) = s_hor_3;
        case 1
            disp_bs(coor_2c(1,1), coor_2c(1,2)) = s_ver_1;
            disp_bs(coor_2c(2,1), coor_2c(2,2)) = s_ver_3;            
    end

    %3-cell-1
    switch dir_3c_1
        case 0
            disp_bs(coor_3c_1(1,1), coor_3c_1(1,2)) = s_hor_1;
            disp_bs(coor_3c_1(2,1), coor_3c_1(2,2)) = s_hor_2;
            disp_bs(coor_3c_1(3,1), coor_3c_1(3,2)) = s_hor_3;
        case 1
            disp_bs(coor_3c_1(1,1), coor_3c_1(1,2)) = s_ver_1;
            disp_bs(coor_3c_1(2,1), coor_3c_1(2,2)) = s_ver_2;
            disp_bs(coor_3c_1(3,1), coor_3c_1(3,2)) = s_ver_3;            
    end

    %3-cell-2
    switch dir_3c_2
        case 0
            disp_bs(coor_3c_2(1,1), coor_3c_2(1,2)) = s_hor_1;
            disp_bs(coor_3c_2(2,1), coor_3c_2(2,2)) = s_hor_2;
            disp_bs(coor_3c_2(3,1), coor_3c_2(3,2)) = s_hor_3;
        case 1
            disp_bs(coor_3c_2(1,1), coor_3c_2(1,2)) = s_ver_1;
            disp_bs(coor_3c_2(2,1), coor_3c_2(2,2)) = s_ver_2;
            disp_bs(coor_3c_2(3,1), coor_3c_2(3,2)) = s_ver_3;            
    end

    %4-cell
    switch dir_4c
        case 0
            disp_bs(coor_4c(1,1), coor_4c(1,2)) = s_hor_1;
            disp_bs(coor_4c(2,1), coor_4c(2,2)) = s_hor_2;
            disp_bs(coor_4c(3,1), coor_4c(3,2)) = s_hor_2;
            disp_bs(coor_4c(4,1), coor_4c(4,2)) = s_hor_3;
        case 1
            disp_bs(coor_4c(1,1), coor_4c(1,2)) = s_ver_1;
            disp_bs(coor_4c(2,1), coor_4c(2,2)) = s_ver_2;
            disp_bs(coor_4c(3,1), coor_4c(3,2)) = s_ver_2;
            disp_bs(coor_4c(4,1), coor_4c(4,2)) = s_ver_3;            
    end

    %5-cell
    switch dir_5c
        case 0
            disp_bs(coor_5c(1,1), coor_5c(1,2)) = s_hor_1;
            disp_bs(coor_5c(2,1), coor_5c(2,2)) = s_hor_2;
            disp_bs(coor_5c(3,1), coor_5c(3,2)) = s_hor_2;
            disp_bs(coor_5c(4,1), coor_5c(4,2)) = s_hor_2;
            disp_bs(coor_5c(5,1), coor_5c(5,2)) = s_hor_3;
        case 1
            disp_bs(coor_5c(1,1), coor_5c(1,2)) = s_ver_1;
            disp_bs(coor_5c(2,1), coor_5c(2,2)) = s_ver_2;
            disp_bs(coor_5c(3,1), coor_5c(3,2)) = s_ver_2;
            disp_bs(coor_5c(4,1), coor_5c(4,2)) = s_ver_2;
            disp_bs(coor_5c(5,1), coor_5c(5,2)) = s_ver_3;
    end
    
    drawScene(scene_bs, disp_bs);

end