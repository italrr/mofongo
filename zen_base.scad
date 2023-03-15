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
servo_holder_screw_length = 8;
servo_holder_screw_diameter = 3;
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
 translate([base_size_inner[0] / 2 + servo_center_offset, 0 + servo_holder_inner_dims[0] / 2, base_size_inner[2] + servo_holder_inner_dims[2] / 2 - 1]) difference(){
    cube(size = servo_holder_outter_dims, center = true);
    cube(size = servo_holder_inner_dims, center = true);
    
//    rotate([90, 0, 180])
//    translate([-servo_holder_outter_screw_offset/2 + 2, 0, 0])
//    color("red")
//    thread_for_screw(diameter=servo_holder_screw_diameter, length=servo_holder_screw_length * 2);
  
//    rotate([90, 0, 180])
//    translate([servo_holder_outter_screw_offset/2 - 2, 0, 0])
//    color("red")
//    thread_for_screw(diameter=servo_holder_screw_diameter, length=servo_holder_screw_length * 2);  
}


/*
    Base
*/
//cube(size = [base_size_inner[0], base_size_inner[1], base_size_inner[2]], center = false);
translate([-base_size_diff[0] / 2, -base_size_diff[1] / 2 , 0])
difference(){
    // Entire surface
    cube(size = [base_size_outter[0], base_size_outter[1], base_size_inner[2]], center = false);
    // Negative
    // Left rail path
    translate([base_size_outter[0] / 2 - rail_path_ln / 2, rail_path_width + 0 + servo_holder_inner_dims[0] + rail_path_width / 2 + rail_path_width + servo_holder_left_gear_offset, 3])
    color("blue")
    cube([rail_path_ln, rail_path_width, base_size_inner[2] / 2]);    
    // Screws 
//    translate([base_size_neg_diff[0] / 4 , base_size_neg_diff[1] / 4  , base_size_inner[2] - 1])
//    color("purple")
//    thread_for_screw(diameter=2.7, length=2);  
//  
//    translate([base_size_outter[0] - base_size_neg_diff[0] / 4, base_size_neg_diff[1] / 4  , base_size_inner[2] - 1])
//    color("purple")
//    thread_for_screw(diameter=2.7, length=2);    
//
//    translate([base_size_outter[0] - base_size_neg_diff[0] / 4, base_size_outter[1] - base_size_neg_diff[1] / 4  , base_size_inner[2] - 1])
//    color("purple")
//    thread_for_screw(diameter=2.7, length=2);  
// 
//     translate([base_size_neg_diff[0] / 4 , base_size_outter[1] - base_size_neg_diff[1] / 4  , base_size_inner[2] - 1])
//     color("purple")
//     thread_for_screw(diameter=2.7, length=2);   
}



arm_support_rest_start = 10;
arm_support_rest_height = 4;

arm_support_inner_path_width = 5;

/*
    Arm support
*/
translate([base_size_inner[0] / 2 - rail_path_ln / 2, base_size_inner[1] - rail_path_width, base_size_inner[2]]) difference(){
    // Body
    color("red")
    cube([rail_path_ln , rail_path_width, base_size_height / 2]);
    translate([rail_path_ln / 2 - arm_support_inner_ln / 2, -arm_support_inner_offset/2, arm_support_rest_start])
    // Inner space
    color("yellow")
    cube([arm_support_inner_ln , arm_support_inner_width, arm_support_rest_height]);   
    // Path
    color("white")
    translate([rail_path_ln / 2 - arm_support_inner_ln / 2, -arm_support_inner_offset/2 + arm_support_inner_width/2 - arm_support_inner_path_width/2, arm_support_rest_start - 2])
    cube([arm_support_inner_ln , arm_support_inner_path_width, arm_support_rest_height]);   
}

/*
    X Rail
*/
yrail_length =  (base_size_inner[1] - rail_path_width)
                - (rail_path_width + 0 + servo_holder_inner_dims[0] + rail_path_width / 2 + rail_path_width + servo_holder_left_gear_offset)
                + arm_support_inner_width + rail_path_width;
yrail_height = arm_support_rest_height - 1; 
yrail_width = 10;

translate([
                base_size_outter[0] / 2 - rail_path_ln / 2,
                rail_path_width + 0 + servo_holder_inner_dims[0] + rail_path_width / 2 + rail_path_width + servo_holder_left_gear_offset - rail_path_width,
                base_size_inner[2] + arm_support_rest_start])
color("green")
cube(size = [yrail_width, yrail_length, yrail_height]);


