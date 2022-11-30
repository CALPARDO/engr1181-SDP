function rand_ship_coor = rand_ship_v2()

    s_water = 2; % Water sprite
    
    s_hor_1 = 3; % 1st part of horizontal ship
    s_hor_2 = 4; % 2nd part of horizontal ship
    s_hor_3 = 5; % 3rd part of horiztontal ship
    
    s_ver_1 = 6; % 1st part of vertical ship
    s_ver_2 = 7; % 2nd part of vertical ship
    s_ver_3 = 8; % 3rd part of vertical ship

    %2-cell ver or hor (0=hor, 1=ver)
    dir_2c = randi(2,1,1)-1;       
    %2-cell coordinate
    while 1
        coor_2c = randi(10,1,2);
        if dir_2c == 0
            coor_2c(2,1) = coor_2c(1,1);
            coor_2c(2,2) = coor_2c(1,2) + 1;
        elseif dir_2c == 1
            coor_2c(2,2) = coor_2c(1,2);
            coor_2c(2,1) = coor_2c(1,1) + 1;
        end
        if coor_2c <= 10
            break;
        end
    end
    rand_ship_coor(1:2,:) = coor_2c;
    pause(randi(10,1,1)*0.001);

    %first 3-cell ver or hor (0=hor, 1=ver)
    dir_3c_1 = randi(2,1,1)-1;
    %first 3-cell coordinate
    while 1
        coor_3c_1 = randi(10,1,2);
        if dir_3c_1 == 0
            coor_3c_1(2:3,1) = coor_3c_1(1,1);
            coor_3c_1(2,2) = coor_3c_1(1,2) + 1;
            coor_3c_1(3,2) = coor_3c_1(1,2) + 2;
        elseif dir_3c_1 == 1
            coor_3c_1(2:3,2) = coor_3c_1(1,2);
            coor_3c_1(2,1) = coor_3c_1(1,1) + 1;
            coor_3c_1(3,1) = coor_3c_1(1,1) + 2;
        end
        if all(ismember(rand_ship_coor, coor_3c_1, 'rows') == 0)
            if coor_3c_1 <= 10
                rand_ship_coor(3:5,:) = coor_3c_1;
                break;
            end
        end
    end
    pause(randi(10,1,1)*0.001);
    
    %second 3-cell ver or hor (0=hor, 1=ver)
    dir_3c_2 = randi(2,1,1)-1;
    %second 3-cell coordinate
    while 1
        coor_3c_2 = randi(10,1,2);
        if dir_3c_2 == 0
            coor_3c_2(2:3,1) = coor_3c_2(1,1);
            coor_3c_2(2,2) = coor_3c_2(1,2) + 1;
            coor_3c_2(3,2) = coor_3c_2(1,2) + 2;
        elseif dir_3c_2 == 1
            coor_3c_2(2:3,2) = coor_3c_2(1,2);
            coor_3c_2(2,1) = coor_3c_2(1,1) + 1;
            coor_3c_2(3,1) = coor_3c_2(1,1) + 2;
        end
        if all(ismember(rand_ship_coor, coor_3c_2, 'rows') == 0)
            if coor_3c_2 <= 10
                rand_ship_coor(6:8,:) = coor_3c_2;
                break;  
            end
        end
    end
    pause(randi(10,1,1)*0.001);

    %4-cell ver or hor (0=hor, 1=ver)
    dir_4c = randi(2,1,1)-1;
    %4-cell coordinate
    while 1
        coor_4c = randi(10,1,2);
        if dir_4c == 0
            coor_4c(2:4,1) = coor_4c(1,1);
            coor_4c(2,2) = coor_4c(1,2) + 1;
            coor_4c(3,2) = coor_4c(1,2) + 2;
            coor_4c(4,2) = coor_4c(1,2) + 3;
        elseif dir_4c == 1
            coor_4c(2:4,2) = coor_4c(1,2);
            coor_4c(2,1) = coor_4c(1,1) + 1;
            coor_4c(3,1) = coor_4c(1,1) + 2;
            coor_4c(4,1) = coor_4c(1,1) + 3;
        end
        if all(ismember(rand_ship_coor, coor_4c, 'rows') == 0)
            if coor_4c <= 10
                rand_ship_coor(9:12,:) = coor_4c;
                break;
            end
        end
    end
    pause(randi(10,1,1)*0.001);

    %5-cell ver or hor (0=hor, 1=ver)
    dir_5c = randi(2,1,1)-1;
    %5-cell coordinate
    while 1
        coor_5c = randi(10,1,2);
        if dir_5c == 0
            coor_5c(2:5,1) = coor_5c(1,1);
            coor_5c(2,2) = coor_5c(1,2) + 1;
            coor_5c(3,2) = coor_5c(1,2) + 2;
            coor_5c(4,2) = coor_5c(1,2) + 3;
            coor_5c(5,2) = coor_5c(1,2) + 4;
        elseif dir_5c == 1
            coor_5c(2:5,2) = coor_5c(1,2);
            coor_5c(2,1) = coor_5c(1,1) + 1;
            coor_5c(3,1) = coor_5c(1,1) + 2;
            coor_5c(4,1) = coor_5c(1,1) + 3;
            coor_5c(5,1) = coor_5c(1,1) + 4;
        end
        if all(ismember(rand_ship_coor, coor_5c, 'rows') == 0)
            if coor_5c <= 10
                rand_ship_coor(13:17,:) = coor_5c;
                break;
            end
        end
    end

    % the water sprite and the ones function
    rand_ship_coor = 2 * ones(10,10);
    %2-cell
    switch dir_2c
    case 0
        rand_ship_coor(coor_2c(1,1), coor_2c(1,2)) = s_hor_1;
        rand_ship_coor(coor_2c(2,1), coor_2c(2,2)) = s_hor_3;
    case 1
        rand_ship_coor(coor_2c(1,1), coor_2c(1,2)) = s_ver_1;
        rand_ship_coor(coor_2c(2,1), coor_2c(2,2)) = s_ver_3;            
    end

    %3-cell-1
    switch dir_3c_1
        case 0
            rand_ship_coor(coor_3c_1(1,1), coor_3c_1(1,2)) = s_hor_1;
            rand_ship_coor(coor_3c_1(2,1), coor_3c_1(2,2)) = s_hor_2;
            rand_ship_coor(coor_3c_1(3,1), coor_3c_1(3,2)) = s_hor_3;
        case 1
            rand_ship_coor(coor_3c_1(1,1), coor_3c_1(1,2)) = s_ver_1;
            rand_ship_coor(coor_3c_1(2,1), coor_3c_1(2,2)) = s_ver_2;
            rand_ship_coor(coor_3c_1(3,1), coor_3c_1(3,2)) = s_ver_3;            
    end

    %3-cell-2
    switch dir_3c_2
        case 0
            rand_ship_coor(coor_3c_2(1,1), coor_3c_2(1,2)) = s_hor_1;
            rand_ship_coor(coor_3c_2(2,1), coor_3c_2(2,2)) = s_hor_2;
            rand_ship_coor(coor_3c_2(3,1), coor_3c_2(3,2)) = s_hor_3;
        case 1
            rand_ship_coor(coor_3c_2(1,1), coor_3c_2(1,2)) = s_ver_1;
            rand_ship_coor(coor_3c_2(2,1), coor_3c_2(2,2)) = s_ver_2;
            rand_ship_coor(coor_3c_2(3,1), coor_3c_2(3,2)) = s_ver_3;            
    end

    %4-cell
    switch dir_4c
        case 0
            rand_ship_coor(coor_4c(1,1), coor_4c(1,2)) = s_hor_1;
            rand_ship_coor(coor_4c(2,1), coor_4c(2,2)) = s_hor_2;
            rand_ship_coor(coor_4c(3,1), coor_4c(3,2)) = s_hor_2;
            rand_ship_coor(coor_4c(4,1), coor_4c(4,2)) = s_hor_3;
        case 1
            rand_ship_coor(coor_4c(1,1), coor_4c(1,2)) = s_ver_1;
            rand_ship_coor(coor_4c(2,1), coor_4c(2,2)) = s_ver_2;
            rand_ship_coor(coor_4c(3,1), coor_4c(3,2)) = s_ver_2;
            rand_ship_coor(coor_4c(4,1), coor_4c(4,2)) = s_ver_3;            
    end

    %5-cell
    switch dir_5c
        case 0
            rand_ship_coor(coor_5c(1,1), coor_5c(1,2)) = s_hor_1;
            rand_ship_coor(coor_5c(2,1), coor_5c(2,2)) = s_hor_2;
            rand_ship_coor(coor_5c(3,1), coor_5c(3,2)) = s_hor_2;
            rand_ship_coor(coor_5c(4,1), coor_5c(4,2)) = s_hor_2;
            rand_ship_coor(coor_5c(5,1), coor_5c(5,2)) = s_hor_3;
        case 1
            rand_ship_coor(coor_5c(1,1), coor_5c(1,2)) = s_ver_1;
            rand_ship_coor(coor_5c(2,1), coor_5c(2,2)) = s_ver_2;
            rand_ship_coor(coor_5c(3,1), coor_5c(3,2)) = s_ver_2;
            rand_ship_coor(coor_5c(4,1), coor_5c(4,2)) = s_ver_2;
            rand_ship_coor(coor_5c(5,1), coor_5c(5,2)) = s_ver_3;
    end
end