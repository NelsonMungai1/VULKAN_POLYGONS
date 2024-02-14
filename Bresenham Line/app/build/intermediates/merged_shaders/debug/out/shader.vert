#version 450

// Colour passed to the fragment shader
layout(location = 0) out vec3 fragColor;

// Uniform buffer containing an MVP matrix.
// Currently the vulkan backend only sets the rotation matix
// required to handle device rotation.
layout(binding = 0) uniform UniformBufferObject {
    mat4 MVP;
} ubo;

vec2 positions[9] = vec2[](
   vec2(-1.0,0.0),
   vec2(1.0,0.0),
   vec2(0.0,-1.0),
   vec2(0.0,1.0),
   vec2(0.3,0.4),
   vec2(0.4,0.5),
   vec2(0.5,0.6),
   vec2(0.6,0.7),
   vec2(0.7,0.8)
);


vec3 colors[9] = vec3[](
   vec3(0.0, 0.0, 0.0),
   vec3(0.0, 0.0, 0.0),
   vec3(0.0, 0.0, 0.0),
   vec3(0.0, 0.0, 0.0),
   vec3(0.0, 0.0, 1.0),
   vec3(0.0, 0.0, 1.0),
   vec3(0.0, 0.0, 1.0),
   vec3(0.0, 0.0, 1.0),
   vec3(0.0, 0.0, 1.0)

);


void main() {
    gl_Position = ubo.MVP * vec4(positions[gl_VertexIndex], 0.0, 1.0);
    fragColor = colors[gl_VertexIndex];
}