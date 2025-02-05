/////////////VISION CONE///////////////
//Vision cone code originally by Matt, Honkertron and Chaoko99. Chaoko99 for rewrites.
//This is a repurposed version of an earlier system. See PR#6 for the evolution of this.
//Credits to 'in_phaze/out-of-phaze' for substantial corrections and Carl for initial port work.
///////////////////////////////////////

#define HIDDEN_SHIT_PLANE	-101 //Used for the hiding of the vision cone masking object.
#define VISION_CONE_PLANE	7 // For the vision cone.
#define OPPOSITE_DIR(D) turn(D, 180)

/decl/modpack/fov_module
	name = "Screen Masking"

/obj/screen/fullscreen/vision_cone_target
	name = "vision cone master"
	plane = HIDDEN_SHIT_PLANE
	render_target = "vision_cone_target"

/obj/screen/fullscreen/vision_cone_blender
	render_target = "vision_cone_target"

//A series of vision related masters. They all have the same RT name to lower load on client.
/obj/screen/fullscreen/vision_cone/

/obj/screen/fullscreen/vision_cone/primary/Initialize() //For when you want things to not appear under the blind section.
	. = ..()
	filters += filter(type="alpha", render_source="vision_cone_target", flags=MASK_INVERSE)

/obj/screen/fullscreen/vision_cone/inverted //for things you want specifically to show up on the blind section.


/obj/screen/fullscreen/vision_cone/inverted/Initialize()
	. = ..()
	filters += filter(type="alpha", render_source="vision_cone_target")
