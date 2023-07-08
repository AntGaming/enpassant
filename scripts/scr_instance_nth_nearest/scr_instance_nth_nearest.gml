/// instance_nth_nearest(x,y,obj,num)
//
//  Returns the id of the nth nearest instance of an object
//  to a given point or noone if none is found.
//
//      x,y       point coordinates, real
//      obj       object index (or all), real
//      num         proximity, real
//
/// GMLscripts.com/license
function instance_nth_nearest(pointx,pointy,object,num)
{
    var list,nearest;
    num = min(max(1,num),instance_number(object));
    list = ds_priority_create();
    nearest = noone;
    with (object) ds_priority_add(list,id,distance_to_point(pointx,pointy));
    repeat (num) nearest = ds_priority_delete_min(list);
    ds_priority_destroy(list);
    return nearest;
}