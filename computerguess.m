%Computer Guessing where ships are
%column = randi[12 21]
%row = randi[4 13] (change for actual game)
%Board size of where computer is randomly guessing a point
boardArray = reshape(board_display.',1,[]);
s = 0;  %variable s = 16; the number of sprites containing a part of the ship                    
C = 0;
c = 0; 

while s <= 16
    %if the board display already has a dot, another point will be guessed
    %If the board display had a ship, then the board will display a red dot
    %This will add 1 to the variable s, taking away from the total number of sprites with ships
    [c] = randi([111,200],1,1);
    if board_display(c) == 3
        board_display(c) = 9;
        s = s + 1;
        C = C + 1;
    elseif board_display(c) == 4
        board_display(c) = 9;
        s = s + 1;
        C = C + 1;
    elseif board_display(c) == 5
        board_display(c) = 9;
        s = s + 1;
        C = C + 1; 
    elseif board_display(c) == 6
        board_display(c) = 9;
        s = s + 1;
        C = C + 1;
    elseif board_display(c) == 7
        board_display(c) = 9;
        s = s + 1;
        C = C + 1;
    elseif board_display(c) == 8
        board_display(c) = 9;
        s = s + 1;
        C = C + 1;
        %If the board is displaying a water sprite, then when it is hit, a white dot will be displayed in that spot.
    elseif board_display(c) == 2
        board_display(c) = 10;
        C = C + 1;
    elseif board_display(c) == 10
        [c] = randi([111, 200],1,1);
    elseif board_display(c) == 1
        [c] = randi([111, 200],1,1);
    drawScene(battleship_scene,board_display)
    end
    break
end