function menu(scene_menu)
    sfx_player = sfx('menu');
    drawScene(scene_menu, 1);
    while 1
        [r, c, b] = ginput(1);
        if r >= 459 && r <= 620 && c >= 394 && r <= 555 && b == 1
            stop(sfx_player);
            close all
            return;
        end
        %{
         elseif r >= 247 && r <= 355 && c >= 557 && r <= 668 && b == 1
            if isplaying(sfx_player) == 0; play(sfx_player); end
            close all
            game_set();
        end
        %}
    end
end