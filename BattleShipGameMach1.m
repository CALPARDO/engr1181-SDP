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
        [c] = randi([1, 100],1,1);
            if PlayersShip(c) == 3 || PlayersShip(c) == 4 ||PlayersShip(c) == 5 ||PlayersShip(c) == 6 ||PlayersShip(c) == 7 ||PlayersShip(c) == 8
            NewBoard(c+110) = 9;
            s = s + 1;
            A = A + 1;
            CM = CM + 1;
            drawScene(BtlShipScn, NewBoard)
            elseif PlayersShip(c) == 2
            NewBoard(c+110) = 10;
            A = A + 1;
            CM = CM + 1;
            drawScene(BtlShipScn, NewBoard)
            end
        elseif (CM > 1 && PlayersShip(c) == 3) || (CM > 1 && PlayersShip(c) == 4)
        [c] = c + 10;
            if PlayersShip(c) == 3 || PlayersShip(c) == 4 ||PlayersShip(c) == 5 ||PlayersShip(c) == 6 ||PlayersShip(c) == 7 ||PlayersShip(c) == 8
            NewBoard(c+110) = 9;
            s = s + 1;
            A = A + 1;
            CM = CM + 1;
            drawScene(BtlShipScn, NewBoard)
            elseif PlayersShip(c) == 2
            NewBoard(c+110) = 10;
            A = A + 1;
            CM = CM + 1;
            drawScene(BtlShipScn)
            end
        elseif (CM > 1 && PlayersShip(c) == 5)
        [c] = c - 10;
            if PlayersShip(c) == 3 || PlayersShip(c) == 4 ||PlayersShip(c) == 5 ||PlayersShip(c) == 6 ||PlayersShip(c) == 7 ||PlayersShip(c) == 8
            NewBoard(c+110) = 9;
            s = s + 1;
            A = A + 1;
            CM = CM + 1;
            drawScene(BtlShipScn, NewBoard)
            elseif PlayersShip(c) == 2
            NewBoard(c+110) = 10;
            A = A + 1;
            CM = CM + 1;
            drawScene(BtlShipScn)
            end
        elseif (CM > 1 && PlayersShip(c) == 6) || (CM > 1 && PlayersShip(c) == 7)
        [c] = c + 1;
            if PlayersShip(c) == 3 || PlayersShip(c) == 4 ||PlayersShip(c) == 5 ||PlayersShip(c) == 6 ||PlayersShip(c) == 7 ||PlayersShip(c) == 8
            NewBoard(c+110) = 9;
            s = s + 1;
            A = A + 1;
            CM = CM + 1;
            drawScene(BtlShipScn, NewBoard)
            elseif PlayersShip(c) == 2
            NewBoard(c+110) = 10;
            A = A + 1;
            CM = CM + 1;
            drawScene(BtlShipScn)
            end
        elseif (CM > 1 && PlayersShip(c) == 8)
        [c] = c - 1;
            if PlayersShip(c) == 3 || PlayersShip(c) == 4 ||PlayersShip(c) == 5 ||PlayersShip(c) == 6 ||PlayersShip(c) == 7 ||PlayersShip(c) == 8
            NewBoard(c+110) = 9;
            s = s + 1;
            A = A + 1;
            CM = CM + 1;
            drawScene(BtlShipScn, NewBoard)
            elseif PlayersShip(c) == 2
            NewBoard(c+110) = 10;
            A = A + 1;
            CM = CM + 1;
            drawScene(BtlShipScn)
            end
        elseif (CM > 1 && PlayersShip(c) == 2)
        [c] = randi([1, 100],1,1);
        end
        drawScene(BtlShipScn)
    end
end

