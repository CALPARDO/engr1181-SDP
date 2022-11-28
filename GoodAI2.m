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
A = 0; %ODD human, EVEN computer
c = boardArray; 
if s <= 16
[c] = randi([111,200],1,1)
    if board_display(c) == left_ship_s || board_display(c) == horizontal_ship_s || board_display(c) == right_ship_s || board_display(c) == top_ship_s || board_display(c) == vertical_ship_s ||  board_display(c) == bottom_ship_s
        board_display(c) = hit_s;
        s = s + 1;
        A = A + 1; 
        %If the board is displaying a water sprite, then when it is hit, a white dot will be displayed in that spot.
    elseif board_display(c) == water_s
        board_display(c) = miss_s;
        A = A + 1;
    elseif board_display(c) == miss_s
        [c] = randi([111, 200],1,1)
    elseif board_display(c) == 1
        [c] = randi([111, 200],1,1)
    end
    drawScene(battleship_scene,board_display)
end

%Smart AI 
%Computer guesses one spot to the left of original, then one to the right, then one up, then one down
%from ORIGINAL:
% one to the right = + 10
%one to the left = - 10
%one up is = - 1
%one down is = + 1
%Use A to make sure the code doesnt go to the next step unless it is an even number
if s <= 16
    while rem(A,2) == 0 && board_display(c) == hit_s    %RIGHT first guess after a hit is always one spot to the right 
        [c] = c + 10;   %FIRST GUESS
        A = A + 1;
        [c] = DisplayFunction(c)
%MAIN IF STATEMENT
        if rem(A,2) == 0 && board_display(c) == hit_s %RIGHT second guess is a hit, one more to the right is guessed
            [c] = c + 10;   %SECOND GUESS
            A = A + 1;
            c = DisplayFunction(c)
            if rem(A,2) == 0 && board_display(c) == hit_s %RIGHT third guess is a hit, one more to the right
                [c] = c + 10;   %THIRD GUESS
                A = A + 1;
                c = DisplayFunction(c)
                if rem(A,2) == 0 && board_display(c) == hit_s %Right fourth guess is a hit, sunk ship so get out of loop
                    [c] = c + 10;   %FOURTH GUESS
                    A = A + 1;
                    c = DisplayFunction(c)
                    break
                else
                    break
                end
            elseif rem(A,2) == 0 && board_display(c) == miss_s %LEFT third guess is a miss, one to left
                [c] = c - 10;   %THIRD GUESS
                A = A + 1;
                c = DisplayFunction(c)
                if rem(A,2) == 0 && board_display(c) == hit_s %LEFT fourth guess is a hit, one to left
                    [c] = c - 10;   %FOURTH GUESS
                    A = A + 1;
                    c = DisplayFunction(c)
                    if rem(A,2) == 0 && board_display(c) == hit_s %LEFT fifth guess is a hit, one to left, sunk ship for sure so get out of loop
                        [c] = c - 10;   %FIFTH GUESS
                        A = A + 1;
                        c = DisplayFunction(c)
                        break
                    else
                        break
                    end
                else
                    break 
                end
            else
                break
            end           
%MAIN ELSE STATEMENT 
        elseif rem(A,2) == 0 && board_display(c) == miss_s %LEFT first guess is a miss, one to the left of the original is guessed
            [c] = c - 20;   %SECOND GUESS
            A = A + 1;
            c = DisplayFunction(c)
            if rem(A,2) == 0 && board_display(c) == hit_s %LEFT second guess is a hit, guess one to the left
                [c] = c - 10;   %THIRD GUESS
                A = A + 1;
                c = DisplayFunction(c)
                if rem(A,2) == 0 && board_display(c) == hit_s %LEFT third guess is a hit
                    [c] = c - 10;   %FOURTH GUESS
                    A = A + 1;
                    c = DisplayFunction(c)
                    if rem(A,2) == 0 && board_display(c) == hit_s %LEFT fourth guess is a hit, SUNK
                        [c] = c - 10;   %FIFTH GUESS
                        A = A + 1;
                        c = DisplayFunction(c)
                    else
                        break
                    end
                else
                    break
                end
            elseif rem(A,2) == 0 && board_display(c) == miss_s %UP third guess is a miss
                [c] = c + 9; %THIRD GUESS
                A = A + 1;
                c = DisplayFunction(c)
                if rem(A,2) == 0 && board_display(c) == hit_s %UP fourth guess is a hit
                    [c] = c - 1; %FOURTH GUESS 
                    A = A + 1;
                    c = DisplayFunction(c)
                     if rem(A,2) == 0 && board_display(c) == hit_s %UP fifth guess is a hit
                         [c] = c - 1; %FIFTH GUESS
                         A = A + 1;
                         c = DisplayFunction(c)
                          if rem(A,2) == 0 && board_display(c) == hit_s %UP sixth guess up is a hit, SUNK
                              [c] = c - 1;  %SIXTH GUESS
                              A = A + 1;
                              c = DisplayFunction(c)
                          else
                              break
                          end
                     elseif rem(A,2) == 0 && board_display(c) == miss_s %DOWN fifth guess is a miss
                         [c] = c + 3;
                         A = A + 1;
                         c = DisplayFunction(c)
                         if rem(A,2) == 0 && board_display(c) == hit_s %DOWN sixth guess is a hit
                             [c] = c + 1;
                             A = A + 1;
                             c = DisplayFunction(c)
                             if rem(A,2) == 0 && board_display(c) == hit_s %DOWN seventh guess down is a hit, SUNK
                                 [c] = c + 1;
                                 A = A + 1;
                                 c = DisplayFunction(c)
                                 break
                             else
                                 break 
                             end
                         else
                             break
                         end
                     else
                         break
                     end
                elseif rem(A,2) == 0 && board_display(c) == miss_s %DOWN fourth guess is a miss
                    [c] = c + 2;
                    A = A + 1;
                    c = DisplayFunction(c)   
                    if rem(A,2) == 0 && board_display(c) == hit_s %DOWN fifth guess down is a hit
                         [c] = c + 1;
                         A = A + 1;
                         c = DisplayFunction(c)
                         if rem(A,2) == 0 && board_display(c) == hit_s %DOWN sixth guess is a hit 
                             [c] = c + 1;
                             A = A + 1;
                             c = DisplayFunction(c)
                             if rem(A,2) == 0 && board_display(c) == hit_s %DOWN seventh guess is a hit, SUNK
                                 [c] = c + 1;
                                 A = A + 1;
                                 c = DisplayFunction(c)
                                 break
                             else
                                 break
                             end
                         else
                             break
                         end
                    else
                        break
                    end
                else
                    break
                end
            else
                break
            end
        else
            break
        end
    end
end

                            
%if while loop is broken, add the randi function so it can start guessing
%random


