randomize()

////int level variables////
colours=3   //Number of colours in level
coloursAssist=1 // extra assistance the "most needed" colour gets. each number adds 1 extra chance (1=2x as likely as another other colour)0=no assist
coloursAssistSpread=1 // number of colours that will get assistance (lowest gets full assist, the next gets half, then a third etc.)0=only the lowest gets assist.
for (i=0; i<colours; i+=1) //set colour counter to 0
{
    colourSpaceCount[i]=0 // number of spaces (in length) for each colour
    colourContainerCount[i]=0 //number of containers (in length not number) for each colour
};
////int veriables for roads.////
roads=3 //number of roads currently unlocked
trucksSpawnDelayMin=60*10 // Min delay between spawning new trucks to deal with
trucksSpawnDelayVer=60*5 // the max veriance in spawning time for trucks (added to the min)
trucksSpawnTimer=0 //Variable to track when to spawn next truck 0=spawn now
maxTrucks=20 //maximum trucks total
roads_maxTrucks=10 //max number of trucks per road
trucks=0 // number of trucks currently on stage
maxTruckLength=3
for (i=0; i<roads; i+=1)
{
    roads_trucks[i]=0 //number of trucks in each lane
    roads_x[i]= room_width
    roads_y[i]= i*((room_height)/roads+32*4)+124
    
};

//int Global colours
global.colours[0]=c_red
global.colours[1]=c_aqua
global.colours[2]=c_yellow
global.colours[3]=c_lime
global.colours[4]=c_purple
global.colours[5]=c_orange
global.colours[6]=c_white
global.colours[7]=c_dkgray
global.colours[8]=c_fuchsia
global.colours[9]=c_navy
global.colours[10]=c_olive

