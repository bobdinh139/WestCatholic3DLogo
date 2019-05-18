

// left triangle 
module tri_left(where){
translate([where,3,0]){
rotate([0,0,90]){
triangle(1,1,0.01,1);
mirror([1,0,0]) triangle(1,1,0.01,1);

}
}
}


$fn = 30;
// bigger circle - smaller circle and move the centre -side cube

difference(){
 
    

difference(){
    // merge left triangle with the circle
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

//cube - triangle(origin) - triangle(non origin) - triangle(bottom) - triangle(top)
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


