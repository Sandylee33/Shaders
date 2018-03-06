Shader "Holistic/Diffuse&Cutoff"
{
	Properties
	{
		_RimColor("Color", Color) = (0,0.5,0.5,0.0)
		_RimPower("Power", Range(0,5)) = 1
		_Diffuse("MainTex",2D) = "white"{}
		_Width("Width",Range(0,10)) = 5
	}

	SubShader
	{
		CGPROGRAM
		#pragma surface surf Lambert

		float4 _RimColor;
		float _RimPower;
		sampler2D _Diffuse;
		float _Width;

		struct Input
		{
		    float2 uv_Diffuse;
			float3 viewDir;
			float3 worldPos;
		};

		void surf(Input IN, inout SurfaceOutput o)
		{
			o.Albedo = tex2D(_Diffuse, IN.uv_Diffuse).rgb;
			half rim = 1-saturate(dot(normalize(IN.viewDir), o.Normal));
			o.Emission = frac(IN.worldPos.y * _Width) > 0.4 ? float3(1,0,0)*rim:float3(0,1,0)*rim;
		}

		ENDCG
	}

	FallBack"Diffuse"
}