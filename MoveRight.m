function MoveRight(brick)
    currentAngle = brick.GyroAngle(4);
    desiredAngle = currentAngle + 90;
    while(currentAngle <= desiredAngle)
        brick.MoveMotorAngleRel('A', 50, 5);
        brick.MoveMotorAngleRel('B', 50, -5);
        pause(.1);
        currentAngle = brick.GyroAngle(4);
        display(currentAngle);
    end
    pause(1);
    brick.StopAllMotors();
end
