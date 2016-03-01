// Shader "Example/Diffuse Simple" {
//    SubShader {
//      Tags { "RenderType" = "Opaque" }
//      CGPROGRAM
//      #pragma surface surf Lambert
//      struct Input {
//      	//float4 color : COLOR;
//          float3 worldPos;
//      };
//      void surf (Input IN, inout SurfaceOutput o) {
//          o.Albedo = 1;
//      }
//      ENDCG
//    }
//    Fallback "Diffuse"
//  }

//shader "diffuse texture"{
//	properties{
//		_MainTex ("Main Texture", 2d) = "white"{}
//	}
//	subshader{
//		tags{"RenderType" = "Opaque"}
//		CGPROGRAM
//		#pragma surface surf Lambert
//		struct Input{
//			float2 uv_MainTex;
//		};
//		sampler2D _MainTex;
//		void surf (Input IN, inout SurfaceOutput o){
//			o.Albedo = tex2D (_MainTex, IN.uv_MainTex).rgb;
//		}
//		ENDCG
//	}
//}

//shader "diffuse bump"{
//	properties{
//		_MainTex ("Main Texture", 2d) = "white"{}
//		_BumpMap ("Bump Map", 2d) = "bump"{}
//	}
//	subshader{
//		tags{ "RenderType" = "Opaque"}
//		CGPROGRAM
//		#pragma surface surf Lambert
//		struct Input{
//			float2 uv_MainTex;
//			float2 uv_BumpMap;
//		};
//		sampler2D _MainTex;
//		sampler2D _BumpMap;
//		void surf(Input IN, inout SurfaceOutput o){
//			o.Albedo = tex2D (_MainTex, IN.uv_MainTex).rgb;
//			o.Normal = UnpackNormal( tex2D(_BumpMap, IN.uv_BumpMap) );
//		}
//		ENDCG
//	}
//}

//shader "Rim"{
//	properties{
//		_MainTex ("Main Texture", 2d) = "white"{}
//		_BumpMap ("Bump Map", 2d) = "bump"{}
//		_RimColor ("Rim Color", color) = (1,1,1,1)
//		_RimPower ("Rim Power", range(0.5, 8.0)) = 3.0
//	}
//	subshader{
//		tags {"RenderType" = "Opaque"}
//		CGPROGRAM
//		#pragma surface surf Lambert
//		struct Input{
//			float2 uv_MainTex;
//			float2 uv_BumpMap;
//			float3 viewDir;
//		};
//		sampler2D _MainTex;
//		sampler2D _BumpMap;
//		float4 _RimColor;
//		float _RimPower;
//		void surf(Input IN, inout SurfaceOutput o){
//			o.Albedo = tex2D (_MainTex, IN.uv_MainTex).rgb;
//			o.Normal = UnpackNormal( tex2D(_BumpMap, IN.uv_BumpMap) );
//			half rim = 1.0 - saturate(dot (normalize(IN.viewDir), o.Normal));
//			o.Emission = _RimColor.rgb * pow (rim, _RimPower);
//		}
//		ENDCG
//	}
//}

//shader "Detail"{
//	properties{
//		_MainTex ("Main Texture", 2d) = "white"{}
//		_BumpMap ("Bump Map", 2d) = "bump"{}
//		_Detail ("Detail", 2d) = "gray"{}
//	}
//	subshader{
//		tags {"RenderType" = "Opaque"}
//		CGPROGRAM
//		#pragma surface surf Lambert
//		struct Input{
//			float2 uv_MainTex;
//			float2 uv_BumpMap;
//			float2 uv_Detail;
//		};
//		sampler2D _MainTex;
//		sampler2D _BumpMap;
//		sampler2D _Detail;
//		void surf (Input IN, inout SurfaceOutput o){
//			o.Albedo = tex2D (_MainTex, IN.uv_MainTex).rgb;
//			o.Albedo *= tex2D (_Detail, IN.uv_Detail).rgb * 2;
//			o.Normal = UnpackNormal (tex2D (_BumpMap, IN.uv_BumpMap));
//		}
//		ENDCG
//	}
//}

//shader "Detail in ScreenSpace"{
//	properties{
//		_MainTex ("Main Texture", 2d) = "white"{}
//		_Detail ("Detail", 2D) = "gray"{}
//	}
//	subshader{
//		tags{"RenderType" = "Opaque"}
//		CGPROGRAM
//		#pragma surface surf Lambert
//		struct Input{
//			float2 uv_MainTex;
//			//float2 uv_Detail;
//			float4 screenPos;
//		};
//		sampler2D _MainTex;
//		sampler2D _Detail;
//		void surf(Input IN, inout SurfaceOutput o){
//			o.Albedo = tex2D (_MainTex, IN.uv_MainTex).rgb;
//			float2 screenUV = IN.screenPos.xy / IN.screenPos.w;
//          	screenUV *= float2(8,6);
//          	o.Albedo *= tex2D (_Detail, screenUV).rgb * 2;
//		}
//		ENDCG
//	}
//}

shader "World Reflection"{
	properties{
		_MainTex ("Main Texture", 2d) = "white"{}
		_CubeMap ("Cube Map", cube) = ""{}
	}
	subshader{
		tags{"RenderType" = "Opaque"}
		CGPROGRAM
		#pragma surface surf Lambert
		struct Input{
			float2 uv_MainTex;
			float3 worldRefl;
		};
		sampler2D _MainTex;
		samplerCUBE _CubeMap;
		void surf (Input IN, inout SurfaceOutput o){
			o.Albedo = tex2D (_MainTex, IN.uv_MainTex).rgb;
			o.Emission = texCUBE (_CubeMap, IN.worldRefl).rgb;
		}
		ENDCG
	}
}




























