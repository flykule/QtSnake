import Qt3D.Core 2.0
import Qt3D.Render 2.0

Material {
    id:material

   parameters:  [
        Parameter {
            name: "score"
            value: score
        },

        Parameter {
            name: "resolution"
            value: Qt.vector2d(window.width, window.height)
        },

        Parameter {
            name: "diffuseTexture"
            value: Texture2D {
                id: diffuseTexture
                minificationFilter: Texture.LinearMipMapLinear
                magnificationFilter: Texture.Linear

                wrapMode {
                    x: WrapMode.Repeat
                    y: WrapMode.Repeat
                }
                generateMipMaps: true
                maximumAnisotropy: 16.0
                TextureImage {
                    source: "qrc:/images/grass.jpg"
                }
            }
        }
    ]

    effect: Effect {
        property string vertex: "qrc:/shaders/gl3/grass.vert"
        property string fragment: "qrc:/shaders/gl3/grass.frag"
        property string vertexES: "qrc:/shaders/es2/grass.vert"
        property string fragmentES: "qrc:/shaders/es2/grass.frag"

        FilterKey {
            id: forward
            name: "renderingStyle"
            value: "forward"
        }
        ShaderProgram {
            id: gl3Shader
            vertexShaderCode: loadSource(parent.vertex)
            fragmentShaderCode: loadSource(parent.fragment)
        }
        ShaderProgram {
            id: esShader
            vertexShaderCode: loadSource(parent.vertexES)
            fragmentShaderCode: loadSource(parent.fragmentES)
        }

        AlphaCoverage { id: alphaCoverage }

        DepthTest {
            id: depth
            depthFunction: DepthTest.Less }

        techniques: [
            // OpenGL 3.1
            Technique {
                filterKeys: [ forward ]
                graphicsApiFilter {
                    api: GraphicsApiFilter.OpenGL
                    profile: GraphicsApiFilter.CoreProfile
                    majorVersion: 3
                    minorVersion: 2
                }
                renderPasses: RenderPass {
                    shaderProgram: gl3Shader
//                    renderStates: [alphaCoverage ]
                }
            },

            // OpenGLES 2.0
            Technique {
                filterKeys: [ forward ]
                graphicsApiFilter {
                    api: GraphicsApiFilter.OpenGLES
                    majorVersion: 2
                    minorVersion: 0
                }
                renderPasses: RenderPass {
                    shaderProgram: esShader
//                    renderStates: [ alphaCoverage ]
                }
            },

            // OpenGL ES 2
            Technique {
                filterKeys: [ forward ]
                graphicsApiFilter {
                    api: GraphicsApiFilter.OpenGLES
                    profile: GraphicsApiFilter.NoProfile
                    majorVersion: 2
                    minorVersion: 0
                }
                renderPasses: RenderPass {
                    shaderProgram: esShader
//                    renderStates: [ alphaCoverage ]
                }
            }
        ]
    }
}

