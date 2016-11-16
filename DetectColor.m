function result = DetectColor(brick, color)
    if(strcmp(color,'BLUE'))
        result = brick.ColorColor(3) == 2;
    elseif(strcmp(color,'YELLOW'))
        result = brick.ColorColor(3) == 4;
    elseif(strcmp(color, 'RED'))
        result = brick.ColorColor(3) == 5;
    end
end

