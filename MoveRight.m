function MoveRight(brick)
    currentAngle = brick.GyroAngle(4);
    desiredAngle = currentAngle + 90;
    while(currentAngle <= desiredAngle)
        %brick.MoveMotorAngleRel('A', 50, 5);
        %brick.MoveMotorAngleRel('B', 50, -5);
        brick.MoveMotor('A', 10);
        brick.MoveMotor('B', -10);
        pause(.05);
        currentAngle = brick.GyroAngle(4);
        display(currentAngle);
    end
    brick.StopAllMotors();
    pause(1);
end
