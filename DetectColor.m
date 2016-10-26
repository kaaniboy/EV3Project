function result = DetectColor(brick, color)
    if(strcmp(color,'BLUE'))
        result = brick.ColorColor(2) == 2;
    elseif(strcmp(color,'YELLOW'))
        result = brick.ColorColor(2) == 4;
    elseif(strcmp(color, 'RED'))
        result = brick.ColorColor(2) == 5;
    end
end

