%Left Motor: A
%Right Motor: B
NAME = 'Lion';
brick = ConnectBrick('Lion');

while 1
    dist = brick.UltrasonicDist(1);
    if(dist >= 10)
        brick.MoveMotor('A', 50);
        brick.MoveMotor('B', 50);
        pause(0.4);
    else
        MoveRight(brick);
    end
end

DisconnectBrick(brick);