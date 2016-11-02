%Left Motor: A
%Right Motor: B
%Color Sensor: 3
%Touch Sensor: 2
%Ultrasonic Sensor: 1
%Gyroscope: 4

NAME = 'Mirage';
%brick = ConnectBrick('Mirage');

brick.StopAllMotors();

turns = ['L' 'L' 'R' 'L' 'L' 'R'];
currTurn = 1;
da = brick.GyroAngle(4);
leftSpeed = 50;
rightSpeed = 50;
while 1
        pause(0.1);        
        dist = brick.UltrasonicDist(1);
        angle = brick.GyroAngle(4);

        if(dist >= 30)
%             brick.MoveMotor('A', 52);
%             brick.MoveMotor('B', 50);
        else
            brick.StopAllMotors();
            if(turns(currTurn) == 'L')
                MoveLeft(brick);
                da = da - 90;
            end
            if(turns(currTurn) == 'R')
               MoveRight(brick); 
               da = da + 90;
            end
            
            currTurn = currTurn + 1;
            display('AAA');
        end
        
        if(angle < da)
            leftSpeed = leftSpeed + 5;
            rightSpeed = rightSpeed - 5;
        elseif(angle > da)
            leftSpeed = leftSpeed - 5;
            rightSpeed = rightSpeed + 5;
        end
        
        if(leftSpeed > 100)
            leftSpeed = 100;
        elseif(leftSpeed < 0)
            leftSpeed = 0;
        end
        if(rightSpeed > 100)
            rightSpeed = 100;
        elseif(rightSpeed < 0)
            rightSpeed = 0;
        end
        
        brick.MoveMotor('A', leftSpeed);
        brick.MoveMotor('B', rightSpeed);

        if(brick.TouchPressed(2) == 1)
            brick.StopAllMotors();
            break;
        end
    
        display([leftSpeed, rightSpeed, da]);
end