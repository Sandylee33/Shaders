Shader "Holistic/BumpEnvironment" 
{
  	Properties
  	{
  		_Cube("CubeMap", CUBE) = "white"{}
  		_NormalMap("NormalMap",2D) = "bump"{}
  	}

  	SubShader
  	{
  		CGPROGRAM
  		#pragma surface surf Lambert

  		sampler2D _NormalMap;
  		samplerCUBE _Cube;

  		struct Input
  		{
  		   float2 uv_NormalMap;
  		   float3 worldRefl; INTERNAL_DATA
  		};

  		void surf(Input IN, inout SurfaceOutput o)
  		{
  		    o.Normal = UnpackNormal(tex2D(_NormalMap, IN.uv_NormalMap))*0.3;
  		    o.Albedo = texCUBE(_Cube, WorldReflectionVector(IN, o.Normal)).rgb;
  		}


  		ENDCG
  	}
  	FallBack "Diffuse"
}