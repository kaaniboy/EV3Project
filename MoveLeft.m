function MoveLeft(brick)
    brick.MoveMotor('B', 100);
    brick.MoveMotor('A', -100);
    pause(1);
    brick.StopMotor('B');
    brick.StopMotor('A');
end


