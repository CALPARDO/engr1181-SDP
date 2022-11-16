function menu(scene_menu_f, s_menu_bg_f)
    drawScene(scene_menu_f, s_menu_bg_f);
    while 1
        [r, c, b] = ginput(1);
        if r >= 459 && r <= 620 && c >= 394 && r <= 555 && b == 1
            close all
            return;
        end
    end
end