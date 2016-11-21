function GrabPerson(brick)
    brick.MoveMotorAngleRel('C', 200, 5);
    pause(0.1);
    brick.MoveMotorAngleRel('C', 200, 5);
    pause(0.1);
    brick.MoveMotorAngleRel('C', 200, 5);
    brick.StopMotor('C', 'Brake');
end
