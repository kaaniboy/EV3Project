function MoveLeft(brick)
    brick.MoveMotor('B', 50);
    brick.MoveMotor('A', -50);
    pause(.4);
    brick.StopMotor('B');
    brick.StopMotor('A');
end


