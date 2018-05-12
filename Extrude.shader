Shader "Custom/Extrude" {
	Properties {
		_Color ("Color", Color) = (1,1,1,1)
		_MainTex ("Albedo (RGB)", 2D) = "white" {}
		_Glossiness ("Smoothness", Range(0,1)) = 0.5
		_Metallic ("Metallic", Range(0,1)) = 0.0
		_ExtrudeAmount("Extrude", Range(-1,1)) = 0
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		// Physically based Standard lighting model, and enable shadows on all light types
		#pragma surface surf Lambert vertex:vert addshadow
		// Use shader model 3.0 target, to get nicer looking lighting
		#pragma target 3.0


		sampler2D _MainTex;
		fixed _ExtrudeAmount;

		struct Input {
			float2 uv_MainTex;
		};

		struct appdata
		{
		  float4 vertex:POSITION;
		  float3 normal:NORMAL;
		  float4 texcoord:TEXCOORD0;
		  float4 texcoord1:TEXCOORD1;
		  float4 texcoord2:TEXCOORD2;
		};

		void vert (inout appdata v)
		{
		   v.vertex.xyz += v.normal * _ExtrudeAmount;
		}

		fixed4 _Color;
		 

		void surf (Input IN, inout SurfaceOutput o) {

			fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
			o.Albedo = c.rgb;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
