


// Block https://www.lowes.com/pd/Tan-Charcoal-Retaining-Wall-Block-Common-6-in-x-16-in-Actual-6-in-x-16-in/1000461877?cm_mmc=shp-_-c-_-prd-_-lwn-_-ggl-_-CRP_SHP_LIA_LWN_Online_C-D-_-1000461877-_-local-_-0-_-0&gad_source=1&gclid=EAIaIQobChMI7MbQyemyhQMVMEB_AB1uZAKyEAQYBSABEgLPH_D_BwE&gclsrc=aw.ds

inch = 25.4;
ft = inch * 12;
bh = inch * 6;      // Height
bw = inch * 10;     // Width
bl = inch * 16;     // Length;
ch = inch * 2;
cw = bw + (1 * inch);
cl = bl + (1 * inch);
eh = 38;
ew = 70;
el = 70;

module electricalbox()
{
    cube([ew,el,ch+10]);

}

module anchorboltholes()
{
// https://www.lowes.com/pd/Hillman-1-2-in-x-8-in-Anchor-Bolt/4395613

    cylinder(r=(.6 * inch)/2,h= 8 * inch);    
}


module anchorbolt()
{
// https://www.lowes.com/pd/Hillman-1-2-in-x-8-in-Anchor-Bolt/4395613

    cylinder(r=(.5 * inch)/2,h= 8 * inch);
    rotate([0,90,0]) cylinder(r=(.5 * inch)/2,h= 2 * inch);
    
}
module rebar()
{
    cylinder(r=.5 * inch/2,h=2.5*ft); // Must cut a 4 foot rebar to 2.5 feet

}

module cover_base()
{
    translate([0 - (.5 * inch),0 - (.5 * inch),0]) cube([cw,cl,ch]); 

}

module cover()
{
    difference(){
       cover_base();
       translate([cw/2-(.5*ew)-(.5*inch),cl/2-(.5*el)-(.5 * inch),-1]) electricalbox();
       translate([5 * inch,5 * inch, -20]) anchorbolt();
       translate([5 * inch,bl - 4.5 * inch, -20 ]) anchorboltholes();
       
       }

}

module theblock()
{
    difference(){
      cube([bw,bl,bh]);
      translate([1 * inch, 1 * inch, -2]) cube([8*inch,6*inch,bh+10]);
      translate([1 * inch, bl - 7 * inch, -2])   cube([8*inch,6*inch,bh+10]);
      }

}

translate([0,0,0 - bh]) theblock(); // One block below ground - Ground is zero
translate([0,0,5]) theblock(); // Add a offset to show the block is stacking
translate([0,0,bh+10]) theblock(); // Add a offset to show the block is stacking
translate([0,0,2*bh+15]) theblock(); // Add a offset to show the block is stacking
translate([5 * inch,4 * inch, 0 - (1 * ft)]) rebar();
translate([5 * inch,bl - 3.5 * inch, 0 - (1 * ft)]) rebar();
translate([5 * inch,5 * inch, (bh * 3)- (5 * inch)]) anchorbolt();
translate([5 * inch,bl - 4.5 * inch, (bh * 3)- (5 * inch)]) anchorbolt();

translate([0,0,bh * 5]) cover();

