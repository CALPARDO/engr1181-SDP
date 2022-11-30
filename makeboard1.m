

function PlayersShip = makeboard1()
BtlShipScn = simpleGameEngine('Battleship.png',84,84);
% setting my scene with simple game engine and using the provided
% battleship images size is 84 by 84

% setting variables for each sprite so I know what graphics are which
% sprites
blnksprt = 1;
wtrsprt = 2;
leftshp = 3;
midsid = 4;
rtship = 5;
topship = 6;
midvrt = 7; 
btmship = 8;
hit = 9;
miss = 10;

% creating ship arrays using the sprites above
sidshp5 = [3, 4, 4, 4, 5];
sidshp4 = [3, 4, 4, 5];
sidshp3 = [3, 4, 5];
sidshp2 = [3, 5];

vertshp5 = [6; 7; 7; 7; 8];
vertshp4 = [6; 7; 7; 8]; 
vertshp3 = [6; 7; 8];
vertshp2 = [6; 8];

% creating the blank board before the user has played the game at all with
% the water sprite and the ones function
blank_board = wtrsprt * ones(18,18);
blank_board(:,end-3:end) = blnksprt;
blank_board(1:4, :) = blnksprt;
blank_board(15:18, :) = blnksprt;
blank_board(:,1:4) = blnksprt;
blank_board(18, 5:9) = sidshp5;
blank_board(18, 11:14) = sidshp4;
blank_board(16, 6:8) = sidshp3;
blank_board(16, 9:11) = sidshp3;
blank_board(16, 12:13) = sidshp2;



drawScene(BtlShipScn, blank_board)

shp5 = 1;
shp4 = 1; 
shp3 = 2;
shp2 = 1;

shipsPlaced = 0;

uiwait(msgbox(['Instructions: STEP 1: Press the number on your keyboard that correlates to the length of the ship you would like to place (5, 4, 3, or 2).' ...
    ' STEP 2: The game will ask you to press v to place the ship vertically, and h to place it horizontally after clicking OK.' ...
    ' STEP 3: Click on the board where you would like to place the top piece of the ship (if you are placing vertically) or the leftmost piece of the ship (if you are placing horizontally). The rest of the pieces will fill in for you.' ...
    ' STEP 4: The game will ask you to press c to confirm the placement or x to cancel it after pressing OK. You MUST confirm or cancel before moving on.' ...
    ' STEP 5: Once you have all of your ships placed and confirmed, the game will ask you if you would like to confirm your placement. If you do you are done making your board.' ...
    ' STEP 6: Once you have either confirmed or canceled, return to step 1 and press the length of the ship you would like to place (5, 4, 3, or 2).' ...
    ' The ships you still have left to place will appear in the ship bank at the bottom of the display']))


while shipsPlaced < 5


