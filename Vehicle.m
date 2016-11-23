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
    pause(0.1);
    if(controlledByKeyboard == 0)
        switch key
            case 'c'
                controlledByKeyboard = 1;
                brick.beep();
                brick.StopMotor('AB');
                display('Beep C');
        end
    else
        switch key
            case 's'
                controlledByKeyboard = 0;
                brick.beep();
                display('Beep S');
            case 'g'
                GrabPerson(brick);
            case 'u'
                UngrabPerson(brick);
            case 'r'
                brick.MoveMotorAngleRel('D', 15, 100);
                brick.WaitForMotor('D');
                brick.StopMotor('D', 'Brake');
            case 'l'
                brick.MoveMotorAngleRel('D', 15, -100);
                brick.WaitForMotor('D');
                brick.StopMotor('D', 'Brake');
            case 'f'
                brick.MoveMotorAngleRel('D', 25, 150);
                brick.WaitForMotor('D');
                brick.StopMotor('D', 'Brake');
            case 'uparrow'
                brick.StopMotor('AB');
                brick.MoveMotorAngleRel('AB', 15, 90);
                brick.WaitForMotor('A');
                brick.WaitForMotor('B');
            case 'downarrow'
                brick.StopMotor('AB');
                brick.MoveMotorAngleRel('AB', 15, -90);
                brick.WaitForMotor('A');
                brick.WaitForMotor('B');
            case 'leftarrow'
                brick.StopMotor('AB');
                brick.MoveMotorAngleRel('A', 25, -45);
                brick.WaitForMotor('A');
            case 'rightarrow'
                brick.StopMotor('AB');
                brick.MoveMotorAngleRel('A', 25, 45);
                brick.WaitForMotor('A');
        end
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
            brick.StopMotor('AB');
            pause(2);
            brick.MoveMotorAngleRel('AB', 25, 180);
            brick.WaitForMotor('A');
            brick.WaitForMotor('B');
        end
        
%          if(brick.ColorColor(3) == DROP_OFF_COLOR)
%               brick.beep();
%               controlledByKeyboard = 1;
%          end
%         
%         if(brick.ColorColor(3) == STOP_COLOR)
%             brick.beep();
%             controlledByKeyboard = 1;
%         end
        
        % Detect obstacles/openings
        if(leftPressed || rightPressed || (leftDist > 20 && leftDist < 255))
            % If I hit a wall
            if(leftPressed || rightPressed)
                % Move backwards
                % 300
                brick.StopMotor('AB');
                brick.beep();
                brick.MoveMotorAngleRel('A', 15, -315);
                brick.MoveMotorAngleRel('B', 15, -300);
                brick.WaitForMotor('AB');
                % Turn right
                MoveRight(brick);

            % I see open space to the left
            elseif(leftDist > 20 && leftDist < 255)
                brick.StopMotor('AB');
                brick.beep();
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
            brick.MoveMotor('B', 30);
            brick.MoveMotor('A', 29);
%             brick.MoveMotorAngleRel('B', 25, 179);
%             brick.MoveMotorAngleRel('A', 25, 170);
        end
        pause(0.1);
    end
end
CloseKeyboard();