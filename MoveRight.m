function MoveRight(brick)
    brick.MoveMotor('A', 100);
    brick.MoveMotor('B', -100);
    pause(1);
    brick.StopMotor('A');
    brick.StopMotor('B');
end
