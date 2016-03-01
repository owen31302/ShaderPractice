//Shader "Custom/fixfunctionshader" {
//	Properties {
//		_Color ("Color", Color) = (1,1,1,1)
//		_MainTex ("Albedo (RGB)", 2D) = "white" {}
//		_Glossiness ("Smoothness", Range(0,1)) = 0.5
//		_Metallic ("Metallic", Range(0,1)) = 0.0
//	}
//	SubShader {
//		Tags { "RenderType"="Opaque" }
//		LOD 200
//		
//		CGPROGRAM
//		// Physically based Standard lighting model, and enable shadows on all light types
//		#pragma surface surf Standard fullforwardshadows
//
//		// Use shader model 3.0 target, to get nicer looking lighting
//		#pragma target 3.0
//
//		sampler2D _MainTex;
//
//		struct Input {
//			float2 uv_MainTex;
//		};
//
//		half _Glossiness;
//		half _Metallic;
//		fixed4 _Color;
//
//		void surf (Input IN, inout SurfaceOutputStandard o) {
//			// Albedo comes from a texture tinted by color
//			fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
//			o.Albedo = c.rgb;
//			// Metallic and smoothness come from slider variables
//			o.Metallic = _Metallic;
//			o.Smoothness = _Glossiness;
//			o.Alpha = c.a;
//		}
//		ENDCG
//	} 
//	FallBack "Diffuse"
//}

//Shader "Solid red"{
//	subshader{
//		pass{ color (1,0.5,0,0)}
//	}
//}

//Shader "VertexLit White"{
//	Subshader{
//		pass{
//			material{
//				diffuse (1,1,1,1)
//				ambient (1,1,1,1)
//			}
//			Lighting on
//		}
//	}
//}

//Shader "VertexLit"{
//	properties{
//		_Color ("Main Color", color) = (1,1,1,1)
//		_SpecColor ("Specular Color", color) = (1,1,1,1)
//		_Emission ("Emmisive Color", color) = (0,0,0,0)
//		_Shininess ("Shininess", range(0,1)) = 0.7
//		_MainTex ("Base (RGB)", 2D) = "white"{} 
//	}
//	Subshader{
//		pass{
//			material{
//				diffuse[_Color]
//				ambient[_Color]
//				shininess[_Shininess]
//				specular[_SpecColor]
//				emission[_Emission]
//			}
//			Lighting on
//			separatespecular on
//			settexture[_MainTex]{
//				combine texture * primary double, texture * primary
//			}
//		}
//	}
//}

//Shader "Show Insides"{
//	properties{
//		_Color ("Main Color", color) = (1,1,1,1)
//		_SpecColor ("Specular Color", color) = (1,1,1,1)
//		_Emission ("Emmisive Color", color) = (0,0,0,0)
//		_Shininess ("Shininess", range(0,1)) = 0.7
//		_MainTex ("Base (RGB)", 2D) = "white"{} 
//	}
//	Subshader{
//		pass{
//			material{
//				diffuse[_Color]
//				ambient[_Color]
//				shininess[_Shininess]
//				specular[_SpecColor]
//				emission[_Emission]
//			}
//			Lighting on
//			cull front
//			separatespecular on
//			settexture[_MainTex]{
//				combine texture * primary double, texture * primary
//			}
//			
//		}
//	}
//}

//shader "Reveal Backfaces"{
//	properties{
//		_MainTex ("Main Texture", 2d) = "white"{}
//	}
//	subshader{
//		pass{
//			material{
//				diffuse (1,1,1,1)
//			}
//			lighting on
//			settexture[_MainTex]{
//				combine primary*texture
//			}
//		}
//		pass{
//			color (1,0,1,1)
//			cull front
//		}
//	}
//}

//shader "Simple Glass"{
//	properties{
//		_Color ("Main Color", color) = (1,1,1,1)
//		_SpecColor ("Specular Color", color) = (1,1,1,1)
//		_Emission ("Emmisive Color", color) = (0,0,0,0)
//		_Shininess ("Shininess", range(0,1)) = 0.7
//		_MainTex ("Base (RGB)", 2D) = "white"{} 
//	}
//	Subshader{
//		// We use the material in many passes by defining them in the subshader.
//        // Anything defined here becomes default values for all contained passes.
//		material{
//				diffuse[_Color]
//				ambient[_Color]
//				shininess[_Shininess]
//				specular[_SpecColor]
//				emission[_Emission]
//			}
//		Lighting on
//		separatespecular on
//		
//		// set up alpha blending
//		blend srcalpha oneminussrcalpha
//			
//		// Render the back facing parts of the object.
//        // If the object is convex, these will always be further away
//        // than the front-faces.
//		pass{
//			cull front
//			settexture[_MainTex]{
//				combine texture * primary
//			}
//		}
//		
//		// Render the parts of the object facing us.
//        // If the object is convex, these will be closer than the
//        // back-faces.
//        pass{
//        	cull back
//        	settexture[_MainTex]{
//				combine texture * primary
//			}
//        }
//	}
//}

