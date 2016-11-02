% Left Motor: A
% Right Motor: B
% Color Sensor: 3
% Touch Sensor: 1
% Ultrasonic Sensor: 1
% Gyroscope: 4

NAME = 'Mirage';
%brick = ConnectBrick('Mirage');

brick.StopAllMotors();

turns = ['L' 'L' 'R' 'L' 'R' 'R' 'L'];
currTurn = 1;

while 1
        pause(0.1);        
%         dist = brick.UltrasonicDist(1);
%         display(dist);
%         angle = brick.GyroAngle(4);
%         display(angle);
% 
        if(brick.TouchPressed(1) == 1)
            brick.StopAllMotors();
            brick.MoveMotorAngleRel('A', 25, -180);
            brick.MoveMotorAngleRel('B', 25, -180);
            pause(2);
            
            if(turns(currTurn) == 'L');
                MoveLeft(brick);
            end
            if(turns(currTurn) == 'R');
               MoveRight(brick); 
            end
            currTurn = currTurn + 1;
        else
            brick.MoveMotorAngleRel('A', 25, 180);
            brick.MoveMotorAngleRel('B', 25, 180);
        end

        pause(0.2);
end

MoveLeft(brick);