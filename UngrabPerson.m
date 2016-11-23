function UngrabPerson(brick)
    brick.MoveMotorAngleRel('C', -200, 5);
    pause(0.1);
    brick.MoveMotorAngleRel('C', -200, 5);
    pause(0.1);
    brick.MoveMotorAngleRel('C', -200, 5);
end
