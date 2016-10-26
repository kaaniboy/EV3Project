%Left Motor: A
%Right Motor: B
NAME = 'Mirage';
%brick = ConnectBrick('Mirage');

brick.StopAllMotors();

while 1
        pause(0.1);        
        dist = brick.UltrasonicDist(1);
        display(dist);
        angle = brick.GyroAngle(4);
        display(angle);

        if(dist >= 20)
            brick.MoveMotor('A', 52);
            brick.MoveMotor('B', 50);
        else
            brick.StopAllMotors();
            MoveRight(brick);
            display('AAA');
        end

        if(brick.TouchPressed(2) == 1)
            brick.StopAllMotors();
            break;
        end

        pause(0.2);
end