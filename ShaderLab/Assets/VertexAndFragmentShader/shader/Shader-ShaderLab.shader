//Shader "SolidColor" {
//	SubShader{
//		Pass{
//		CGPROGRAM
//
//		#pragma vertex vert
//		#pragma fragment frag
//
//		float4 vert(float4 v:POSITION) : SV_POSITION{
//			return mul(UNITY_MATRIX_MVP, v);
//		}
//
//		fixed4 frag() : COLOR{
//			return fixed4(1.0,0.0,0.0,1.0);
//		}
//
//		ENDCG
//		}
//	}
//}

//Shader "WindowCoordinates/Base" {
//	SubShader{
//		Pass{
//		CGPROGRAM
//
//		#pragma vertex vert
//		#pragma fragment frag
//		#pragma target 3.0
//
//		#include "UnityCG.cginc"
//
//		float4 vert(appdata_base v) : POSITION{
//			return mul(UNITY_MATRIX_MVP, v.vertex);
//		}
//
//		fixed4 frag(float4 sp:WPOS) : COLOR{
//			//return fixed4(sp.xy / _ScreenParams.xy,0.0,1.0);
//			return fixed4(sp.x/_ScreenParams.x,0.0,0.0,1.0);
//		}
//
//		ENDCG
//		}
//	}
//}

//Shader "WindowCoordinates/Bars" {
//    SubShader {
//        Pass {
//            CGPROGRAM
//            #pragma vertex vert
//            #pragma fragment frag
//			
//            #include "UnityCG.cginc"
//
//            struct vertOut {
//                float4 pos:SV_POSITION;
//                float4 scrPos:TEXCOORD2;
//            };
//
//            vertOut vert(appdata_base v) {
//                vertOut o;
//                o.pos = mul (UNITY_MATRIX_MVP, v.vertex);
//                o.scrPos = ComputeScreenPos(o.pos);
//                return o;
//            }
//
//            fixed4 frag(vertOut i) : COLOR {
//                float2 wcoord = (i.scrPos.xy/i.scrPos.w);
//                fixed4 color;
//
//                if (fmod(20.0*wcoord.x,2.0)<1.0) {
//                    color = fixed4(wcoord.xy,0.0,1.0);
//                } else {
//                    color = fixed4(0.3,0.3,0.3,1.0);
//                }
//                return color;
//            }
//
//            ENDCG
//        }
//    }
//}

//Shader "WindowCoordinates/Bars2" {
//	SubShader{
//		Pass{
//		CGPROGRAM
//
//		#pragma vertex vert
//		#pragma fragment frag
//		#pragma target 3.0
//
//		#include "UnityCG.cginc"
//
//		float4 vert(appdata_base v) : POSITION{
//			return mul(UNITY_MATRIX_MVP, v.vertex);
//		}
//
//		fixed4 frag(float4 sp:WPOS) : COLOR{
//			float2 wcoord = sp.xy/_ScreenParams.xy;
//			fixed4 color;
//			
//            if (fmod(20.0*wcoord.x,2.0)<1.0) {
//                color = fixed4(wcoord.xy,0.0,1.0);
//            } else {
//                color = fixed4(0.3,0.3,0.3,1.0);
//            }
//			return color;
//		}
//		
//		ENDCG
//		}
//	}
//}

//shader "WindowCoordinates/Vignetting"{
//	subshader{
//		pass{
//			CGPROGRAM
//			#pragma vertex vert
//			#pragma fragment frag
//			
//			#include "UnityCG.cginc"
//			
//			float4 vert(appdata_base v):POSITION{
//				return mul (UNITY_MATRIX_MVP, v.vertex);
//			}
//			
//			float4 frag(float4 sp:WPOS):color{
//				float2 wcoord = sp.xy/_ScreenParams.xy;
//				float vig = clamp(3.0*length(wcoord-0.5),0.0,1.0);
//                return lerp (float4(wcoord,0.0,1.0),float4(0.3,0.3,0.3,1.0),vig);
//			}
//			ENDCG
//		}
//	}
//}

