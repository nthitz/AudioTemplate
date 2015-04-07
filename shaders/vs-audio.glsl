uniform sampler2D t_audio;
uniform float time;

varying vec4 vAudio;

varying float vAudioLookup;

varying vec3 vNormal;
$simplex

//vec3 getPos( vec3 position
void main(){


  float displacement = snoise( position * 4. );

  //vAudioLookup =  abs( displacement ); //abs( normal.x * normal.y * normal.z * 3. );
  // vAudioLookup = abs( position.x * position.y * position.z * 3. );
  // Here we sample the audio from a texture that we will
  // be creating on the cpu
  vec4 audio = texture2D( t_audio , uv);

  vAudio = audio;

  vNormal = normal;

  // float magnitude = length(0.5 - abs(uv - 0.5) * 1.0);
  // magnitude = 1.0 -length(uv);
  float magnitude = 1.0;
  // To visualize the audio, we will displace the position
  // by a value based on the audio, along the normal
  vec3 pos = position + length( audio) * magnitude * normal;
  // vec3 pos = position+= audio.xyz;
  // Use this position to get the final position
  // gl_Position = projectionMatrix * modelViewMatrix * vec4( pos , 1.);
  gl_Position = projectionMatrix * modelViewMatrix * vec4( pos , 1.);

}
