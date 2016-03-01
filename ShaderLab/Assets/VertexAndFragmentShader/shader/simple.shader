/*Shader "Custom/simple" {
	SubShader{
		Tags{ "RenderType" = "Opaque" }
		CGPROGRAM
		#pragma surface surf Lambert
		struct Input {
			float4 color : COLOR;
		};
		void surf(Input IN, inout SurfaceOutput o) {
			o.Albedo = 0.8;
		}
		ENDCG
	}
	Fallback "Diffuse"
}*/

Shader "Custom/Diffuse Texture" {
	Properties{
		_MainTex("Texture", 2D) = "white" {}
	}
	subshader{
		Tags{ "RenderType" = "Opaque"}
		CGPROGRAM
		#pragma surface surf Lambert
		struct Input {
			float2 uv_MainTex;
		};
		sampler2D _MainTex;
		void surf(Input IN, inout SurfaceOutput o) {
			o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
		}
		ENDCG
	}
	Fallback "Diffuse"
}