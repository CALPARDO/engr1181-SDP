function menu(scene_menu)
    sfx_player = sfx('game');
    drawScene(scene_menu, 1);
    while 1
        if isplaying(sfx_player) == 0; play(sfx_player); end
        [r, c, b] = ginput(1);
        if r >= 225 && r <= 386 && c >= 395 && c <= 556 && b == 1
            %stop(sfx_player);
            %close all
            %cpu();
            fprintf('CPU\n');
            %return;
        elseif r >= 706 && r <= 865 && c >= 395 && c <= 556 && b == 1
            if isplaying(sfx_player) == 0; play(sfx_player); end
            %close all
            %pvp();
            fprintf('PVP\n');
        else
            fprintf('idiot\n');
        end
    end
end