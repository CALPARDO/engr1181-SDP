function sfx_player = sfx(sfx_id) %defines sfx function
    load('src\sfx\sfx.mat'); %loads a mat file that contains the music and sound effects
    switch sfx_id
        case 'menu' %menu music case
            %[y_menu, Fs_menu] = audioread('src/sfx/menu.mp3'); %commented out because the variables are stored in mat file now to remove the delay caused by reading audio
            p_menu = audioplayer(y_menu, Fs_menu, 16); %create a menu audio player
            sfx_player = p_menu; %assign it into the output
            if isplaying(sfx_player) == 0; play(sfx_player); end %if player is stopped or the music ended, replay
        case 'hit' %hit sfx case
            %[y_hit, Fs_hit] = audioread('src/sfx/hit.wav');
            sound(y_hit, Fs_hit, 16); %play the hit sfx
        case 'miss' %miss sfx case
            %[y_miss, Fs_miss] = audioread('src/sfx/miss.mp3');
            sound(y_miss, Fs_miss, 16); %play the miss sfx
        case 'game' %game music case
            %[y_game, Fs_game] = audioread('src/sfx/game.mp3');
            p_game = audioplayer(y_game, Fs_game, 16); %create a game audio player
            sfx_player = p_game; %assign it into the output
        otherwise
            return;
    end
end
