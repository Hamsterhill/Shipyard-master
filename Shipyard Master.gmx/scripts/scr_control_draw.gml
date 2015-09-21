

//debug stuff
if debug_mode=1
for (i=0; i<colours; i+=1)
{
    draw_set_color(c_fuchsia)
    draw_text(32,room_height-32-i*16,"Colour "+ string(i) + ": " +  string(colourSpaceCount[i]))
};
draw_set_color(c_black)