//shader "WindowCoordinates/CirclesMask"{
//	properties{
//		_CirclesX ("Circles in X", float) = 20
//		_CirclesY ("Circles in Y", float) = 15
//		_Fade ("Fade", Range(0.1,1.0)) = 0.5
//	}
//	subshader{
//		Pass{
//			CGPROGRAM
//			#pragma vertex vert
//			#pragma fragment frag
//			
//			#include "UnityCG.cginc"
//			
//			 float _CirclesX;
//             float _CirclesY;
//             float _Fade;
//            
//            float4 vert(appdata_base v) : POSITION {
//                return mul (UNITY_MATRIX_MVP, v.vertex);
//            }
//            
//            float4 frag(float4 sp:WPOS) : COLOR {
//                float2 wcoord = sp.xy/_ScreenParams.xy;
//                float4 color;
//                if (length(fmod(float2(_CirclesX*wcoord.x,_CirclesY*wcoord.y),2.0)-1.0)<_Fade) {
//                    color = float4(sp.xy/_ScreenParams.xy,0.0,1.0);
//                } else {
//                    color = float4(0.3,0.3,0.3,1.0);
//                } 
//                return color;
//            }
//			ENDCG
//		}
//	}
//}

//shader "TextureCoordinates/Base"{
//	subshader{
//		pass{
//			CGPROGRAM
//			#pragma vertex vert
//			#pragma fragment frag
//			//#pragma target 3.0
//			
//			#include "UnityCG.cginc"
//			
//			struct vertexInput{
//				float4 vertex : POSITION;
//				float4 texcoord0 : TEXCOORD0;
//			};
//			
//			struct fragmentInput{
//				float4 position : SV_POSITION;
//				float4 texcoord0 : TEXCOORD0;
//			};
//			
//			fragmentInput vert(vertexInput i){
//				fragmentInput o;
//				o.position = mul (UNITY_MATRIX_MVP, i.vertex);
//				o.texcoord0 = i.texcoord0;
//				return o;
//			}
//			
//			float4 frag(fragmentInput i) : color{
//				return float4(i.texcoord0.xy, 0.0, 1.0);
//			}
//			
//			ENDCG
//		}
//	}
//}

//Shader "Custom/TextureCoordinates/Chess" {
//    SubShader {
//        Pass {
//            CGPROGRAM
//            #pragma vertex vert
//            #pragma fragment frag
//
//            #include "UnityCG.cginc"
//
//            struct vertexInput {
//                float4 vertex : POSITION;
//                float4 texcoord0 : TEXCOORD0;
//            };
//
//            struct fragmentInput{
//                float4 position : SV_POSITION;
//                float4 texcoord0 : TEXCOORD0;
//            };
//
//            fragmentInput vert(vertexInput i){
//                fragmentInput o;
//                o.position = mul (UNITY_MATRIX_MVP, i.vertex);
//                o.texcoord0 = i.texcoord0;
//                return o;
//            }
//
//            float4 frag(fragmentInput i) : COLOR {
//                float4 color;
//                if ( fmod(i.texcoord0.x*8.0,2.0) < 1.0 ){
//                    if ( fmod(i.texcoord0.y*8.0,2.0) < 1.0 )
//                    {
//                        color = float4(1.0,1.0,1.0,1.0);
//                    } else {
//                        color = float4(0.0,0.0,0.0,1.0);
//                    }
//                } else {
//                    if ( fmod(i.texcoord0.y*8.0,2.0) > 1.0 )
//                    {
//                        color = float4(1.0,1.0,1.0,1.0);
//                    } else {
//                        color = float4(0.0,0.0,0.0,1.0);}
//                    }
//                return color;
//            }
//            ENDCG
//        }
//    }
//}

