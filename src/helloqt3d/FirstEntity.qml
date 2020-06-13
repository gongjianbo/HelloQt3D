import QtQuick.Scene3D 2.15
import Qt3D.Core 2.15
import Qt3D.Render 2.15
import Qt3D.Input 2.15
import Qt3D.Extras 2.15
import Qt3D.Logic 2.15

//创建3d场景嵌入到QtQuick
Scene3D {
    //自动宽高比
    cameraAspectRatioMode: Scene3D.AutomaticAspectRatio
    aspects: ["logic", "input"]

    //实体Entity是一个Node子类，可以聚合几个Component3D实例来指定其行为
    //根实体
    Entity {
        id: root
        //相机
        Camera {
            id: camera
            //透视投影
            projectionType: CameraLens.PerspectiveProjection
            fieldOfView: 45
            nearPlane: 0.1
            farPlane: 1000.0
            position: Qt.vector3d(0.0, 0.0, 10.0)
            upVector: Qt.vector3d(0.0, 1.0, 0.0)
            viewCenter: Qt.vector3d(0.0, 0.0, 0.0)
        }
        //用于控制相机
        OrbitCameraController {
            // 鼠标左键按下，沿x轴或y轴拖动时，移动相机位置
            // 鼠标右键按下，沿x轴或y轴拖动时，控制相机偏转
            camera: camera
        }
        //必须将RenderSettings组件设置为场景根实体的组件。
        //它指定渲染策略和选择设置，并托管活动的FrameGraph
        RenderSettings {
            //正向渲染。逐个光源计算的一种渲染方式。
            activeFrameGraph: ForwardRenderer {
                camera: camera
                clearColor: Qt.rgba(0.0, 0.3, 0.0, 1.0)
            }
        }
        //必须将InputSettings组件设置为场景根实体的组件。
        //它存储一个指向对象的指针，该对象充当各种输入类要处理的输入事件的源。
        InputSettings{
        }

        //物体Node
        Entity {
            PhongMaterial {
                id: material
                //环境光
                ambient: "gray"
                //漫反射光
                diffuse: "orange"
                //镜面高光
                specular: "yellow"
                //高光半径
                shininess:32

            }
            /*CuboidMesh {
                id: cube
            }
            Transform {
                id: trans
                matrix: {
                    let m = Qt.matrix4x4();
                    //旋转下角度，默认正视的看不出效果
                    m.rotate(45, Qt.vector3d(1, 1, 0))
                    return m;
                }
            }
            components: [material, cube, trans]*/
            Entity{
                id: sub1
                CuboidMesh {
                    id: cube1
                    xExtent: 2
                    zExtent: 2
                }
                Transform {
                    id: trans1
                    matrix: {
                        let m = Qt.matrix4x4();
                        //矩形旋转下角度，默认正视的看不出效果
                        m.rotate(45, Qt.vector3d(1, 1, 0))
                        return m;
                    }
                }
                components: [cube1, trans1,material]
            }
            Entity{
                id:sub2
                SphereMesh {
                    id: ball2
                    //半径默认为1
                    radius: 1
                    //网格环数
                    rings: 2
                    //网格切片数
                    slices: 10
                }
                Transform {
                    id: trans2
                    matrix: {
                        let m = Qt.matrix4x4();
                        //和另一个mesh错开位置
                        m.translate(Qt.vector3d(3, 0, 0))
                        return m;
                    }
                }
                components: [ball2, trans2,material]
            }
        }
    }
}
