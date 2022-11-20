%Computer Guessing where ships are
%column = randi[12 21]
%row = randi[4 13] (change for actual game)
%Board size of where computer is randomly guessing a point
boardArray = reshape(board_display.',1,[]);
s = 0;  %variable s = 16; the number of sprites containing a part of the ship                    
C = 0;
c = 0;  %c = point on the board  

while s <= 16   %while the number of cells containing a point with a red dot is less than 16, the while loop will run for the computer to guess a point on the board
    %if the board display already has a dot, another point will be guessed
    %if the board display had a ship, then the board will display a red dot
    %This will add 1 to the variable s, taking away from the total number of sprites with ships
    [c] = randi([111,200],1,1);
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
