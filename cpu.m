function cpu(BtlShipScn)
    
    ComputersShip = ComputerShip();
    
    NewBoard = 2 * ones(10,10);
    drawScene(BtlShipScn, NewBoard)
    x = 0;
    A = 0;

    sfx_player = sfx('game');
    if isplaying(sfx_player) == 0; play(sfx_player); end
    
    while x <= 16
                [r,c] = getMouseInput(BtlShipScn);
                if (ComputersShip(r,c) == 3 || ComputersShip(r,c) == 4 ||ComputersShip(r,c) == 5 ||ComputersShip(r,c) == 6 ||ComputersShip(r,c) == 7 ||ComputersShip(r,c) == 8) && NewBoard(r,c) == 2
                    NewBoard(r,c) = 9;
                    x = x + 1;
                    A = A + 1;
                    sfx('hit');
                    if isplaying(sfx_player) == 0; play(sfx_player); end
                elseif ComputersShip(r,c) == 2 && NewBoard(r,c) == 2
                    NewBoard(r,c) = 10;
                    A = A + 1;
                    sfx('miss');
                    if isplaying(sfx_player) == 0; play(sfx_player); end
                end
                drawScene(BtlShipScn, NewBoard)
                if x > 16 
                    uiwait(msgbox(sprintf('Congratulations! You Win! It took you %i guesses!',A),'Battleship'))
                end
    end
end