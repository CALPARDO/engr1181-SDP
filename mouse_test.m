function mouse_event = mouse_test()
while 1
    [r, c, b] = ginput(1);
    mouse_event = [r, c, b];
    mouse_event
end