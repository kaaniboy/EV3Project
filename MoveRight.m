function MoveRight(brick)
    currentAngle = brick.GyroAngle(4);
    desiredAngle = currentAngle + 74;
    while(currentAngle <= desiredAngle)
        %brick.MoveMotorAngleRel('A', 50, 5);
        %brick.MoveMotorAngleRel('B', 50, -5);
        brick.MoveMotor('A', 10);
        brick.MoveMotor('B', -10);
        pause(.01);
        currentAngle = brick.GyroAngle(4);
        display(currentAngle);
    end
    brick.StopAllMotors();
    pause(0.5);
end