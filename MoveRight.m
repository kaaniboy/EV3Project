function MoveRight(brick)
     brick.StopAllMotors();
     brick.MoveMotorAngleRel('A', 25, 360);
     %brick.MoveMotorAngleRel('B', 25, -180);
     
     brick.WaitForMotor('A');
     %brick.WaitForMotor('B');
end