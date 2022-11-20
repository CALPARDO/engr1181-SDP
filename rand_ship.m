function [coor_2c, coor_3c_1, coor_3c_2, coor_4c, coor_5c, dir_2c, dir_3c_1, dir_3c_2, dir_4c, dir_5c] = rand_ship()
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
    end