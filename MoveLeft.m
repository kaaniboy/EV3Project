function MoveLeft(brick)
    currentAngle = brick.GyroAngle(4);
    desiredAngle = currentAngle - 82;
    while(currentAngle >= desiredAngle)
        %brick.MoveMotorAngleRel('A', 50, 5);
        %brick.MoveMotorAngleRel('B', 50, -5);
        brick.MoveMotor('A', -15);
        brick.MoveMotor('B', 15);
        pause(.01);
        currentAngle = brick.GyroAngle(4);
        display(currentAngle);
    end
    brick.StopAllMotors();
    pause(0.5);
end


