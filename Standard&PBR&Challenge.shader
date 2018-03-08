Shader "Holistic/Standard&PBR&Chanllenge"
{
	Properties
	{
		_Color("Color",Color) = (1,1,1,1)
		_MetallicTex("MetallicTex", 2D) = "white"{}
		_Metallic("Metallic",Range(0,1)) = 0.5
		_Emissive("Emissive", Range(0,1)) = 0.5
	}

	SubShader
	{
		Tags{"Queue" = "Geometry"}
	

	CGPROGRAM
	#pragma surface surf Standard

	sampler2D _MetallicTex;

	fixed4 _Color;
	half _Metallic;
	half _Emissive;

	struct Input
	{
	float2 uv_MetallicTex;
	};

	void surf(Input IN, inout SurfaceOutputStandard o)
	{
		o.Albedo = _Color.rgb;
		o.Smoothness = tex2D(_MetallicTex, IN.uv_MetallicTex).r;
		o.Metallic = _Metallic;
		o.Emission =  tex2D(_MetallicTex, IN.uv_MetallicTex).r * _Emissive;
	}

	ENDCG
	}
	FallBack"Diffuse"
}