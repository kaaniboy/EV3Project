% Left Motor: A
% Right Motor: B
% Color Sensor: 3
% Touch Sensor: 1
% Ultrasonic Sensor: 1
% Gyroscope: 4

NAME = 'Mirage';
controlledByKeyboard = 0;

global key
InitKeyboard();
pause(1);
brick.StopAllMotors();

turns = ['L' 'L' 'L' 'R' 'R' 'L' 'L'];
currTurn = 1;

while 1
          %pause(0.1);        
%         dist = brick.UltrasonicDist(1);
%         display(dist);
%         angle = brick.GyroAngle(4);
%         display(angle);

%         if(DetectColor('BLUE'))
%             display('Blue was seen.');
%         end
%         if(DetectColor('YELLOW'))
%             display('Yellow was seen.');
%         end

        display(key);
        pause(0.1);
        switch key
            case 'c'
                controlledByKeyboard = 1;
                brick.beep();
            case 's'
                controlledByKeyboard = 0;
                brick.beep();
            case 'g'
                GrabPerson(brick);
                brick.beep();
            case 'u'
                UngrabPerson(brick);
                brick.beep();
            case 'uparrow'
                brick.MoveMotorAngleRel('AB', 15, 90);
                brick.WaitForMotor('A');
                brick.WaitForMotor('B');
            case 'leftarrow'
                brick.MoveMotorAngleRel('A', 25, -45);
                brick.WaitForMotor('A');
            case 'rightarrow'
                brick.MoveMotorAngleRel('A', 25, 45);
                brick.WaitForMotor('A');
        end
        
        if(controlledByKeyboard == 0)
            if(brick.TouchPressed(1) || brick.TouchPressed(2))
                brick.StopAllMotors();
                brick.beep();
                brick.MoveMotorAngleRel('AB', 15, -180);
                brick.WaitForMotor('A');
                brick.WaitForMotor('B');

                if(turns(currTurn) == 'L')
                    MoveLeft(brick);
                end
                if(turns(currTurn) == 'R')
                   MoveRight(brick); 
                end

                currTurn = currTurn + 1;
                if(currTurn == 7)
                    currTurn = 1;
                end
            else
                brick.MoveMotorAngleRel('AB', 25, 180);
                brick.WaitForMotor('A');
                brick.WaitForMotor('B');
            end
            pause(0.2);
        end
end
CloseKeyboard();