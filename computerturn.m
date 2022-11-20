clear
clc
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
NewBoard = water_s * ones(10,21);
NewBoard(:,11) = blank_s;
drawScene(battleship_scene,NewBoard)

boardArray = reshape(NewBoard.',1,[]);
s = 0;  %variable s = 16; the number of sprites containing a part of the ship                    
A = 0;
c = 0; 
if [c] == 9 
    while NewBoard(c) == 9             %if the last sprite was a hit, the the computure will choose a number within 10 of the number hit
    l = c %for testing (c is the value from the last set of numbers so l is for this set)
    if NewBoard(c) == 3         %if hit on the left side of the ship
        [c] = NewBoard(c) + 10;       %computer guesses the cell to the right side
        %will either be 4 or 5
        if NewBoard(c) == 4
        NewBoard(c) = 9;
        s = s + 1;
        A = A + 1;
        elseif NewBoard(c) == 5
        NewBoard(c) = 9;
        s = s + 1;
        A = A + 1;
        end
    elseif NewBoard(c) == 4     %if hit on a horizontal piece 
        [c] = NewBoard + 10;       %computer guesses the cell to the right
        %will either be 4 or 5
        if NewBoard(c) == 4
        NewBoard(c) = 9;
        s = s + 1;
        A = A + 1;
        elseif NewBoard(c) == 5
        NewBoard(c) = 9;
        s = s + 1;
        A = A + 1;
        end
    elseif NewBoard(c) == 5     %if hit is on the right side of the ship
        [c] = NewBoard - 10;       %computer guesses the cell to the left
        %will either be 3 or 4
        if NewBoard(c) == 3
        NewBoard(c) = 9;
        s = s + 1;
        A = A + 1;
        elseif NewBoard(c) == 4
        NewBoard(c) = 9;
        s = s + 1;
        A = A + 1;
        end
    elseif NewBoard(c) == 6     %if hit is on the top
        [c] = bboard_display(c) - 1;     %computer guesses cell below
        %will either be 7 or 8
        if NewBoard(c) == 7
        NewBoard(c) = 9;
        s = s + 1;
        A = A + 1;
        elseif NewBoard(c) == 8
        NewBoard(c) = 9;
        s = s + 1;
        A = A + 1;
        end
    elseif NewBoard(c) == 7     %if hit is on the vertical piece
        [c] = NewBoard(c) - 1;     %computer guesses the cell below
        %will either be 7 or 8
        if NewBoard(c) == 7
        NewBoard(c) = 9;
        s = s + 1;
        A = A + 1;
        elseif NewBoard(c) == 8
        NewBoard(c) = 9;
        s = s + 1;
        A = A + 1;
        end
    elseif NewBoard(c) == 8     %if the hit is on the bottom of the ship
        [c] = NewBoard(c) + 1;     % computer guesses one cell above
        %will either be 6 or 7
        if NewBoard(c) == 7
        NewBoard(c) = 9;
        s = s + 1;
        A = A + 1;
        elseif NewBoard(c) == 8
        NewBoard(c) = 9;
        s = s + 1;
        A = A + 1;
        end
    %else battleship_scene(l) = 4; %if hit is still on horizontal piece
        %[c] = randi([111,200],1,1);   %guesses two to the left
    %else battleship_scene(l) = 7 %if hit is still on the vertical piece 
        %[c] = randi([111,200],1,1);    %guesses two to up
    else                                % or if any other situation occurs
         [c] = randi([111, 200],1,1)   %goes back to original while loop
    end
    drawScene(battleship_scene,NewBoard)
end
    elseif [c] ~= 9
    while s <= 16 && [c] ~= 9
    %if the board display already has a dot, another point will be guessed
    %If the board display had a ship, then the board will display a red dot
    %This will add 1 to the variable s, taking away from the total number of sprites with ships
    [c] = randi([111,200],1,1);
    if NewBoard(c) == 3
        NewBoard(c) = 9;
        s = s + 1;
        A = A + 1;
    elseif NewBoard(c) == 4
        NewBoard(c) = 9;
        s = s + 1;
        A = A + 1;
    elseif NewBoard(c) == 5
        NewBoard(c) = 9;
        s = s + 1;
        A = A + 1; 
    elseif NewBoard(c) == 6
        NewBoard(c) = 9;
        s = s + 1;
        A = A + 1;
    elseif NewBoard(c) == 7
        NewBoard(c) = 9;
        s = s + 1;
        A = A + 1;
    elseif NewBoard(c) == 8
        NewBoard(c) = 9;
        s = s + 1;
        A = A + 1;
        %If the board is displaying a water sprite, then when it is hit, a white dot will be displayed in that spot.
    elseif NewBoard(c) == 2
        NewBoard(c) = 10;
        A = A + 1;
    elseif NewBoard(c) == 10
        [c] = randi([111, 200],1,1);
    elseif NewBoard(c) == 1
        [c] = randi([111, 200],1,1);
    drawScene(battleship_scene,NewBoard)
    end
    break
    end
end

