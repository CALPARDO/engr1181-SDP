function sfx(sfx_id)
    switch sfx_id
        case 'menu'
            [y_menu, Fs_menu] = audioread('src/sfx/menu.mp3');
            sound(y_menu, Fs_menu, 16);
        case 'hit'
            [y_hit, Fs_hit] = audioread('src/sfx/hit.mp3');
            sound(y_hit, Fs_hit, 16);
        case 'miss'
            [y_miss, Fs_miss] = audioread('src/sfx/miss.mp3');
            sound(y_miss, Fs_miss, 16); 
        case 'close'
            close sound
    end
end