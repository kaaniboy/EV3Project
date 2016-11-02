%Left Motor: A
%Right Motor: B
NAME = 'Mirage';
%brick = ConnectBrick('Mirage');

brick.StopAllMotors();
desiredAngle = brick.GyroAngle(4);
leftSpeed = 50;
rightSpeed = 50;
while 1
        pause(0.1);        
        dist = brick.UltrasonicDist(1);
        display(dist);
        angle = brick.GyroAngle(4);
        display(angle);
        
        if(angle < desiredAngle)
            leftSpeed = leftSpeed - 1;
            rightSpeed = rightSpeed + 1;
        elseif(angle > desiredAngle)
            leftSpeed = leftSpeed + 1;
            rightSpeed = rightSpeed - 1;
        end
        
        if(dist >= 20)
%             brick.MoveMotor('A', 52);
%             brick.MoveMotor('B', 50);
        else
%            brick.StopAllMotors();
%            MoveRight(brick);
            desiredAngle = desiredAngle + 90;
            display('AAA');
        end
        
        brick.

        if(brick.TouchPressed(2) == 1)
            brick.StopAllMotors();
            break;
        end

        pause(0.2);
end