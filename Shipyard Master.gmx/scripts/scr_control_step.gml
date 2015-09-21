// manageing trucks
trucks = instance_number(o_truck)
if trucksSpawnTimer > 0 trucksSpawnTimer-=1 else
if trucks < maxTrucks// If were not over our limit of trucks
    {
    var newTruckLength, newTruckColour, lane, newTruckContainers,k;
    newTruckLength = choose(1,2,2,2,2,2,2,2,2,2,3,3,3) //decide the size of the new truck to be spawned
    newTruckColour = floor(random(colours)) //chooses truck colour
    lane= floor(random(roads)) // select the road the new truck will be spawned
//choosing size and colour of containers for truck
k=0
do{
    //get container sizes
    containerSize[k] = ceil(random(newTruckLength - .5)+.25) //chooses length of containers (weighted 25% towards 2 long containers)
    //get container colours
    var totalColours=0;
    for (i=0; i<CONDITION; i+=1){totalColours += colourContainerCount[i]}; //count up all the colours adding veriance for each
    
    
    
    
    
    
    /* OLD NOT WORKING
    var j, coloursTotal=0; //int temporary veriables j=random number used in calcs,coloursTotal=total number of all colours.
    for (i=0; i<colours; i+=1){ coloursTotal += colourSpaceCount[i] }; //find out the total number of "create length" there is. 
    coloursTotal += colourAssist * colours - colours // add veriance
    j = random(coloursTotal) //find random number to select colour from.
    if j < colourSpaceCount[0]-1+colourAssist then {containerColour[k] = 0} else
    {
        for (i=0; i<colours-1; i+=1)
        {
            if j < colourSpaceCount[i]-1+colourAssist containerColour[k] = 0
        };
    }*/
    k+=1
}until()

    
    
    
    if (roads_trucks[lane] + 1) <= roads_maxTrucks
        {
        //if selected road can fit a new truck
        var i;
        i=instance_create(roads_x[lane],roads_y[lane]/2,o_truck) //spawn truck
        i.image_speed=0 //stop sprite flickering
        i.image_index= newTruckLength //set sprite by truck length
        i.colour = newTruckColour //set colour of trucks bed
        i.containers=containers //set number of containers truck will have
        for (k=0; k<containers; k+=1) //pass on container info calculated above
        {
            i.containerSize[k] = containerSize[k] //length of each container
            i.containerColour[k] = containerColour[k] //colour of each container
        };
        colourSpaceCount[newTruckColour] += newTruckLength // add to global container space counter
        roads_trucks[lane]+=1 // add to lane tracker
        trucksSpawnTimer+=trucksSpawnDelayMin+ceil(random(trucksSpawnDelayVer)) //reset timer until next truck spawn.
        
        }
    }
    
    
//For testing purposes
if mouse_check_button_released(mb_left) trucksSpawnTimer=0




