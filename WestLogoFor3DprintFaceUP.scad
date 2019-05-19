
a =0;

f = 2.75;
//merge 3 cubes+ logo together
union(){
union(){
//the base (biggest cube) using minkowski to create rounded corners
minkowski(){
    //cube base
translate([-2,-2,a]) cube([9,8,0.01]);
    // cylinder
cylinder([1,1,0.01]);
}
//first cube
translate([2.5,1.27,1])cube([1,1,5.5]);
}
//last cube
translate([2.5,3.5,1])cube([1,0.5,8.65]);
}

// left triangle 
module tri_left(where){
translate([where,3,0]){
rotate([0,0,90]){
triangle(1,1,0.01,1);
mirror([1,0,0]) triangle(1,1,0.01,1);

}
}
}
//sub-surface
$fn = 30;
// bigger circle - smaller circle and move the centre -side cube
translate([0,0,f])
rotate ([60,0,0]){
difference(){
difference(){
    // merge left trianlge with the circle
    hull(){
   translate([3,3,0]) {cylinder(r=5,h=1);}
   tri_left(-2);
   }
   //merge inside left triangle with the circle
   hull(){
   translate([3,3,0]) {cylinder(r=4,h=1);}
   tri_left(-0.7);
   }
}

// side cube
translate([6.5,1.5,0]){cube([2.5,3,1]);}
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
    mirror([1,0,0])rotate([0,0,90]){ triangle(5,1.5,0.01,1);} 

}
// 2nd triangle (non-origin)
 translate([6,0,0])rotate([0,0,90]){ triangle(5,1.5,0.01,1);} 
}
//call bottom triangle
bottom_triangle();
}
top_triangle();
}
}

// top triangles
module top_triangle(){
 //right one
gen_for_top(4.25);

//left one
mirror([1,0,0])
gen_for_top(-1.75);
}

// function to generate top triangle
module gen_for_top(where){
 translate([where,5,0]) {
rotate([0,0,-90]){ triangle(1.2,0.2,0.01,1);}
mirror([1,0,0])rotate([0,0,-90]){ triangle(1.2,0.2,0.01,1);}
}
}

//bottom triangle
module bottom_triangle(){
translate([3,0,0]) {
rotate([0,0,90]){ triangle(2.5,0.5,0.01,1);}
mirror([1,0,0])rotate([0,0,90]){ triangle(2.5,0.5,0.01,1);}
}
}
 
//generate  triangle
module triangle(a1,b1,r1,h1){
 
 hull(){
     cylinder(r=r1,h=h1);
     translate([a1,0,0])cylinder(r=r1,h=h1);
      translate([0,b1,0])cylinder(r=r1,h=h1);
 }
 
   
}


