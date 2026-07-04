shader_type canvas_item;

uniform sampler2D image : source_color;
uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 text = texture(image, UV);
	vec4 text2 = texture(screen_texture, UV);
	COLOR = text2 * text;
	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
