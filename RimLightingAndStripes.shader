﻿Shader "Holistic/Rimlighting&stripes"
{
	Properties
	{
		_RimColor("Color", Color) = (0,0.5,0.5,0.0)
		_RimPower("Power", Range(0,5)) = 1
	}

	SubShader
	{
		CGPROGRAM
		#pragma surface surf Lambert

		float4 _RimColor;
		float _RimPower;

		struct Input
		{
			float3 viewDir;
			float3 worldPos;
		};

		void surf(Input IN, inout SurfaceOutput o)
		{
			half rim = 1-saturate(dot(normalize(IN.viewDir), o.Normal));
			o.Emission = frac(IN.worldPos.y * 5)>0.4 ? float3(1,0,0)*rim:float3(0,1,0)*rim;
		}

		ENDCG
	}

	FallBack"Diffuse"
}