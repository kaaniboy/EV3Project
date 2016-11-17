NAME = 'Earth';
controlledByKeyboard = 0;

brick.beep();

global key
InitKeyboard();
pause(1);
brick.StopAllMotors();

STOP_COLOR = 2;
DROP_OFF_COLOR = 4;

while 1
    % Read keyboard input...
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
        case 'e'
            break;
    end

    % If we are controlling by keyboard...
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
        
%         if(brick.ColorColor(3) == DROP_OFF_COLOR)
%             brick.beep();
%             controlledByKeyboard = 1;
%         end
        
        if(brick.ColorColor(3) == STOP_COLOR)
            brick.beep();
            controlledByKeyboard = 1;
        end
        
        % Detect obstacles/openings
        if(leftPressed || rightPressed || (leftDist > 20 && leftDist < 255))
            % If I hit a wall
            if(leftPressed || rightPressed)
                % Move backwards
                brick.MoveMotorAngleRel('AB', 15, -300);
                brick.WaitForMotor('AB');
                % Turn right
                MoveRight(brick);

            % I see open space to the left
            elseif(leftDist > 20 && leftDist < 255)
                brick.MoveMotorAngleRel('AB', 15, 330);
                brick.WaitForMotor('AB');
                brick.StopMotor('AB');
                MoveLeft(brick);
                brick.StopMotor('AB');
                brick.MoveMotorAngleRel('AB', 15, 480);
                brick.WaitForMotor('AB');
            end
            brick.WaitForMotor('AB');
            brick.StopMotor('AB');
        % Move forward because nothing happened
        else
            brick.MoveMotorAngleRel('B', 25, 173);
            brick.MoveMotorAngleRel('A', 25, 170);
            brick.WaitForMotor('AB');
        end
        pause(0.1);
    end
end
CloseKeyboard();