﻿Shader "Unlit/VFDiffuse"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
	}
	SubShader
	{
		Tags { "LightMode"="ForwardBase" }
		LOD 100

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			
			#include "UnityCG.cginc"
			#include "UnityLightingCommon.cginc"
			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
				float3 normal: NORMAL;
			};

			struct v2f
			{
				float2 uv : TEXCOORD0;
				float4 diff : COLOR0;
				float4 vertex : SV_POSITION;
			};

			sampler2D _MainTex;
			float4 _MainTex_ST;
			
			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = v.uv;
				half3 worldNormal = UnityObjectToWorldNormal(v.normal);
				half nl = max(0,dot(worldNormal,_WorldSpaceLightPos0.xyz));
				o.diff = nl * _LightColor0;
				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{
				// sample the texture
				fixed4 col = tex2D(_MainTex, i.uv);
			    col *=i.diff;
				return col;
			}
			ENDCG
		}
	}
}
