function MoveLeft(brick)
    brick.MoveMotor('B', 100);
    pause(1);
    brick.StopMotor('B');
end


