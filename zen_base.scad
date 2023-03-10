//use <screw_holes.scad>
use <threads_lib.scad>
include <timing_belts.scad>

//$quality = 100;

base_size_inner = [180, 220, 4];
base_size_neg = [base_size_inner[0] + 10, base_size_inner[1] + 10, base_size_inner[2]];
base_size_outter = [base_size_inner[0] + 20, base_size_inner[1] + 20, base_size_inner[2]];
base_size_height = 45;
base_size_diff = [base_size_outter[0] - base_size_inner[0], base_size_outter[1] - base_size_inner[1], base_size_outter[2] - base_size_inner[2]];
base_size_neg_diff = [base_size_outter[0] - base_size_neg[0], base_size_outter[1] - base_size_neg[1], base_size_outter[2] - base_size_neg[2]];

servo_holder_outter_dims = [36, 24, 14];
servo_holder_inner_dims = [23, 30, 15];
servo_holder_outter_screw_offset = 33;
servo_center_offset = 5;

rail_path_width = 10;
servo_holder_left_offset = 15;
servo_holder_left_gear_offset = 5;
rail_path_ln = base_size_inner[0];

arm_support_inner_ln = rail_path_ln * 0.95;
arm_support_inner_offset = 2;
arm_support_inner_width = rail_path_width + arm_support_inner_offset;

/*
    Servo Holders
*/
// Servo holder left
 translate([base_size_inner[0] / 2 + servo_center_offset, 0 + servo_holder_inner_dims[0] / 2, base_size_inner[2] + servo_holder_inner_dims[2]/2]) difference(){
    cube(size = servo_holder_outter_dims, center = true);
    cube(size = servo_holder_inner_dims, center = true);
    //rotate([270, 0, 0]) translate([servo_holder_outter_screw_offset/2 - 2, 0, 0]) screw_hole(DIN965, M2, 15, 6.8);
    //rotate([270, 0, 0]) translate([-servo_holder_outter_screw_offset/2 + 2, 0, 0]) screw_hole(DIN965, M2, 15, 6.8);
}
//// Servo holder bottom
//translate([base_size_inner[0] - servo_holder_inner_dims[0] / 2, base_size_inner[1] / 2, base_size_inner[2] + servo_holder_inner_dims[2] / 2]) rotate([0,0,90])  difference(){
//    cube(size = servo_holder_outter_dims, center = true);
//    cube(size = servo_holder_inner_dims, center = true);
//    rotate([270, 0, 0]) translate([servo_holder_outter_screw_offset/2 - 2, 0, 0]) screw_hole(DIN965, M2, 15, 6.8);
//    rotate([270, 0, 0]) translate([-servo_holder_outter_screw_offset/2 + 2, 0, 0]) screw_hole(DIN965, M2, 15, 6.8);
//}


/*
    Base
*/
//cube(size = [base_size_inner[0], base_size_inner[1], base_size_inner[2]], center = false);
translate([-base_size_diff[0] / 2, -base_size_diff[1] / 2 , 0])
difference(){
    // Entire surface
    cube(size = [base_size_outter[0], base_size_outter[1], base_size_height], center = false);
    // Negative
    translate([base_size_neg_diff[0] / 2, base_size_neg_diff[1] / 2, base_size_inner[2]])
    cube(size = [base_size_neg[0], base_size_neg[1], base_size_height], center = false);
    // Left rail path
    translate([base_size_outter[0] / 2 - rail_path_ln / 2, rail_path_width + 0 + servo_holder_inner_dims[0] + rail_path_width / 2 + rail_path_width + servo_holder_left_gear_offset, 3])
    color("blue")
    cube([rail_path_ln, rail_path_width, base_size_inner[2] / 2]);    
    // Screws 
    translate([base_size_inner[0] / 2, base_size_inner[1]/ 2, 4])
    color("purple")
    cylinder([8, 8, 50]);
    //thread_for_screw(diameter=3, length=10);
 
    
}



//    

    
/*
    Arm support
*/
translate([base_size_inner[0] / 2 - rail_path_ln / 2, base_size_inner[1] - rail_path_width, base_size_inner[2]]) difference(){
    color("red")
    cube([rail_path_ln , rail_path_width, base_size_height / 2]);
    translate([rail_path_ln / 2 - arm_support_inner_ln / 2, -arm_support_inner_offset/2, base_size_height / 8])
    color("yellow")
    cube([arm_support_inner_ln , arm_support_inner_width, base_size_height / 4]);    
}



