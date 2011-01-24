// ******************************
// Modeler LScript: Symm X Mirror
// Version: 1.0
// Author: Johan Steen
// Date: 16 Feb 2008
// Description: Deletes -x and auto mirrors from +x to -X to correct points for symmetry.
//              Deletes the left side of the geometry and mirrors 
//              the right side based on the technique of William 'Proton' Vaughan.
//              Available as PMirror.p plugin.
//              As PMirror.p isn't available for LW x64, I made this LScript version.
//
// http://www.artstorm.net
// ******************************

@version 2.4
@warnings
@script modeler
@name "Symm X Mirror"

// global values go here

main
{
    undogroupbegin();

    //
    // Check so symmetry is disabled. (Trick by Daniele Federico)
    // --------------------------------------------------------------------------------
    selmode(DIRECT);
    editbegin();
    pid1 = addpoint(100,0,0);
    pid2 = addpoint(-100,0,0);
    editend();

    selpoint(CLEAR);

    selpoint(SET, POINTID, pid1);
    selpoint(SET, POINTID, pid2);
    
    move(1,0,0);
    selpoint(CLEAR);

    editbegin();
    pointpos = pointinfo(pid2);

    symm = false;
    if (pointpos == <-101,0,0>)
        symm = true;

    rempoint(pid1);
    rempoint(pid2);
    editend();

    if (symm)
        error("Symmetry needs to be switched off.");


    //
    // Select all polygons on the negative X axis
    // --------------------------------------------------------------------------------
    selmode(USER);
    if(pointcount() == 0)
        error("There is no geometry in this layer.");

    // Select -X with bounding box
    selpolygon(CLEAR);
    bbox = boundingbox();
    selpolygon(SET, VOLINCL, bbox[1], <-0.0000001, bbox[2].y, bbox[2].z>);

    // Deselect polys mainly residing on +x.
    editbegin();

    deselect_array = nil;
    deselect_ctr = 0;
    // Loop through the selected polygons
//    info(polygons.count());
    steps = polygons.count();
    moninit(steps,"woohooo....");
    foreach(p, polygons)
    {
        monstep();
        pcount = polypointcount(p);
        ppoints = polyinfo(p);
        polysideweight = 0;
        // Loop through the polygons points
        for (i = 2; i < pcount+2; i++)
        {
            // Add together the points X positions
            polysideweight = polysideweight + ppoints[i].x;
        }
        // If the poly weights more towards +X then flag it for deselection
        if (polysideweight > 0) 
        {
            deselect_ctr++;
            deselect_array[deselect_ctr] = p;
        }
    }
    monend();
    editend();
    
    // Deselect the polys stored in the array
    for (i = 1; i < deselect_array.count()+1; i++)
    {
        selpolygon(CLEAR, POLYID, deselect_array[i]);
    } 


    //
    // Imitate a Set Value command in Modeler to zero selected polys on X
    // --------------------------------------------------------------------------------
    editbegin();
    foreach(p, points)
    {
        pointpos = pointinfo(p);
        pointpos.x = 0;
        pointmove(p, pointpos);
    }
    editend();


    //
    // Delete the selected polys
    // --------------------------------------------------------------------------------
    verifyselected = boundingbox();
    if(verifyselected[2].x == 0){
        delete();
    }

    //
    // Mirror +x to -x and merge the points
    // --------------------------------------------------------------------------------
    mirror(X,0);
    mergepoints();

    undogroupend();
}


