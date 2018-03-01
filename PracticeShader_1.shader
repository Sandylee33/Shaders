Shader "Holistic/Practice_1"
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
          float2 uv_myTexture;
      };

     void surf (Input IN, inout SurfaceOutput o)
      {
         o.Albedo.rb = tex2D(_myTexture, IN.uv_myTexture).rb;
         o.Albedo.g = 1;
      }


      ENDCG

   }

   FallBack "Diffuse"

}