Shader "Unlit/Sun"
{
	Properties
	{
		_Color("Color",Color) = (1,1,1,1)
	}

	SubShader
	{
		Pass
		{
			CGPROGRAM

			#pragma vertex vert	
			#pragma fragment frag

			#include "UnityCG.cginc"

			float4 _Color;
				
	        struct appdata
	        {
			   float4 vertex : POSITION;
	           float2 uv : TEXCOORD0;

	        };

			struct v2f {
				float4 vertex : SV_POSITION;
			    float2 uv : TEXCOORD0;
			};

			v2f vert(appdata v) {
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = v.uv;
				return o;
			}

			fixed4 frag(v2f IN) :SV_TARGET{
				float4 col = _Color;
				return col;
			}

			ENDCG
        }
	}
}
