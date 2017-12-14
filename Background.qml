import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Extras 2.0

Entity {
    id:root

    property alias positon: transform.translation
    property alias scale3D: transform.scale3D

    MaterialBackgound{
        id:material
    }

    CuboidMesh{
        id:mesh
    }

    Transform{
        id:transform
    }

    components: [material,mesh,transform]
}
