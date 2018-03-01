Shader "Holistic/Practice_2"
{
   Properties
   {
      _myTexture("Example Texture", 2D) = "white"{}
   }

   SubShader
   {
      CGPROGRAM
      #pragma surface surf Lambert

      sampler2D _myTexture;


      struct Input
      {
          float2 uv_MainTex;
      };

     void surf (Input IN, inout SurfaceOutput o)
      {
        float4 _green = float4(0,1,0,1);
         o.Albedo = (tex2D(_myTexture, IN.uv_MainTex) * _green).rgb;
        // o.Albedo.g = 1;
      }


      ENDCG

   }

   FallBack "Diffuse"

}