k = getKeyboardInput(BtlShipScn);
 
    if k == '5' && shp5 == 1
        uiwait(msgbox("press v for vertical or h for horizontal","Battleship")) 
        r = getKeyboardInput(BtlShipScn);

            if r == 'v'
            blank_board(2, 7:11) = blnksprt;
            blank_board(7:11,16) = vertshp5;
            drawScene(BtlShipScn, blank_board)
            [a,b] = getMouseInput(BtlShipScn);
                if blank_board(a,b) == 2  && blank_board(a+4,b) == 2 && blank_board(a+3,b) == 2 && blank_board(a+2,b) == 2 && blank_board(a+1,b) == 2
                blank_board(a:a+4,b) = vertshp5;
                blank_board(7:11, 16) = 1;
                drawScene(BtlShipScn,blank_board)
                l = 'f';
                while l=='f'
                uiwait(msgbox("To confirm this placement press c. To cancel, press x.","Battleship"));
                l = getKeyboardInput(BtlShipScn);
                    if l == 'c'
                    shipsPlaced = shipsPlaced + 1;
                    blank_board(7:11,16) = 1;
                    blank_board(18, 5:9) = 1;
                    drawScene(BtlShipScn, blank_board);
                    shp5 = 0;
                    elseif l == 'x'
                    blank_board(2,7:11) = 1;
                    blank_board(a:a+4, b) = wtrsprt;
                    shp5 = 1;
                    drawScene(BtlShipScn, blank_board)
                    else
                        l='f';
                    end
                end
                else
                uiwait(msgbox("this is an invalid placement","Battleship"))
                blank_board(7:11, 16) = blnksprt;
                drawScene(BtlShipScn, blank_board)
                shp5 = 1;
                end
   
            elseif r == 'h'
            blank_board(7:11, 16) = 1;
            blank_board(2,7:11) = sidshp5;
            drawScene(BtlShipScn,blank_board)
            [a,b] = getMouseInput(BtlShipScn);
                if blank_board(a,b) == 2 && blank_board(a, b+4) == 2 && blank_board(a, b+3) == 2 && blank_board(a, b+2) == 2 && blank_board(a, b+1) == 2
                blank_board(a, b:b+4) = sidshp5;
                blank_board(7:11, 16) = 1;
                drawScene(BtlShipScn,blank_board)
                uiwait(msgbox("To confirm this placement press c. To cancel, press x.","Battleship"));
                l = 'f';
                while l == 'f'
                l = getKeyboardInput(BtlShipScn);
                    if l == 'c'
                    shipsPlaced = shipsPlaced + 1;
                    blank_board(2,7:11) = 1;
                    blank_board(18, 5:9) = 1;
                    drawScene(BtlShipScn, blank_board);
                    shp5 = 0;
                    elseif l == 'x'
                    blank_board(2,7:11) = 1;
                    blank_board(a, b:b+4) = wtrsprt;
                    shp5 = 1;
                    drawScene(BtlShipScn, blank_board)
                    else
                        l = 'f';
                    end
                end
                elseif blank_board(a,b) == 1
                blank_board(2,7:11) = 1;
                drawScene(BtlShipScn, blank_board)
                shp5 = 1;
                else
                uiwait(msgbox("this is an invalid placement","Battleship"))
                blank_board(2, 7:11) = blnksprt;
                shp5 = 1;
                drawScene(BtlShipScn, blank_board);
                end
            end 
    elseif k == '5' && shp5 == 0
    blank_board(7:11, 16) = 1;
    uiwait(msgbox("You already placed your 5 long ship. Choose a different ship","Battleship"));
    
    elseif k == '4' && shp4 == 1
      
        uiwait(msgbox("press v for vertical or h for horizontal","Battleship"))
        r = getKeyboardInput(BtlShipScn);

            if r == 'v'
            blank_board(2, 7:10) = blnksprt;
            blank_board(7:10,16) = vertshp4;
            drawScene(BtlShipScn, blank_board)
            [a,b] = getMouseInput(BtlShipScn);
                if blank_board(a,b) == 2 && blank_board(a+3,b) == 2 && blank_board(a+2,b) == 2 && blank_board(a+1,b) == 2
                blank_board(a:a+3,b) = vertshp4;
                blank_board(7:10, 16) = 1;
                drawScene(BtlShipScn,blank_board)
                uiwait(msgbox("To confirm this placement press c. To cancel, press x.","Battleship"));
                l = 'f';
                while l == 'f'
                l = getKeyboardInput(BtlShipScn);
                    if l == 'c'
                    shipsPlaced = shipsPlaced + 1;
                    blank_board(7:10,16) = 1;
                    blank_board(18, 11:14) = 1;
                    drawScene(BtlShipScn, blank_board);
                    shp4 = 0;
                    elseif l == 'x'
                    blank_board(2,7:10) = 1;
                    blank_board(a:a+3, b) = wtrsprt;
                    shp4 = 1;
                    drawScene(BtlShipScn, blank_board)
                    else 
                        l = 'f';
                    end
                end
                else
                uiwait(msgbox("this is an invalid placement","Battleship"))
                blank_board(7:10, 16) = blnksprt;
                drawScene(BtlShipScn, blank_board)
                shp4 = 1;
                end
   
            elseif r == 'h'
            blank_board(7:10, 16) = 1;
            blank_board(2,7:10) = sidshp4;
            drawScene(BtlShipScn,blank_board)
            [a,b] = getMouseInput(BtlShipScn);
                if blank_board(a,b) == 2 && blank_board(a, b+3) == 2 && blank_board(a, b+2) == 2 && blank_board(a, b+1) == 2
                blank_board(a, b:b+3) = sidshp4;
                blank_board(7:10, 16) = 1;
                drawScene(BtlShipScn,blank_board)
                uiwait(msgbox("To confirm this placement press c. To cancel, press x.","Battleship"));
                l = 'f';
                while l == 'f'
                l = getKeyboardInput(BtlShipScn);
                    if l == 'c'
                    shipsPlaced = shipsPlaced + 1;
                    blank_board(2,7:10) = 1;
                    blank_board(18, 11:14) = 1;
                    drawScene(BtlShipScn, blank_board);
                    shp4 = 0;
                    elseif l == 'x'
                    blank_board(2,7:10) = 1;
                    blank_board(a, b:b+3) = wtrsprt;
                    shp4 = 1;
                    drawScene(BtlShipScn, blank_board)
                    else 
                        l = 'f';
                    end
                end
                elseif blank_board(a,b) == 1
                blank_board(2,7:10) = 1;
                drawScene(BtlShipScn, blank_board)
                shp4 = 1;
                else
                uiwait(msgbox("this is an invalid placement","Battleship"))
                blank_board(2, 7:10) = blnksprt;
                shp4 = 1;
                drawScene(BtlShipScn, blank_board);
                end
            end 
    elseif k == '4' && shp4 == 0
    blank_board(7:10, 16) = 1;
    uiwait(msgbox("You already placed your 4 long ship. Choose a different ship","Battleship"));

    elseif k == '3' && shp3 > 0
      
        uiwait(msgbox("press v for vertical or h for horizontal","Battleship"))
        r = getKeyboardInput(BtlShipScn);

            if r == 'v'
            blank_board(2, 7:9) = blnksprt;
            blank_board(7:9,16) = vertshp3;
            drawScene(BtlShipScn, blank_board)
            [a,b] = getMouseInput(BtlShipScn);
                if blank_board(a,b) == 2 && blank_board(a+2,b) == 2 && blank_board(a+1,b) == 2
                blank_board(a:a+2,b) = vertshp3;
                blank_board(7:9, 16) = 1;
                drawScene(BtlShipScn,blank_board)
                uiwait(msgbox("To confirm this placement press c. To cancel, press x.","Battleship"));
                l = 'f';
                while l == 'f'
                l = getKeyboardInput(BtlShipScn);
                    if l == 'c' && shp3 == 2
                    shipsPlaced = shipsPlaced + 1;
                    blank_board(7:9,16) = 1;
                    blank_board(16, 6:8) = 1;
                    drawScene(BtlShipScn, blank_board);
                    shp3 = shp3 - 1;
                    elseif l == 'c' && shp3 == 1
                    shipsPlaced = shipsPlaced + 1;
                    blank_board(7:9,16) = 1;
                    blank_board(16, 9:11) = 1;
                    drawScene(BtlShipScn, blank_board);
                    shp3 = shp3 - 1;
                    elseif l == 'x'
                    blank_board(2,7:9) = 1;
                    blank_board(a:a+2, b) = wtrsprt;
                    drawScene(BtlShipScn, blank_board)
                    else 
                        l = 'f';
                    end
                end
                else
                uiwait(msgbox("this is an invalid placement","Battleship"))
                blank_board(7:9, 16) = blnksprt;
                drawScene(BtlShipScn, blank_board)
                end
   
            elseif r == 'h'
            blank_board(7:9, 16) = 1;
            blank_board(2,7:9) = sidshp3;
            drawScene(BtlShipScn,blank_board)
            [a,b] = getMouseInput(BtlShipScn);
                if blank_board(a,b) == 2 && blank_board(a, b+2) == 2 && blank_board(a, b+1) == 2
                blank_board(a, b:b+2) = sidshp3;
                blank_board(7:9, 16) = 1;
                drawScene(BtlShipScn,blank_board)
                uiwait(msgbox("To confirm this placement press c. To cancel, press x.","Battleship"));
                l = 'f';
                while l == 'f'
                l = getKeyboardInput(BtlShipScn);
                    if l == 'c' && shp3 == 2
                    shipsPlaced = shipsPlaced + 1;
                    blank_board(2,7:9) = 1;
                    blank_board(16, 6:8) = 1;
                    drawScene(BtlShipScn, blank_board);
                    shp3 = shp3 - 1;
                    elseif l == 'c' && shp3 == 1
                    shipsPlaced = shipsPlaced + 1;
                    blank_board(2,7:9) = 1;
                    blank_board(16, 9:11) = 1;
                    drawScene(BtlShipScn, blank_board);
                    shp3 = shp3 - 1;
                    elseif l == 'x'
                    blank_board(2,7:9) = 1;
                    blank_board(a, b:b+2) = wtrsprt;
                    drawScene(BtlShipScn, blank_board)
                    else 
                        l = 'f';
                    end
                end
                elseif blank_board(a,b) == 1
                blank_board(2,7:9) = 1;
                drawScene(BtlShipScn, blank_board)
                shp3 = 1;
                else
                uiwait(msgbox("this is an invalid placement","Battleship"))
                blank_board(2, 7:9) = blnksprt;
                drawScene(BtlShipScn, blank_board);
                end
            end
    elseif k == '3' && shp3 == 0
    blank_board(7:11, 16) = 1;
    uiwait(msgbox("You already placed your 3 long ship. Choose a different ship","Battleship"));

    elseif k == '2' && shp2 == 1
      
        uiwait(msgbox("press v for vertical or h for horizontal","Battleship"))  
        r = getKeyboardInput(BtlShipScn);

            if r == 'v'
            blank_board(2, 7:8) = blnksprt;
            blank_board(7:8,16) = vertshp2;
            drawScene(BtlShipScn, blank_board)
            [a,b] = getMouseInput(BtlShipScn);
                if blank_board(a,b) == 2 && blank_board(a+1,b) == 2
                blank_board(a:a+1,b) = vertshp2;
                blank_board(7:8, 16) = 1;
                drawScene(BtlShipScn,blank_board)
                uiwait(msgbox("To confirm this placement press c. To cancel, press x.","Battleship"));
                l = 'f';
                while l == 'f'
                l = getKeyboardInput(BtlShipScn);
                    if l == 'c'
                    shipsPlaced = shipsPlaced + 1;
                    blank_board(7:8,16) = 1;
                    blank_board(16, 12:13) = 1;
                    drawScene(BtlShipScn, blank_board);
                    shp2 = 0;
                    elseif l == 'x'
                    blank_board(2,7:8) = 1;
                    blank_board(a:a+1, b) = wtrsprt;
                    shp2 = 1;
                    drawScene(BtlShipScn, blank_board)
                    else 
                        l = 'f';
                    end
                end
                else
                uiwait(msgbox("this is an invalid placement","Battleship"))
                blank_board(7:8, 16) = blnksprt;
                drawScene(BtlShipScn, blank_board)
                shp2 = 1;
                end
   
            elseif r == 'h'
            blank_board(7:8, 16) = 1;
            blank_board(2,7:8) = sidshp2;
            drawScene(BtlShipScn,blank_board)
            [a,b] = getMouseInput(BtlShipScn);
                if blank_board(a,b) == 2 && blank_board(a, b+1) == 2
                blank_board(a, b:b+1) = sidshp2;
                blank_board(7:8, 16) = 1;
                drawScene(BtlShipScn,blank_board)
                uiwait(msgbox("To confirm this placement press c. To cancel, press x.","Battleship"));
                l = 'f';
                while l == 'f'
                l = getKeyboardInput(BtlShipScn);
                    if l == 'c'
                    shipsPlaced = shipsPlaced + 1;
                    blank_board(2,7:8) = 1;
                    blank_board(16, 12:13) = 1;
                    drawScene(BtlShipScn, blank_board);
                    shp2 = 0;
                    elseif l == 'x'
                    blank_board(2,7:8) = 1;
                    blank_board(a, b:b+1) = wtrsprt;
                    shp2 = 1;
                    drawScene(BtlShipScn, blank_board)
                    else
                        l = 'f';
                    end
                end
                elseif blank_board(a,b) == 1
                blank_board(2,7:8) = 1;
                drawScene(BtlShipScn, blank_board)
                shp2 = 1;
                else
                uiwait(msgbox("this is an invalid placement","Battleship"))
                blank_board(2, 7:8) = blnksprt;
                shp2 = 1;
                drawScene(BtlShipScn, blank_board);
                end
            end
    elseif k == '2' && shp2 == 0
    blank_board(7:8, 16) = 1;
    uiwait(msgbox("You already placed your 2 long ship. Choose a different ship","Battleship"));
    end

end
uiwait(msgbox("To confirm this placement press c","Battleship"))

k = getKeyboardInput(BtlShipScn);
if k == 'c'
PlayersShip = blank_board(5:14,5:14);
end
PlayersShip;
end



