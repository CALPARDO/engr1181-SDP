function mode2()

BtlShipScn = simpleGameEngine('Battleship.png',84,84);
m = input('Player 1, Enter your name: ','s');
w = input('Player 2, Enter your name: ','s');
Plyr1Ship = makeboard();
close all;
Plyr2Ship = makeboard();
close all;


AttackingB = 2 * ones(10,21);
AttackingB(:,11) = 1;
AttackingB(:,1:10) = Plyr1Ship;
AttackingB(:,12:21) = Plyr2Ship;
Board = 2 * ones(10,21);
Board(:, 11) = 1;

x = 0;
r = 0;
A = 0;
B = 0;


while x<=16 && r<=16
    drawScene(BtlShipScn, Board)
    uiwait(msgbox(sprintf('%s, it is your turn. Click on the right side of the board where you would like to attack.',m),'Battleship'))
            [r,c] = getMouseInput(BtlShipScn);
            if (AttackingB(r,c) == 3 || AttackingB(r,c) == 4 ||AttackingB(r,c) == 5 ||AttackingB(r,c) == 6 ||AttackingB(r,c) == 7 ||AttackingB(r,c) == 8) && (Board(r,c) == 2)  
                Board(r,c) = 9;
                x = x + 1;
                A = A + 1;
                sfx('hit');
            elseif AttackingB(r,c) == 2 && Board(r,c) == 2
                Board(r,c) = 10;
                A = A + 1;
                sfx('miss');
            end
            drawScene(BtlShipScn, Board)
            pause(.5)
            drawScene(BtlShipScn, Board)
            uiwait(msgbox(sprintf('%s, it is your turn. Click on the left side of the board where you would like to attack',w),'Battleship'))
            [r,c] = getMouseInput(BtlShipScn);
            if (AttackingB(r,c) == 3 || AttackingB(r,c) == 4 ||AttackingB(r,c) == 5 ||AttackingB(r,c) == 6 ||AttackingB(r,c) == 7 ||AttackingB(r,c) == 8) && Board(r,c) == 2 
                Board(r,c) = 9;
                r = r + 1;
                B = B + 1;
                sfx('hit');
            elseif AttackingB(r,c) == 2
                Board(r,c) = 10;
                B = B + 1;
                sfx('miss');
            end
            drawScene(BtlShipScn, Board)
            pause(.5)
            if x > 16 
                uiwait(msgbox(sprintf('Congratulations Player 1, You Win! It took you %i guesses!',A),'Battleship'))
                break
            elseif r > 16 
                uiwait(msgbox(sprintf('Congratulations Player 2, You Win! It took you %i guesses!',B),'Battleship'))
                break
            end
end
end