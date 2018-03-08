Shader "Holistic/BlinnPhong"
{
	Properties
	{
	  _MainColor("MainColor", Color) = (0.5,0.5,0.5,0.5)
	  _SpecColor("Specular Color", Color) = (1,1,1,1)
	  _Gloss("Gloss", Range(0,1)) = 0.5
	  _Spec("Specular", Range(0,1)) = 0.5
	}

	SubShader
	{
	   Tags{"Queue" = "Geometry"}

	   CGPROGRAM
	   #pragma surface surf BlinnPhong
	   float4 _MainColor;
	   half _Spec;
	   fixed _Gloss;

	   struct Input
	   {
	   float2 uv_MainTex;
	   };

	   void surf (Input IN, inout SurfaceOutput o)
	   {
	   		o.Albedo = _MainColor.rgb;
	   		o.Gloss = _Gloss;
	   		o.Specular = _Spec;
	   }


	   ENDCG
	}
}