//shader "Alpha Blending Two Textures"{
//	properties{
//		_MainTex ("Main Texture (RGB)", 2d) = "white"{}
//		_BlendTex ("Blended Texture (RGBA)", 2d) = "white"{}
//	}
//	subshader{
//		pass{
//			// apply base texture
//			settexture [_MainTex]{
//				combine texture
//			}
//			// Blend in the alpha texture using the lerp operator
//			settexture [_BlendTex]{
//				combine texture lerp (texture) previous
//			}
//		}
//	}
//}

//shader "Alpha Controlled Self-illumination"{
//	properties{
//		_MainTex ("Main Texture", 2d) = "white"{}
//	}
//	subshader{
//		pass{
//			// setup basic white vertex lighting
//			material{
//				diffuse (1,1,1,1)
//				ambient (1,1,1,1)
//			}
//			lighting on
//			
//			// use texture alpha to blend up white
//			settexture[_MainTex]{
//				constantcolor (1,1,0,1)
//				combine constant lerp(texture) previous
//			}
//			
//			
//		}
//	}
//}

//shader "Alpha Controlled Self-illumination"{
//	properties{
//		_MainTex ("Main Texture", 2d) = "white"{}
//	}
//	subshader{
//		pass{
//			// setup basic white vertex lighting
//			material{
//				diffuse (1,1,1,1)
//				ambient (1,1,1,1)
//			}
//			lighting on
//			
//			// use texture alpha to blend up white
//			settexture[_MainTex]{
//				constantcolor (0.5,1,0.5,1)
//				combine constant lerp(texture) previous
//			}
//			
//			// Multiply in texture
//			settexture[_MainTex]{
//				combine previous * texture
//			}
//		}
//	}
//}

//shader "Alpha Controlled Self-illumination2"{
//	properties{
//		_MainTex ("Main Texture", 2d) = "white"{}
//		_IlluminationCol ("Self-Illumination color (RGB)", color) = (1,1,1,1)
//	}
//	subshader{
//		pass{
//			// setup basic white vertex lighting
//			material{
//				diffuse (1,1,1,1)
//				ambient (1,1,1,1)
//			}
//			lighting on
//			
//			// use texture alpha to blend up white
//			settexture[_MainTex]{
//				constantcolor [_IlluminationCol]
//				combine constant lerp(texture) previous
//			}
//			
//			// Multiply in texture
//			settexture[_MainTex]{
//				combine previous * texture
//			}
//		}
//	}
//}

//shader "Alpha Controlled Self-illumination3"{
//	properties{
//		_MainTex ("Main Texture", 2d) = "white"{}
//		_IlluminationCol ("Self-Illumination color (RGB)", color) = (1,1,1,1)
//		_Color ("Main Color", color) = (1,1,1,1)
//		_SpecColor ("Specular Color", color) = (1,1,1,1)
//		_Emission ("Emmisive Color", color) = (0,0,0,0)
//		_Shininess ("Shininess Range", range(0.01, 1)) = 0.7
//	}
//	subshader{
//		pass{
//			// setup basic white vertex lighting
//			material{
//				diffuse [_Color]
//				ambient [_Color]
//				specular [_SpecColor]
//				emission [_Emission]
//				shininess [_Shininess]
//			}
//			lighting on
//			
//			// use texture alpha to blend up white
//			settexture[_MainTex]{
//				constantcolor [_IlluminationCol]
//				combine constant lerp(texture) previous
//			}
//			
//			// Multiply in texture
//			settexture[_MainTex]{
//				combine previous * texture
//			}
//		}
//	}
//}

//shader "Simple Alpha Test"{
//	properties{
//		_MainTex ("Main Texture", 2d) = "white"{}
//	}
//	subshader{
//		pass{
//			// only render pixels with an alpha larger than 50%
//			alphatest greater 0.5
//			settexture [_MainTex]{
//				combine texture
//			}
//		}
//	}
//}

//shader "Cutoff Alpha"{
//	properties{
//		_MainTex ("Main Texture", 2d) = "white"{}
//		_CutOff ("Alpha cutOff", range(0, 1)) = 0.5
//	}
//	subshader{
//		pass{
//			// only render pixels with an alpha larger than 50%
//			alphatest greater [_CutOff]
//			
//			material{
//				diffuse (1,1,1,1)
//				ambient (1,1,1,1)
//			}
//			lighting on
//			
//			settexture [_MainTex]{
//				combine texture * primary
//			}
//		}
//	}
//}