//Shader "Custom/TextureCoordinates/ChessOpt" {
//    SubShader {
//        Pass {
//            CGPROGRAM
//            #pragma vertex vert_img
//            #pragma fragment frag
//
//            #include "UnityCG.cginc"
//
//            float4 frag(v2f_img i) : COLOR {
//                bool p = fmod(i.uv.x*8.0,2.0) < 1.0;
//                bool q = fmod(i.uv.y*8.0,2.0) > 1.0;
//                
//                float compare = (p && q) || !(p || q);
//                return float4(compare, compare, compare, 1.0);
//            }
//            ENDCG
//        }
//    }
//}

//Shader "Custom/TextureCoordinates/Mandelbrot" {
//
//    SubShader {
//        Pass {
//            CGPROGRAM
//            #pragma vertex vert_img
//            #pragma fragment frag
//            #pragma target 3.0
//
//            #include "UnityCG.cginc"
//            
//            float4 frag(v2f_img i) : COLOR {
//                float2 mcoord;
//                float2 coord = float2(0.0,0.0);
//                mcoord.x = ((1.0-i.uv.x)*3.5)-2.5;
//                mcoord.y = (i.uv.y*2.0)-1.0;
//                float iteration = 0.0;
//                const float _MaxIter = 29.0;
//                const float PI = 3.14159;
//                float xtemp;
//                for ( iteration = 0.0; iteration < _MaxIter; iteration += 1.0) {
//                    if ( coord.x*coord.x + coord.y*coord.y > 2.0*(cos(fmod(_Time.y,2.0*PI))+1.0) )
//                    break;
//                    xtemp = coord.x*coord.x - coord.y*coord.y + mcoord.x;
//                    coord.y = 2.0*coord.x*coord.y + mcoord.y;
//                    coord.x = xtemp;
//                }
//                float val = fmod((iteration/_MaxIter)+_Time.x,1.0);
//                float4 color;
//
//                color.r = clamp((3.0*abs(fmod(2.0*val,1.0)-0.5)),0.0,1.0);
//                color.g = clamp((3.0*abs(fmod(2.0*val+(1.0/3.0),1.0)-0.5)),0.0,1.0);
//                color.b = clamp((3.0*abs(fmod(2.0*val-(1.0/3.0),1.0)-0.5)),0.0,1.0);
//                color.a = 1.0;
//                
//                return color;
//            }
//            ENDCG
//        }
//    }
//}

//shader "TextureCoordinates/Lenna"{
//	properties{
//		_MainTex ("Main Texture", 2d) = "white"{}
//	}
//	subshader{
//		pass{
//			CGPROGRAM
//			#pragma vertex vert_img
//			#pragma fragment frag
//			
//			#include "UnityCG.cginc"
//			
//			uniform sampler2D _MainTex;
//			
//			float4 frag(v2f_img i) : color{
//				return tex2D(_MainTex, i.uv);
//			}
//			
//			ENDCG
//		}
//	}
//}

//shader "VertexInputSimple"{
//	subshader{
//		pass{
//			CGPROGRAM
//			#pragma vertex vert
//			#pragma fragment frag
//			#include "UnityCG.cginc"
//			
//			struct v2f{
//				float4 position: SV_POSITION;
//				float4 color: COLOR;
//			};
//			
//			v2f vert(appdata_base v){
//				v2f o;
//				o.position = mul(UNITY_MATRIX_MVP, v.vertex);
//				o.color.xyz = v.normal * 0.5 + 0.5; // -1~1 -> 0~1
//				o.color.w = 1.0;
//				return o;
//			}
//			
//			fixed4 frag(v2f i): color{
//				return i.color;
//			}
//			
//			ENDCG
//		}
//	}
//}

