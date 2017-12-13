import Qt3D.Core 2.0

GameEntity {
    id:root
    property alias position: transform.translation

    Transform{
        id:transform
    }

    components: [transform]
}
