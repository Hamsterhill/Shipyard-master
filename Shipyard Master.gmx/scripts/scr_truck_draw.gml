draw_sprite_ext(spr_truck_stationary,image_index,x,y,1,1,0,global.colours[colour],1)//draw truck coloured
draw_sprite_ext(spr_truckOverlay_stationary,image_index,x,y,1,1,0,c_white,1) // draw overlay (so the windows dont get coloured)
var j=0;
for (i=0; i<containers; i+=1)//draw all the creates 
{
    draw_sprite_ext(spr_container,containerSize[i]-1,x+j*16,y,1,1,0,global.colours[containerColour[i]],1)
    j+=containerSize[i];
};

draw_text(x,y+16,"Len: " + string(image_index+1))
draw_text(x,y+16*2,"Col: " + string(colour))
draw_text(x,y+16*3,"Con's: " + string(containers))
for (i=0; i<containers; i+=1)
{
    draw_text(x,y+16*(4 + i*2),"Col " + string(i+1) + ": " + string(containerColour[i]))
    draw_text(x,y+16*(5 + i*2),"len " + string(i+1) + ": " + string(containerSize[i]))
};




///for testing
//draw_text(x,y-16,"S" + string( image_index) + " C" + string( colour))
