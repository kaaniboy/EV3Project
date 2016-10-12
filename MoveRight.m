function MoveRight(brick)
    brick.MoveMotorAngleRel('A', 50, 720);
    brick.MoveMotorAngleRel('B', 50, -720);
    %pause(1);
    %brick.StopMotor('A');
    %brick.StopMotor('B');
end
