clc 
clear

BtlShipScn = simpleGameEngine('Battleship.png',84,84);

ComputersShip = ComputerShip();

drawScene(BtlShipScn, ComputersShip);

PlayersShip = makeboard();

NewBoard = 2 * ones(10,21);
NewBoard(:,11) = 1;
NewBoard(:, 12:end) = PlayersShip;
drawScene(BtlShipScn, NewBoard);

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
        if CM == 1 
            if s <= 16
                [c] = randi([111,200],1,1)
                if NewBoard(c) == left_ship_s || NewBoard(c) == horizontal_ship_s || NewBoard(c) == right_ship_s || NewBoard(c) == top_ship_s || NewBoard(c) == vertical_ship_s ||  NewBoard(c) == bottom_ship_s
                    NewBoard(c) = hit_s;
                    s = s + 1;
                    C = C + 1 
                    %If the board is displaying a water sprite, then when it is hit, a white dot will be displayed in that spot
                    elseif NewBoard(c) == water_s
                        NewBoard(c) = miss_s;
                        C = C + 1;
                elseif NewBoard(c) == miss_s
                    [c] = randi([111, 200],1,1)
                elseif NewBoard(c) == 1
                    [c] = randi([111, 200],1,1)
                end
                drawScene(BtlShipScn,NewBoard)
            end
        elseif CM ~= 1
            if s <= 16
                if NewBoard(c) ~= 9
                    [c] = randi([111,200],1,1)
                    if NewBoard(c) == left_ship_s || NewBoard(c) == horizontal_ship_s || NewBoard(c) == right_ship_s || NewBoard(c) == top_ship_s || NewBoard(c) == vertical_ship_s ||  NewBoard(c) == bottom_ship_s
                        NewBoard(c) = hit_s;
                        s = s + 1;
                        C = C + 1 
                        %If the board is displaying a water sprite, then when it is hit, a white dot will be displayed in that spot.
                      elseif NewBoard(c) == water_s
                          NewBoard(c) = miss_s;
                          C = C + 1;
                    elseif NewBoard(c) == miss_s
                        [c] = randi([111, 200],1,1)
                    elseif NewBoard(c) == 1
                        [c] = randi([111, 200],1,1)
                    end
                    drawScene(battleship_scene,NewBoard)
                elseif NewBoard(c) == 9
                    if NewBoard(c) == 3         %%if hit on the left side of the ship
                        [c] = NewBoard(c) + 10;       %computer guesses the cell to the right side
                        %will either be 4 or 5
                          if NewBoard(c) == 4
                              NewBoard(c) = 9;
                              s = s + 1;
                              C = C + 1;
                          elseif NewBoard(c) == 5
                              NewBoard(c) = 9;
                              s = s + 1;
                              C = C + 1;
                          end
                    elseif NewBoard(c) == 4     %%if hit on a horizontal piece 
                          [c] = NewBoard + 10;       %computer guesses the cell to the right
                          %will either be 4 or 5
                            if NewBoard(c) == 4
                                NewBoard(c) = 9;
                                s = s + 1;
                                C = C + 1;
                            elseif NewBoard(c) == 5
                                NewBoard(c) = 9;
                                s = s + 1;
                                C = C + 1;
                            end
                    elseif NewBoard(c) == 5     %%if hit is on the right side of the ship
                          [c] = NewBoard - 10;       %computer guesses the cell to the left
                          %will either be 3 or 4
                            if NewBoard(c) == 3
                                NewBoard(c) = 9;
                                s = s + 1;
                                C = C + 1;
                            elseif NewBoard(c) == 4
                                NewBoard(c) = 9;
                                s = s + 1;
                                C = C + 1;
                            end
                    elseif NewBoard(c) == 6     %%if hit is on the to
                          [c] = NewBoard(c) - 1;     %computer guesses cell below
                          %will either be 7 or 8
                            if NewBoard(c) == 7
                                NewBoard(c) = 9;
                                s = s + 1;
                                C = C + 1;
                            elseif NewBoard(c) == 8
                                NewBoard(c) = 9;
                                s = s + 1;
                                C = C + 1;
                            end
                    elseif NewBoard(c) == 7     %%if hit is on the vertical piece
                          [c] = NewBoard(c) - 1;     %computer guesses the cell below
                          %will either be 7 or 8
                            if NewBoard(c) == 7
                                NewBoard(c) = 9;
                                s = s + 1;
                                C = C + 1;
                            elseif NewBoard(c) == 8
                                NewBoard(c) = 9;
                                s = s + 1;
                                C = C + 1;
                            end
                    elseif NewBoard(c) == 8     %%if the hit is on the bottom of the ship
                          [c] = NewBoard(c) + 1;     % computer guesses one cell above
                          %will either be 6 or 7
                            if NewBoard(c) == 7
                                NewBoard(c) = 9;
                                s = s + 1;
                                C = C + 1;
                            elseif NewBoard(c) == 6
                                NewBoard(c) = 9;
                                s = s + 1;
                                C = C + 1;
                            end
                            %else battleship_scene(l) = 4; %%if hit is still on horizontal piece
                            %[c] = randi([111,200],1,1);   %guesses two to the left
                            %else battleship_scene(l) == 7 %%if hit is still on the vertical piece 
                            %[c] = randi([111,200],1,1);    %guesses two to up
                      else                                % or if any other situation occurs
                            [c] = randi([111, 200],1,1)   %goes back to original while loop
                      end
                    drawScene(BtlShipScn,NewBoard)
                end
            end
        end
    end
end




           