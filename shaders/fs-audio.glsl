uniform sampler2D t_audio;

varying vec4 vAudio;
varying float vAudioLookup;
varying vec3 vNormal;
void main(){

  // vec4 audio = texture2D( t_audio , vec2( vAudioLookup , 0. ) );

  // We are also going to color our fragments
  // based on the color of the audio
  // vec3 col = audio.xyz;
  vec4 col = vec4(0., vAudio.g, 0., 0.);
  gl_FragColor = vAudio;

}
