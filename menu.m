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
            fprintf('CPU\n');
            return;
        elseif r >= 706 && r <= 865 && c >= 395 && c <= 556 && b == 1
            stop(sfx_player);
            sfx('hit');
            close all
            pvp(scene_bs);
            fprintf('PVP\n');
            return;
        else
            fprintf('bruh\n');
        end
    end
end