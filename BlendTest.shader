Shader "Holistic/BlendTest" {
	Properties {
		
		_MainTex ("Texture", 2D) = "black" {}
	
	}
	SubShader {
		Tags { "RenderType"="Transparent" }
		Blend One One
		Pass{
		SetTexture[_MainTex]{combine texture}
		}
		

	}
	FallBack "Diffuse"
}