//shader "diffuse simple"{
//	properties{
//		_MainTex ("Main Texture", 2d) = "white"{}
//		_MainColor ("Main Color", color) = (1,1,1,1)
//	}
//	subshader{
//		Tags { "LightMode" = "ForwardBase" }
//		Pass{
//			CGPROGRAM
//			#pragma vertex vert
//			#pragma fragment frag
//			#pragma multi_compile_fwdbase
//			#include "UnityCG.cginc"
//			#include "AutoLight.cginc"
//			
//			sampler2D _MainTex;
//			fixed4 _MainColor;
//			fixed4 _LightColor0;
//			
//			struct v2f{
//				float4 pos : SV_POSITION;
//				float4 uv : TEXCOORD0;
//				float3 nor : TEXCOORD1;
//				float3 worldPos : TEXCOORD2;
//				SHADOW_COORDS(3)
//			};
//			
//			v2f vert(appdata_full IN){
//				v2f o;
//				UNITY_INITIALIZE_OUTPUT(v2f,o);
//				o.pos = mul(UNITY_MATRIX_MVP, IN.vertex);
//				o.uv = float4(IN.texcoord.xy, 0, 0);
//				float3 worldPos = mul(_Object2World, IN.vertex).xyz;
//				float3 worldNor = UnityObjectToWorldNormal(IN.normal);
//				o.worldPos = worldPos;
//				o.nor = worldNor;
//				TRANSFER_SHADOW(o); // pass shadow coordinates to pixel shader
//				return o;
//			}
//			
//			fixed4 frag (v2f IN): COLOR0{
//				float3 nor = normalize(IN.nor);
//				fixed3 lightDir = normalize(UnityWorldSpaceLightDir(IN.worldPos));
//				UNITY_LIGHT_ATTENUATION(atten, IN, IN.worldPos)
//				
//				fixed diff = max (0, dot (nor, lightDir));
//				fixed4 c = tex2D(_MainTex, IN.uv.xy);
//				c.rgb = c.rgb * _LightColor0 * diff * atten;
//				c.a = 1.0;
//				return  c;
//			}
//			
//			ENDCG
//		}
//	}
//	Fallback "Diffuse"
//}

//Shader "Example/Diffuse Simple" {
//    Properties { 
//    _MainColor ("Main Color", COLOR) = (1,1,1,1)
//      _SpecColor ("Specular Color", COLOR) = (1,1,1,1)
//      _Shininess ("Shininess", Float) = 0.5
//      _MainTex ("Texture", 2D) = "white" {} 
//      _BumpMap ("Bumpmap", 2D) = "bump" {}
//      _Cube ("Cubemap", CUBE) = "" {} 
//      _Amount ("Extrusion Amount", Range(-1,1)) = 0.5 
//      _ColorTint ("Tint", Color) = (1.0, 0.6, 0.6, 1.0)
//
//
//       
//   } 
//   SubShader {
//      Tags { "LightMode" = "ForwardBase" }
//      Pass { 
//	   CGPROGRAM
//	    #pragma vertex vert 
//	    #pragma fragment frag
//	    #pragma multi_compile_fwdbase
//	    #include "UnityCG.cginc" 
//	    #include "AutoLight.cginc"
//	    
//	    sampler2D _MainTex;
//	    fixed4 _MainColor;
//	    fixed4 _LightColor0;
//	    
//	    struct appdata { 
//         float4 vertex : POSITION;
//         float4 texcoord : TEXCOORD0; 
//      }; 
//
//	    struct v2f {
//	       float4 pos : SV_POSITION;
//	       float4 uv : TEXCOORD0; 
//	       float3 nor : TEXCOORD1;
//	       float3 worldPos : TEXCOORD2;
//	       SHADOW_COORDS(3)
//	     }; 
//	       v2f vert (appdata_full v) {
//	           v2f o; 
//	           UNITY_INITIALIZE_OUTPUT(v2f,o);
//	           o.pos = mul (UNITY_MATRIX_MVP, v.vertex); 
//	           o.uv = float4( v.texcoord.xy, 0, 0 ); 
//	           float3 worldPos = mul(_Object2World, v.vertex).xyz;
//	           float3 worldNor = UnityObjectToWorldNormal(v.normal);
//	           o.worldPos = worldPos;
//	           o.nor = worldNor;
//	           TRANSFER_SHADOW(o);
//	             return o;
//	        }
//	      fixed4 frag (v2f i) : COLOR0 
//	      { 
//	         float3 nor = normalize(i.nor);
//	         fixed3 lightDir = normalize(UnityWorldSpaceLightDir(i.worldPos));
//	         UNITY_LIGHT_ATTENUATION(atten, i, i.worldPos)
//	         
//	         fixed diff = max (0, dot (nor, lightDir));
//	
//			fixed4 c = tex2D(_MainTex, i.uv.xy);
//			c.rgb = c.rgb * _LightColor0 * diff*atten;
//			c.a = 1.0;
//	         
//	         return c; 
//	      } 
//	     ENDCG
//	   }
//
//   }
//   Fallback "Diffuse"
//}

