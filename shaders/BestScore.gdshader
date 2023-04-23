shader_type canvas_item;

uniform float size = 1;
uniform float speed = 1;

void fragment() {
	if (COLOR == vec4(1, 1, 1, 1)) {
		float red_value = sin(UV.x * size + TIME * speed + UV.y * .05);
		red_value = clamp(red_value, 0.4, 0.75);
		COLOR = vec4(1, 0, 0, 1);
		COLOR.g = red_value;
		COLOR.b = red_value * 0.3;
	}
}