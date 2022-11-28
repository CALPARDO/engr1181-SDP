function sfx_player = sfx(sfx_id)
    load('src\sfx\sfx.mat');
    switch sfx_id
        case 'menu'
            %[y_menu, Fs_menu] = audioread('src/sfx/menu.mp3');
            p_menu = audioplayer(y_menu, Fs_menu, 16);
            sfx_player = p_menu;
            if isplaying(sfx_player) == 0; play(sfx_player); end
        case 'hit'
            %[y_hit, Fs_hit] = audioread('src/sfx/hit.wav');
            sound(y_hit, Fs_hit, 16);
        case 'miss'
            %[y_miss, Fs_miss] = audioread('src/sfx/miss.mp3');
            sound(y_miss, Fs_miss, 16);
        case 'game'
            %[y_game, Fs_game] = audioread('src/sfx/game.mp3');
            p_game = audioplayer(y_game, Fs_game, 16);
            sfx_player = p_game;
        otherwise
            return;
    end
end