//Shader "Test" {
//    SubShader {
//        Tags { "RenderType" = "Opaque"}
//        // This pass acts the same as the surface shader first pass.
//        // Calculates per-pixel the most important directional light with shadows,
//        // then per-vertex the next 4 most important lights,
//        // then per-vertex spherical harmionics the rest of the lights,
//        // and the ambient light value.
//        Pass {
//            Tags {"LightMode" = "ForwardBase"}
//            CGPROGRAM
//                #pragma multi_compile_fwdbase
//                #pragma vertex vert
//                #pragma fragment frag
//                #pragma fragmentoption ARB_precision_hint_fastest
//                #include "UnityCG.cginc"
//                #include "AutoLight.cginc"
//
//                struct Input
//                {
//                    float4 pos : SV_POSITION;
//                    float3 vlight : COLOR;
//                    float3 lightDir : TEXCOORD1;
//                    float3 vNormal : TEXCOORD2;
//                    LIGHTING_COORDS(3,4)
//                };
//                Input vert(appdata_full v)
//                {
//                    Input o;
//                    o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
//                    // Calc normal and light dir.
//                    o.lightDir = normalize(ObjSpaceLightDir(v.vertex));
//                    o.vNormal = normalize(v.normal).xyz;
//                    // Calc spherical harmonics and vertex lights. Ripped from compiled surface shader.
//                    float3 worldPos = mul(_Object2World, v.vertex).xyz;
//                    float3 worldNormal = mul((float3x3)_Object2World, SCALED_NORMAL);
//                    o.vlight = float3(0,0,0);
//                    #ifdef LIGHTMAP_OFF
//                        float3 shlight = ShadeSH9(float4(worldNormal, 1.0));
//                        o.vlight = shlight;
//                        #ifdef VERTEXLIGHT_ON
//                            o.vlight += Shade4PointLights (
//                                unity_4LightPosX0, unity_4LightPosY0, unity_4LightPosZ0,
//                                unity_LightColor[0].rgb, unity_LightColor[1].rgb, unity_LightColor[2].rgb, unity_LightColor[3].rgb,
//                                unity_4LightAtten0, worldPos, worldNormal
//                                );
//                        #endif // VERTEXLIGHT_ON
//                    #endif // LIGHTMAP_OFF
//                    TRANSFER_VERTEX_TO_FRAGMENT(o);
//                    return o;
//                }
//                float4 _LightColor0; // Contains the light color for this pass.
//                half4 frag(Input IN) : COLOR
//                {
//                    IN.lightDir = normalize ( IN.lightDir );
//                    IN.vNormal = normalize ( IN.vNormal );
//                    float atten = LIGHT_ATTENUATION(IN);
//                    float3 color;
//                    float NdotL = saturate( dot (IN.vNormal, IN.lightDir ));
//                    color = UNITY_LIGHTMODEL_AMBIENT.rgb * 2;
//                    color += IN.vlight;
//                    color += _LightColor0.rgb * NdotL * ( atten * 2);
//                    return half4(color, 1.0f);
//                }
//            ENDCG
//        }
//        // Take this pass out if you don't want extra per-pixel lights.
//        // Just set the other lights' Render Mode to "Not Important",
//        // and they will be calculated as Spherical Harmonics or Vertex Lights in the above pass instead.
//        Pass {
//            Tags {"LightMode" = "ForwardAdd"}
//            CGPROGRAM
//                #pragma multi_compile_fwdadd
//                #pragma vertex vert
//                #pragma fragment frag
//                #pragma fragmentoption ARB_precision_hint_fastest
//                #include "UnityCG.cginc"
//                #include "AutoLight.cginc"
//                struct Input
//                {
//                    float4 pos : SV_POSITION;
//                    float3 lightDir : TEXCOORD1;
//                    float3 vNormal : TEXCOORD2;
//                };
//                Input vert(appdata_full v)
//                {
//                    Input o;
//                     o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
//                    // Calc normal and light dir.
//                    o.lightDir = normalize(ObjSpaceLightDir(v.vertex));
//                    o.vNormal = normalize(v.normal).xyz;
//                    // Don't need any ambient or vertex lights in here as this is just an additive pass for each extra light.
//                    // Shadows won't work here, either.
//                    return o;
//                }
//                float4 _LightColor0; // Contains the light color for this pass.
//                half4 frag(Input IN) : COLOR
//                {
//                    IN.lightDir = normalize ( IN.lightDir );
//                    IN.vNormal = normalize ( IN.vNormal );
//                    float3 color;
//                    float NdotL = saturate( dot (IN.vNormal, IN.lightDir ));
//                    color = _LightColor0.rgb * NdotL;
//                    return half4(color, 1.0f);
//                }
//            ENDCG
//        }
//    }
//    FallBack "Diffuse"
//}