//shader "Vegetation 1"{
//	properties{
//		_Color ("Color", color) = (1,1,1,1)
//		_MainTex ("Main Texture", 2d) = "white"{}
//		_CutOff ("Alpha CutOff", range(0, 1)) = 0.5
//	}
//	subshader{
//		// share by all pass
//		material{
//			diffuse [_Color]
//			ambient [_Color]
//		}
//		lighting on
//		
//		// render both front and back facing polygon
//		cull off
//		
//		// first pass
// 		// render any pixels that are more than [_Cutoff] opaque
//		pass{
//			alphatest greater [_CutOff]
//			settexture [_MainTex]{
//				combine texture * primary, texture
//			}
//		}
//	}
//}

//shader "Vegetation 2"{
//	properties{
//		_Color ("Color", color) = (1,1,1,1)
//		_MainTex ("Main Texture", 2d) = "white"{}
//		_CutOff ("Alpha CutOff", range(0, 1)) = 0.5
//	}
//	subshader{
//		// share by all pass
//		material{
//			diffuse [_Color]
//			ambient [_Color]
//		}
//		lighting on
//		
//		// render both front and back facing polygon
//		cull off
//		
//		// first pass
//		// render any pixels that are more than [_Cutoff] opaque
//		pass{
//			alphatest greater [_CutOff]
//			settexture [_MainTex]{
//				combine texture * primary, texture
//			}
//		}
//		
//		// second pass
//		// render in the semitransparent detail
//		pass{
//			// don't write to the depth buffer
//			zwrite off
//			// don't write pixels we have already written
//			ztest less
//			// only render pixels less or equal to the value
//			alphatest lequal [_CutOff]
//			
//			// set up alpha blending
//			blend srcalpha oneminussrcalpha
//			
//			settexture [_MainTex] {
//				combine texture * primary, texture
//			}
//		}
//	}
//}

//shader "Vegetation 3"{
//	properties{
//		_Color ("Color", color) = (1,1,1,1)
//		_MainTex ("Main Texture", 2d) = "white"{}
//		_CutOff ("Alpha CutOff", range(0, 1)) = 0.5
//	}
//	subshader{
//		// share by all pass
//		material{
//			diffuse [_Color]
//			ambient [_Color]
//		}
//		lighting on
//		
//		// render both front and back facing polygon
//		cull off
//
//		// second pass
//		// render in the semitransparent detail
//		pass{
//			// set up alpha blending
//			blend srcalpha oneminussrcalpha
//			
//			settexture [_MainTex] {
//				combine texture * primary, texture
//			}
//		}
//	}
//}

//shader "Vegetation 4"{
//	properties{
//		_Color ("Color", color) = (1,1,1,1)
//		_MainTex ("Main Texture", 2d) = "white"{}
//		_CutOff ("Alpha CutOff", range(0, 1)) = 0.5
//	}
//	subshader{
//		// share by all pass
//		material{
//			diffuse [_Color]
//			ambient [_Color]
//		}
//		lighting on
//		
//		// render both front and back facing polygon
//		cull off
//		
//		// second pass
//		// render in the semitransparent detail
//		pass{
//			// don't write to the depth buffer
//			//zwrite off
//			// don't write pixels we have already written
//			//ztest greater
//			//only render pixels less or equal to the value
//			alphatest gequal [_CutOff]
//			
//			// set up alpha blending
//			//blend srcalpha oneminussrcalpha
//			
//			settexture [_MainTex] {
//				combine texture * primary, texture
//			}
//		}
//	}
//}

//shader "Simple Additive"{
//	properties{
//		_MainTex ("Main Texture", 2d) = "white"{}
//	}
//	subshader{
//		tags{"queue" = "transparent"}
//		pass{
//			blend one one
//			settexture [_MainTex]{
//				combine texture, texture
//			}
//		}
//		
//	}
//}

//shader "Simple alpha"{
//	properties{
//		_Color ("Color", color) = (1,1,1,1)
//		_MainTex("Main Texture", 2d) = "white"{}
//		_Reflections("Base (RGB) Gloss (A)", cube) = "skybox"{TexGen cubereflect}
//	}
//	subshader{
//		tags{"queue" = "transparent"}
//		pass{
//			blend srcalpha oneminussrcalpha
//			material{
//				diffuse [_Color]
//			}
//			lighting on
//			settexture [_MainTex]{
//				combine texture * primary double, texture * primary 
//			}
//		}
//	}
//}

shader "Glass"{
	properties{
		_Color ("Color", color) = (1,1,1,1)
		_MainTex("Main Texture", 2d) = "white"{}
		_Reflections("Base (RGB) Gloss (A)", cube) = "skybox"{TexGen cubereflect}
	}
	subshader{
		tags{"queue" = "transparent"}
		pass{
			blend srcalpha oneminussrcalpha
			material{
				diffuse [_Color]
			}
			lighting on
			settexture [_MainTex]{
				combine texture * primary double, texture * primary 
			}
		}
		pass{
			blend one one
			material{
				diffuse [_Color]
			}
			lighting on
			settexture [_Reflections]{
				combine texture
				matrix [_Reflection]
			}
		}
	}
}

























