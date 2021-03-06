precision highp float;
attribute vec3 a_position;
attribute vec4 a_joint;
varying vec4 v_joint;
attribute vec4 a_weight;
varying vec4 v_weight;
uniform mat4 u_jointMat[60];
uniform mat4 u_modelViewMatrix;
uniform mat4 u_projectionMatrix;
attribute vec2 a_texcoord0;
varying vec2 v_texcoord0;
void main(void) {
mat4 skinMat = a_weight.x * u_jointMat[int(a_joint.x)];
skinMat += a_weight.y * u_jointMat[int(a_joint.y)];
skinMat += a_weight.z * u_jointMat[int(a_joint.z)];
skinMat += a_weight.w * u_jointMat[int(a_joint.w)];
vec4 pos = u_modelViewMatrix * skinMat * vec4(a_position,1.0);
v_texcoord0 = a_texcoord0;
gl_Position = u_projectionMatrix * pos;
}
