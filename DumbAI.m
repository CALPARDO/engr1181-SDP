clc
clear

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
battleship_display = water_s * ones(10,21);
battleship_display(:,11) = blank_s;
drawScene(battleship_scene,battleship_display)

%display ship images on the Game Board example
battleship_display(10, 16:20) = horizontalship5;
battleship_display(1:4, 13) = verticalship4;
battleship_display(5:6, 21) = verticalship2;
battleship_display(9, 13:14) = horizontalship2;
battleship_display(1:3, 19) = verticalship3;
drawScene(battleship_scene,battleship_display)

board_display = battleship_display;
board_display(10, 16:20) = horizontalship5;
board_display(1:4, 13) = verticalship4;
board_display(5:6, 21) = verticalship2;
board_display(9, 13:14) = horizontalship2;
board_display(1:3, 19) = verticalship3;
drawScene(battleship_scene,board_display)

boardArray = reshape(board_display.',1,[]);
s = 0;  %variable s = 16; the number of sprites containing a part of the ship                    
C = 0;
c = boardArray 
if s <= 16
[c] = randi([111,200],1,1)
    if board_display(c) == left_ship_s || board_display(c) == horizontal_ship_s || board_display(c) == right_ship_s || board_display(c) == top_ship_s || board_display(c) == vertical_ship_s ||  board_display(c) == bottom_ship_s
        board_display(c) = hit_s;
        s = s + 1;
        C = C + 1 
        %If the board is displaying a water sprite, then when it is hit, a white dot will be displayed in that spot.
    elseif board_display(c) == water_s
        board_display(c) = miss_s;
        C = C + 1;
    elseif board_display(c) == miss_s
        [c] = randi([111, 200],1,1)
    elseif board_display(c) == 1
        [c] = randi([111, 200],1,1)
    end
    drawScene(battleship_scene,board_display)
end