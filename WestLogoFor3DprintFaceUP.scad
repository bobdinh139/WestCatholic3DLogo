
a =0;
f = 2.75;
//minimize the edge of a cylinder in order to generate triangle
minimumEdge = 0.01;
//merge 5 cubes+ logo together
union(){
union(){
union(){
//the base (biggest cube) using minkowski to create rounded corners
translate([0,0,0.5])resize([9,6,0.5]){
minkowski(){
//cube base
translate([-0.35,-1,a]) cube([7,4,0.01]);
// cylinder to merge with the cube base -> generate rounded corners
cylinder([1,1,0.01]);
}}
//first cube 
translate([2,-1.25,1])cube([2,0.5,0.5]);
translate([2.5,1.27,1])cube([1,0.75,5.5]);

}
//support the C
translate([6.25,2,1])cube([1,0.7,6.65]);
//additional support on the left
translate([4.5,3,1])cube([1,0.7,8]);

// support the curve
translate([-1,2.25,1])cube([1,0.7,6.65]);
// additional support an the right
translate([0.5,3,1])cube([1,0.7,8]);
//last cube
translate([2.5,3.25,1])cube([1,0.5,8.5]);

}
//right cube
translate([1.75,0.01,1])cube([0.5,0.5,3]);

//left cube
translate([3.75,0.01,1])cube([0.5,0.5,3]);
//base support(bottom right C)
translate([5,-1,1])cube([0.6,0.6,1]);
//base support (bottom left C)
translate([0.5,-1,1])cube([0.6,0.6,1]);
}



// left triangle to merge with the bigger circle in order to create curves
module tri_left(where){
translate([where,3,0]){
rotate([0,0,90]){
triangle(1,1,minimumEdge,1);
mirror([1,0,0]) triangle(1,1,0.01,1);

}
}
}
//sub-surface
$fn = 30;
// bigger circle - smaller circle and move the centre -side cube
translate([0,0,f])
rotate ([60,0,0]){
    //  circles with curves - side cube = "C"
difference(){
    //substract two
difference(){
    // merge left trianlge with the circle
    hull(){
   translate([3,3,0]) {cylinder(r=5,h=1);}
   tri_left(-2);
   }
   //merge inside left triangle with the circle
   hull(){
   translate([3,3,0]) {cylinder(r=3.75,h=1);}
   tri_left(-0.55);
   }
}

// side cube to create the gap in "C"
translate([6,1.5,0]){cube([2.5,3,1]);}
}
}
//cube - triagle(origin) - triangle(non origin) - triangle(bottom) - triangle(top)
translate([0,0,f])
rotate([60,0,0]){
difference(){
difference(){
difference(){
difference(){
cube([6,5,1]);
  // rotate the right triangle 90 degree and mirror it
    mirror([1,0,0])rotate([0,0,90]){ triangle(5,1.5,minimumEdge,1);} 

}
// 2nd triangle (non-origin)
 translate([6,0,0])rotate([0,0,90]){ triangle(5,1.5,minimumEdge,1);} 
}
//call bottom triangle
bottom_triangle();
}
//for the top triangle
top_triangle();
}
}

// top triangles
module top_triangle(){
 //right one
gen_for_top(4.25);

//left one = the mirror of the right one with difference location
mirror([1,0,0])
gen_for_top(-1.75);
}

// function to generate top triangle
module gen_for_top(where){
    // move triangle around
 translate([where,5,0]) {
     // rotate the triangle -90 z 
rotate([0,0,-90]){ triangle(1.2,0.2,minimumEdge,1);}
//mirror the triangle
mirror([1,0,0])rotate([0,0,-90]){ triangle(1.2,0.2,minimumEdge,1);}
}
}

//bottom triangle
module bottom_triangle(){
translate([3,0,0]) {
    // rotate 90 degree z
rotate([0,0,90]){ triangle(2.5,0.5,minimumEdge,1);}
// mirror the triagle (the idea is that the bottom triangle is not right but it can be created by two right triangle)
mirror([1,0,0])rotate([0,0,90]){ triangle(2.5,0.5,minimumEdge,1);}
}
}
 
//generate right triangle
module triangle(a1,b1,r1,h1){
    // use hull o merge 3 cylinders 
 hull(){
     //create cylinder with radius r1 and height h1
     cylinder(r=r1,h=h1);
     // create the second triagle 
     translate([a1,0,0])cylinder(r=r1,h=h1);
      translate([0,b1,0])cylinder(r=r1,h=h1);
 }
 
   
}



