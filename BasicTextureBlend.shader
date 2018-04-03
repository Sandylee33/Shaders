Shader "Holistic/BasicTextureBlend" {
	Properties {
		
		_MainTex ("MainTexture", 2D) = "white" {}
		_DecalTex("Decal",2D) = "white"{}
	}
	SubShader {
		Tags{"Queue" = "Geometry"}
		
		CGPROGRAM
	
		#pragma surface surf Lambert 

	

		sampler2D _MainTex;
		sampler2D _DecalTex;
		struct Input {
			float2 uv_MainTex;
		};




		void surf (Input IN, inout SurfaceOutput o) {
			fixed4 mainTexture = tex2D(_MainTex, IN.uv_MainTex);
			fixed4 decal = tex2D(_DecalTex, IN.uv_MainTex);
			o.Albedo =  decal.r > 0.5?  decal.rgb :  mainTexture.rgb;
			//o.Albedo =   decal.rgb +  mainTexture.rgb;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
