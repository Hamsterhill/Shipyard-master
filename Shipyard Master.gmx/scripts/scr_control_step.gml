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
var k=0,containerLengthCount=0,containers=0;
do{
    ////get container sizes
    containerSize[k] = ceil(random((newTruckLength-containerLengthCount) - .5)+.25) //chooses length of containers (weighted 25% towards 2 long containers)
    containerLengthCount += containerSize[k];
    ////get container colours
    var colGrid=ds_grid_create(2,colours); //create a grid (2d array you can do functions with)
    for (ii=0; ii<colours; ii+=1) //fill the array with the colours and how much they are needed
    {   
        ds_grid_set(colGrid,0,ii,ii) //colour in column 0 (number from 0-number of colours)
        ds_grid_set(colGrid,1,ii,colourSpaceCount[ii]-colourContainerCount[ii]) // that colours unfilled slots
    };
    ds_grid_sort(colGrid,1,false) //sort so that the larger number of empty slots is at the top
    for (ii=0; ii<colours; ii+=1) // replace the number of open slots with the colours "assistance value" (higher the better)
    {
        if ii<coloursAssistSpread {
        ds_grid_set(colGrid,1,ii,1+coloursAssist/(ii+1))
        } else
        ds_grid_set(colGrid,1,ii,1)
    };
    ds_grid_sort(colGrid,0,true) //sort grid by colour (0->9)
    ds_grid_set(colGrid,1,newTruckColour,0) //set the chance to get the colour of the truck bed to 0
    var colMax = ds_grid_get_sum(colGrid,1,0,1,ds_grid_height(colGrid)-1); //colMax = sum of all "assistance values"
    var colRand = random(1) // a random number from 0-1
    for (ii=0; ii<colours; ii+=1) // tests each colour against the random number
    {
        if colRand< ds_grid_get(colGrid,1,ii)/colMax {
        containerColour[k]=ii
        ii = colours}else
        {
        colRand -= ds_grid_get(colGrid,1,ii)/colMax // takes off the "assistance value"%  off the rand and then tests the next number (easier then <> comparasons)
        }
    };
    
    ds_grid_destroy(colGrid)
    k+=1
    containers+=1
}until(containerLengthCount>=newTruckLength)
    
    
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
            colourContainerCount[containerColour[k]]+= containerSize[k]
        };
        colourSpaceCount[newTruckColour] += newTruckLength // add to global container space counter
        roads_trucks[lane]+=1 // add to lane tracker
        trucksSpawnTimer+=trucksSpawnDelayMin+ceil(random(trucksSpawnDelayVer)) //reset timer until next truck spawn.
        
        }
    }
    
    
//For testing purposes
if mouse_check_button_released(mb_left) trucksSpawnTimer=0




