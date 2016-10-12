function MoveRight(brick)
    brick.MoveMotor('A', 100);
    pause(1);
    brick.StopMotor('A');
end
