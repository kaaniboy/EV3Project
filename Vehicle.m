NAME = 'Earth';
controlledByKeyboard = 0;

brick.beep();

global key
InitKeyboard();
pause(1);
brick.StopAllMotors();
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
            leftDist = brick.UltrasonicDist(4);
            leftPressed = brick.TouchPressed(1);
            rightPressed = brick.TouchPressed(2);
            
            % Stop Signs
            if(DetectColor(brick, 'RED'))
                brick.beep();
                brick.beep();
                brick.beep();
                pause(4);
                brick.MoveMotorAngleRel('AB', 25, 180);
                brick.WaitForMotor('A');
                brick.WaitForMotor('B');
            end
            
            % If I hit a wall
            if(leftPressed || rightPressed)
                % Move backwards
                brick.MoveMotorAngleRel('AB', 15, -300);
                brick.WaitForMotor('AB');
                % Turn right
                MoveRight(brick);
            elseif(leftDist > 20 && leftDist < 255)
                
            end
            
            % If front is blocked
            elseif(leftPressed || rightPressed || leftDist > 20 || leftDist == 255)
                brick.StopAllMotors();
                brick.beep();
                if(leftPressed || rightPressed)
                    brick.MoveMotorAngleRel('AB', 15, -300);
                    brick.WaitForMotor('A');
                    brick.WaitForMotor('B');
                else
                    brick.MoveMotorAngleRel('AB', 15, 330); %300 previously.
                    brick.WaitForMotor('A');
                    brick.WaitForMotor('B');
                end
                brick.StopAllMotors();

                if(currTrip(currTurn) == 'L')
                    display('Turn left.');
                    MoveLeft(brick);
                end
                if(currTrip(currTurn) == 'R')
                    display('Turn right.');
                   MoveRight(brick); 
                end
                
                brick.StopAllMotors();

                brick.MoveMotorAngleRel('AB', 15, 480);
                brick.WaitForMotor('A');
                brick.WaitForMotor('B');

                currTurn = currTurn + 1;
                if(currTurn == currSize + 1)
                    display('Reached the end!');
                    brick.beep();
                    currTurn = 1;
                    currTrip = returnTrip;
                    currSize = returnSize;
                    
                    controlledByKeyboard = 1;
                end
            else
                brick.MoveMotorAngleRel('B', 25, 173);
                brick.MoveMotorAngleRel('A', 25, 170);
                %brick.MoveMotorAngleRel('AB', 25, 180);
                brick.WaitForMotor('A');
                brick.WaitForMotor('B');
            end
            pause(0.15);
        end
end
CloseKeyboard();