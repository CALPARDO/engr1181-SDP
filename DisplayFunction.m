function [] = untitled2(inputArg1,inputArg2)
battleship_scene = simpleGameEngine('Battleship.png',84,84);

%variables for sprites
blank_s = 1;    %Blank sprite (black line to divide two sides of the board)
water_s = 2;    %Water sprite (water scene)
left_ship_s = 3;    %left side of ship sprite (left end of ship)
horizontal_ship_s = 4;  %horizontal ship sprite
right_ship_s = 5;   %right side of ship sprite (right end of ship)
top_ship_s = 6;     %top of ship sprite
vertical_ship_s = 7;    %vertical ship sprite
bottom_ship_s = 8;  %bottom of ship sprite
hit_s = 9;      %hit sprite (red dot; shows when ship is hit)
miss_s = 10;    %miss sprite (white dot; shows when ship is missed)

horizontalship5 = [3, 4, 4, 4, 5];
horizontalship4 = [3, 4, 4, 5];
horizontalship3 = [3, 4, 5];
horizontalship2 = [3, 5];

verticalship5 = [6; 7; 7; 7; 8];
verticalship4 = [6; 7; 7; 8];
verticalship3 = [6; 7; 8];
verticalship2 = [6; 8];

%display empty board
board_display = water_s * ones(10,21);
board_display(:,11) = blank_s;
drawScene(battleship_scene,board_display)

boardArray = reshape(board_display.',1,[]);
s = 0;  %variable s = 16; the number of sprites containing a part of the ship                    
c = [] 
    if board_display(c) == left_ship_s
        s = s + 1;
    elseif board_display(c) == horizontal_ship_s
        board_display(c) = hit_s;
        s = s + 1;
    elseif board_display(c) == right_ship_s
        board_display(c) = hit_s;
        s = s + 1;
    elseif board_display(c) == top_ship_s
        board_display(c) = hit_s;
        s = s + 1;
    elseif board_display(c) == vertical_ship_s
        board_display(c) = hit_s;
        s = s + 1 ;
    elseif board_display(c) == bottom_ship_s
        board_display(c) = hit_s;
        s = s + 1;
    elseif board_display(c) == water_s
        board_display(c) = miss_s;
    end
    drawScene(battleship_scene,board_display)
end
