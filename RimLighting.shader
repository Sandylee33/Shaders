Shader "Holistic/Rimlighting"
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

		fixed4 _RimColor;
		float _RimPower;

		struct Input
		{
			float3 viewDir;
		};

		void surf(Input IN, inout SurfaceOutput o)
		{
			half rim = 1 - dot(normalize(IN.viewDir),o.Normal);
			o.Emission = _RimColor.rgb * pow(rim,_RimPower);
		}

		ENDCG
	}

	FallBack"Diffuse"
}