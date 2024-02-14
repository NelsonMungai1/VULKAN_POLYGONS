#version 450

// Colour passed to the fragment shader
layout(location = 0) out vec3 fragColor;

// Uniform buffer containing an MVP matrix.
// Currently the vulkan backend only sets the rotation matix
// required to handle device rotation.
layout(binding = 0) uniform UniformBufferObject {
    mat4 MVP;
} ubo;

vec2 positions[12] = vec2[](
        vec2(0.2,0.0),//top left corner
        vec2(0.8,0.0),//top right corner
        vec2(1.0,0.4),//right most middle vertex
        vec2(1.0,0.4),//right most middle vertex
        vec2(0.3,0.8),//bottom left vertex
        vec2(0.7,0.8),//bottom right vertex
        vec2(0.7,0.8),//bottom right vertex
        vec2(0.0,0.4),//left middle vertex
        vec2(0.2,0.0),//top left corner
        vec2(1.0,0.4),//right most middle vertex
        vec2(0.7,0.8),//bottom right vertex
);

vec3 colors[12] = vec3[](
    vec3(0.67, 0.1, 0.2),
    vec3(0.67, 0.1, 0.2),
    vec3(0.67, 0.1, 0.2),
    vec3(0.67, 0.1, 0.2),
    vec3(0.67, 0.1, 0.2),
    vec3(0.67, 0.1, 0.2),
    vec3(0.67, 0.1, 0.2),
    vec3(0.67, 0.1, 0.2),
    vec3(0.67, 0.1, 0.2),
    vec3(0.67, 0.1, 0.2),
    vec3(0.67, 0.1, 0.2),
    vec3(0.67, 0.1, 0.2)
);

void main() {
    gl_Position = ubo.MVP * vec4(positions[gl_VertexIndex], 0.0, 1.0);
    fragColor = colors[gl_VertexIndex];
}