function [c] = ComputerTurn
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


%Computer Guessing where ships are
%column = randi[11 21]
%row = randi[1 10] (change for actual game)
%Board size of where computer is randomly guessing a point
boardArray = reshape(board_display.',1,[]);
s = 0;  %variable s = 16; the number of sprites containing a part of the ship                    
C = 0;
c = 0;  %c = point on the board  

while s <= 16   %while the number of cells containing a point with a red dot is less than 16, the while loop will run for the computer to guess a point on the board
    %if the board display already has a dot, another point will be guessed
    %if the board display had a ship, then the board will display a red dot
    %This will add 1 to the variable s, taking away from the total number of sprites with ships
    [c] = randi([110,200],1,1);
    %if the point guessed is the sprite containing the left side of the ship 
    if board_display(c) == 3
        board_display(c) = 9;   %display hit
        s = s + 1;
        C = C + 1;
    %if the point guessed is the sprite containing the horizontal ship sprite 
    elseif board_display(c) == 4
        board_display(c) = 9;   %display hit
        s = s + 1;
        C = C + 1;
    %if the point guessed is the sprite containing the right side of the ship 
    elseif board_display(c) == 5
        board_display(c) = 9;   %display hit
        s = s + 1;
        C = C + 1;
    %if the point guessed is the sprite containing top of the ship 
    elseif board_display(c) == 6
        board_display(c) = 9;   %display hit
        s = s + 1;
        C = C + 1;
    %if the point guessed is the sprite containing the vertical ship sprite 
    elseif board_display(c) == 7
        board_display(c) = 9;   %display hit
        s = s + 1;
        C = C + 1;
    %if the point guessed is the sprite containing the bottom of the ship 
    elseif board_display(c) == 8
        board_display(c) = 9;   %display hit
        s = s + 1;
        C = C + 1;
    %if the point guessed is displaying a water sprite
    elseif board_display(c) == 2
        board_display(c) = 10;  %display miss
        C = C + 1;
    %if the point guessed is displaying a miss
    elseif board_display(c) == 10
        [c] = randi([111, 200],1,1);    %random point is guessed
    %if spot guessed is a blank    
    elseif board_display(c) == 1
        [c] = randi([111, 200],1,1);    %random point is guessed
    drawScene(battleship_scene,board_display)   %new board is displayed with the updated marker
    end
    break
end
end
