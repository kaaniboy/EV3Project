function MoveLeft(brick)
     brick.StopAllMotors();
     brick.MoveMotorAngleRel('A', 25, 540, 'coast');
     brick.MoveMotorAngleRel('B', 25, -540, 'coast');
%     currentAngle = brick.GyroAngle(4);
%     desiredAngle = currentAngle + 74;
%     while(currentAngle <= desiredAngle)
%         %brick.MoveMotorAngleRel('A', 50, 5);
%         %brick.MoveMotorAngleRel('B', 50, -5);
%         brick.MoveMotor('A', -15);
%         brick.MoveMotor('B', 15);
%         pause(.01);
%         currentAngle = brick.GyroAngle(4);
%         display(currentAngle);
%     end
%     brick.StopAllMotors();
%     pause(0.5);
end