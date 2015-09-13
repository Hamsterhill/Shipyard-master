if collision_line(x,y,x-brakeDistance,y,o_truck,1,1) or x < brakeDistance+32
    {
    currentSpeed-=acceleration*2
    if currentSpeed<0 currentSpeed=0;
    }
else
    {
    currentSpeed+=acceleration
    if currentSpeed>maxSpeed currentSpeed=maxSpeed;
    }

x-=currentSpeed

