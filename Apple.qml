import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Extras 2.0

GameEntity {
    id:root
    property alias positon: transform.translation
    property alias color: material.diffuse

    Transform{
        id:transform
        scale:0.5
    }

    Mesh{
        id:mesh
        source:"models/apple.obj"
    }

    DiffuseMapMaterial{
        id:material
        diffuse: "qrc:/models/apple-texture.png"
    }

    components: [material,mesh,transform]
}
