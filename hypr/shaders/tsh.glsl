precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

const float VIB_VIBRANCE = 1.6;   // Saturation boost
const float CONTRAST = 1.05;        // Contrast boost (1.0 = no change)
const float GAMMA = 0.95;          // <1 = darker, >1 = brighter midtones
const float BLACK_LIFT = -0.04;    // Raise or lower blacks

void main() {
    vec4 color = texture2D(tex, v_texcoord);

    // Saturation
    float avg = (color.r + color.g + color.b) / 3.0;
    color.rgb = mix(vec3(avg), color.rgb, VIB_VIBRANCE);

    // Contrast
    color.rgb = (color.rgb - 0.5) * CONTRAST + 0.5;

    // Black level adjustment
    color.rgb += vec3(BLACK_LIFT);

    // Gamma correction
    color.rgb = pow(color.rgb, vec3(GAMMA));

    gl_FragColor = color;
}

