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

while 1
        pause(0.1);        
        dist = brick.UltrasonicDist(1);
        display(dist);
        angle = brick.GyroAngle(4);
        display(angle);

        if(dist >= 30)
            brick.MoveMotor('A', 50);
            brick.MoveMotor('B', 50);
        else
            brick.StopAllMotors();
            if(turns(currTurn) == 'L');
                MoveLeft(brick);
            end
            if(turns(currTurn) == 'R');
               MoveRight(brick); 
            end
            
            currTurn = currTurn + 1;
            display('AAA');
        end

        if(brick.TouchPressed(2) == 1)
            brick.StopAllMotors();
            break;
        end

        pause(0.2);
end