Shader "Holistic/VisualizeNormals"
{
	Properties
	{

	}

	SubShader
	{
	   CGPROGRAM
	   #pragma surface surf Lambert


	   struct Input
	   {
	     float2 uv_MainTex;
	     fixed3 worldRefl;
	   };

	   void surf(Input IN, inout SurfaceOutput o)
	   {
	   		o.Albedo = IN.worldRefl;
	   		//o.Albedo = o.Normal;
	   }
	   ENDCG
	}
	FallBack "Diffuse"
}