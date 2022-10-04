Shader "BandeiraJapao"
{
    Properties
    {
        _MainTex("Texture", 2D) = "white" {}
    }
        SubShader
    {
        Tags { "RenderType" = "Opaque" }
        LOD 100



       Pass
        {
           HLSLPROGRAM
              #pragma vertex vert
              #pragma fragment frag
              #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
              //#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"

              struct Attributes
              {
                  float4  position :POSITION;
                  float2  uv       :TEXCOORD0;
                  //half3 normal : NORMAL;
                  //half4 color : COLOR0;
              };



             struct Varyings
             {
                  float4 positionVAR : SV_POSITION;
                  float2  uvVAR      :TEXCOORD0;
                  //half4 color : COLOR;
             };



             Varyings vert(Attributes Input)
             {
                 Varyings Output;

                 Output.positionVAR = TransformObjectToHClip(Input.position.xyz);
                 Output.uvVAR = Input.uv;

                 //Light l = GetMainLight();

                 //float intensity = dot(l.direction, TransformObjectToWorldNormal(Input.normal));
                 //Output.color = Input.color* intensity;



                 //Output.positionVAR = Input.position;
                 return Output;
             }
             float4 frag(Varyings Input) :SV_TARGET
             {
                //float4 color = Input.color;

                float x = length(float2(Input.uvVAR.x*1.73,Input.uvVAR.y) - float2(0.85,0.5));
                float4 color = float4(1,1,1,1);
                if ( x < 0.3)
                {
                    color = float4(1, 0, 0, 1);

                }

                //else
                //{
                //    color = float4(1, 1, 1, 1);
                //
                //}


                return color;


             }

            ENDHLSL
        }
    }
}
