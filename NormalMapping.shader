Shader "Holistic/NormalMap"
{
    Properties
    {
       _MainTex("MainTex",2D) = "white"{}
       _NormalTex("NorTex",2D) = "bump"{}
       _BumpSlider("Bump Slider",Range(0,10)) = 1
       _BrightSlider("Brightness Slider",Range(0,10)) =1
    }


    SubShader
    {
      	CGPROGRAM

      	#pragma surface surf Lambert

      	sampler2D _MainTex;
      	sampler2D _NormalTex;
      	half _BumpSlider;
      	half _BrightSlider;

      	struct Input
      	{
      	   float2 uv_MainTex;
      	   float2 uv_NormalTex;
      	};


      	void surf(Input IN, inout SurfaceOutput o)
      	{
      		o.Albedo = tex2D(_MainTex,IN.uv_MainTex).rgb *_BrightSlider;
      		o.Normal = UnpackNormal(tex2D(_NormalTex,IN.uv_NormalTex));
      		o.Normal *= float3(_BumpSlider, _BumpSlider, 1);
      		//o.Albedo *= _BrightSlider;
      	}

      	ENDCG
    }

    FallBack "Diffuse"
}