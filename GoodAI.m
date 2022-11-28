clc
clear
s = 0;  %variable s = 16; the number of sprites containing a part of the ship                    
A = 0;
c = 0; 
boardArray = reshape(NewBoard.',1,[]);
CM = 1;
x = 0;
A = 0;
for N = 1:1000
    if rem(N,2) > 0
        while x <= 16
            [r,c] = getMouseInput(BtlShipScn);
            if ComputersShip(r,c) == 3 || ComputersShip(r,c) == 4 ||ComputersShip(r,c) == 5 ||ComputersShip(r,c) == 6 ||ComputersShip(r,c) == 7 ||ComputersShip(r,c) == 8 
                NewBoard(r,c) = 9;
                x = x + 1;
                A = A + 1;
                sfx('hit');
            elseif ComputersShip(r,c) == 2
                NewBoard(r,c) = 10;
                A = A + 1;
                sfx('miss');
            end
            drawScene(BtlShipScn, NewBoard)
        end
    elseif s <= 16
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
end


clc
clear
s = 0;  %variable s = 16; the number of sprites containing a part of the ship                    
A = 0;
c = 0; 
boardArray = reshape(NewBoard.',1,[]);
CM = 1;
x = 0;
A = 0;
for N = 1:1000
    if rem(N,2) > 0
        while x <= 16
            [r,c] = getMouseInput(BtlShipScn);
            if ComputersShip(r,c) == 3 || ComputersShip(r,c) == 4 ||ComputersShip(r,c) == 5 ||ComputersShip(r,c) == 6 ||ComputersShip(r,c) == 7 ||ComputersShip(r,c) == 8 
                NewBoard(r,c) = 9;
                x = x + 1;
                A = A + 1;
                sfx('hit');
            elseif ComputersShip(r,c) == 2
                NewBoard(r,c) = 10;
                A = A + 1;
                sfx('miss');
            end
            drawScene(BtlShipScn, NewBoard)
        end
    elseif rem(N,2) == 0
while s <= 16 %number of cells containing part of the ship
    if rem(A,2) == 0 && board_display(c) == hit_s    %RIGHT first guess after a hit is always one spot to the right 
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
    else
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
    end
    end
end


                            
%if while loop is broken, add the randi function so it can start guessing
%random


