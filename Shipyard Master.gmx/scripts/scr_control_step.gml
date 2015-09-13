// manageing trucks
trucks = instance_number(o_truck)
if trucksSpawnTimer > 0 trucksSpawnTimer-=1 else
if trucks < maxTrucks// If were not over our limit of trucks
    {
    var newTruckLength, lane;
    newTruckLength = choose(1,2,2,2,2,2,2,2,2,2,3,3,3) //decide the size of the new truck to be spawned
    lane= floor(random(roads)) // select the road the new truck will be spawned
    
    if (roads_trucks[lane] + 1) <= roads_maxTrucks
        {
        //if selected road can fit a new truck
        var i;
        i=instance_create(roads_x[lane],roads_y[lane]/2,o_truck)
        i.image_speed=0
        i.image_index= newTruckLength
        i.colour = choose(CL_red,CL_blue,CL_yellow)
        roads_trucks[lane]+=1
        trucksSpawnTimer+=trucksSpawnDelayMin+ceil(random(trucksSpawnDelayVer))
        
        }
    }
    
    
//For testing purposes
if mouse_check_button_released(mb_left) trucksSpawnTimer=0
