function menu(scene_menu,scene_bs)
    sfx_player = sfx('menu');
    drawScene(scene_menu, 1);
    while 1
        if isplaying(sfx_player) == 0; play(sfx_player); end
        [r, c, b] = ginput(1);
        if r >= 225 && r <= 386 && c >= 395 && c <= 556 && b == 1
            stop(sfx_player);
            sfx('hit');
            close all
            cpu(scene_bs);
            %uiwait(msgbox('If you would like to play press 1. If you want to stop playing press 2.','Battleship'));
            %ex = getKeyboardInput(scene_bs);
            %if ex == 2; break; elseif ex == 1; end
            close all
            return;
        elseif r >= 706 && r <= 865 && c >= 395 && c <= 556 && b == 1
            stop(sfx_player);
            sfx('hit');
            close all
            pvp(scene_bs);
            %uiwait(msgbox('If you would like to play press 1. If you want to stop playing press 2.','Battleship'));
            %ex = getKeyboardInput(scene_bs);
            %if ex == 2; break; elseif ex == 1; end
            close all
            return;
        else
            fprintf('bruh\n');
        end
    end
end