Shader "Custom/SolidColor" {
    SubShader {
        Pass {
         
            // 1.) This will be the base forward rendering pass in which ambient, vertex, and
            // main directional light will be applied. Additional lights will need additional passes
            // using the "ForwardAdd" lightmode.
            // see: http://docs.unity3d.com/Manual/SL-PassTags.html
            Tags { "LightMode" = "ForwardBase" }
         
            CGPROGRAM
 
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
 
            // 2.) This matches the "forward base" of the LightMode tag to ensure the shader compiles
            // properly for the forward bass pass. As with the LightMode tag, for any additional lights
            // this would be changed from _fwdbase to _fwdadd.
            #pragma multi_compile_fwdbase
 
            // 3.) Reference the Unity library that includes all the lighting shadow macros
            #include "AutoLight.cginc"
 
 
            struct v2f
            {
                float4 pos : SV_POSITION;
                 
                // 4.) The LIGHTING_COORDS macro (defined in AutoLight.cginc) defines the parameters needed to sample 
                // the shadow map. The (0,1) specifies which unused TEXCOORD semantics to hold the sampled values - 
                // As I'm not using any texcoords in this shader, I can use TEXCOORD0 and TEXCOORD1 for the shadow 
                // sampling. If I was already using TEXCOORD for UV coordinates, say, I could specify
                // LIGHTING_COORDS(1,2) instead to use TEXCOORD1 and TEXCOORD2.
                LIGHTING_COORDS(0,1)
            };
 
 
            v2f vert(appdata_base v) {
                v2f o;
                o.pos = mul (UNITY_MATRIX_MVP, v.vertex);
                 
                // 5.) The TRANSFER_VERTEX_TO_FRAGMENT macro populates the chosen LIGHTING_COORDS in the v2f structure
                // with appropriate values to sample from the shadow/lighting map
                TRANSFER_VERTEX_TO_FRAGMENT(o);
                 
                return o;
            }
 
            fixed4 frag(v2f i) : COLOR {
             
                // 6.) The LIGHT_ATTENUATION samples the shadowmap (using the coordinates calculated by TRANSFER_VERTEX_TO_FRAGMENT
                // and stored in the structure defined by LIGHTING_COORDS), and returns the value as a float.
                float attenuation = LIGHT_ATTENUATION(i);
                return fixed4(1.0,0.0,0.0,1.0) * attenuation;
            }
 
            ENDCG
        }
    }
     
    // 7.) To receive or cast a shadow, shaders must implement the appropriate "Shadow Collector" or "Shadow Caster" pass.
    // Although we haven't explicitly done so in this shader, if these passes are missing they will be read from a fallback
    // shader instead, so specify one here to import the collector/caster passes used in that fallback.
    Fallback "VertexLit"
}

















