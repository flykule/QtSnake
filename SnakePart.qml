import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Extras 2.0

GameEntity {
    id:root

    property alias positon: transform.translation

    PhongMaterial{
        id:material
        diffuse: "green"
    }

    CuboidMesh{
        id:mesh
    }

    Transform{
        id:transform
    }

    components: [material,mesh,transform]
}
