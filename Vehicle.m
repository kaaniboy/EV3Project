NAME = 'Earth';
controlledByKeyboard = 0;

global key
InitKeyboard();
pause(1);
brick.StopAllMotors();
currColorTurnDirection = -180;

currColorAngle = brick.GetMotorAngle('D');

turns = ['L' 'L' 'L' 'L' 'R' 'R' 'R' 'R' 'R' 'L' 'L' 'R' 'R' 'R'];
currTurn = 1;

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
%         brick.MoveMotorAngleRel('D', 15, 200);
%         brick.WaitForMotor(4);
%         brick.MoveMotorAngleRel('D', 15, -200);
%         brick.WaitForMotor(4);

while 1      
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
            case 'u'
                UngrabPerson(brick);
            case 'uparrow'
                brick.StopAllMotors();
                brick.MoveMotorAngleRel('AB', 15, 90);
                brick.WaitForMotor('A');
                brick.WaitForMotor('B');
            case 'downarrow'
                brick.StopAllMotors();
                brick.MoveMotorAngleRel('AB', 15, -90);
                brick.WaitForMotor('A');
                brick.WaitForMotor('B');
            case 'leftarrow'
                brick.StopAllMotors();
                brick.MoveMotorAngleRel('A', 25, -45);
                brick.WaitForMotor('A');
            case 'rightarrow'
                brick.StopAllMotors();
                brick.MoveMotorAngleRel('A', 25, 45);
                brick.WaitForMotor('A');
        end
        
        if(controlledByKeyboard == 0)
%             x = brick.GetMotorAngle('D');
%         
%             display(x);
%             display(currColorAngle);
%             display(x - currColorAngle);
%             if(abs(x - currColorAngle) <= 5)
%                 display('triggered');
%                 currColorTurnDirection = -1 * currColorTurnDirection;
%                 brick.MoveMotorAngleRel('D', 25, currColorTurnDirection);
%             end
%             currColorAngle = x;

            leftDist = brick.UltrasonicDist(4);
            leftPressed = brick.TouchPressed(1);
            rightPressed = brick.TouchPressed(2);
            
            display(rightPressed);
            
            
            if(DetectColor(brick, 'RED'))
                brick.beep();
                brick.beep();
                brick.beep();
                pause(4);
                brick.MoveMotorAngleRel('AB', 25, 180);
                brick.WaitForMotor('A');
                brick.WaitForMotor('B');
                
            elseif(leftPressed || rightPressed || leftDist > 20 || leftDist == 255)
                brick.StopAllMotors();
                brick.beep();
%                 brick.MoveMotorAngleRel('AB', 15, -180);
%                 brick.WaitForMotor('A');
%                 brick.WaitForMotor('B');
                if(leftPressed || rightPressed)
                    brick.MoveMotorAngleRel('AB', 15, -300);
                    brick.WaitForMotor('A');
                    brick.WaitForMotor('B');
                else
                    brick.MoveMotorAngleRel('AB', 15, 300);
                    brick.WaitForMotor('A');
                    brick.WaitForMotor('B');
                end
                brick.StopAllMotors();

                if(turns(currTurn) == 'L')
                    MoveLeft(brick);
                end
                if(turns(currTurn) == 'R')
                   MoveRight(brick); 
                end
                
                brick.StopAllMotors();

                brick.MoveMotorAngleRel('AB', 15, 480);
                brick.WaitForMotor('A');
                brick.WaitForMotor('B');

                currTurn = currTurn + 1;
                if(currTurn == 420)
                    currTurn = 1;
                end
            else
                brick.MoveMotorAngleRel('B', 25, 133);
                brick.MoveMotorAngleRel('A', 25, 130);
                %brick.MoveMotorAngleRel('AB', 25, 180);
                brick.WaitForMotor('A');
                brick.WaitForMotor('B');
            end
            pause(0.15);
        end
end
CloseKeyboard();