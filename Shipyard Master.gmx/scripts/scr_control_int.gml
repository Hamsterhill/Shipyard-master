randomize()
//initialiseing veriables for roads.
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
    roads_y[i]= i*64+32
    
};

