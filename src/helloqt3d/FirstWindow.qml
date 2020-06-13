import QtQuick 2.15
import QtQuick.Scene3D 2.15
import Qt3D.Core 2.15
import Qt3D.Render 2.15

Item{
    //创建3d场景嵌入到QtQuick
    Scene3D {
        id: scene3d
        anchors.fill: parent
        anchors.margins: 20
        //实体Entity是一个Node子类，可以聚合几个Component3D实例来指定其行为
        //根实体
        Entity {
            //RenderSettings组件必须为场景根实体的组件。
            //它指定渲染策略和选择设置，并托管活动的FrameGraph
            RenderSettings {
                //相当于glClearColor
                activeFrameGraph: ClearBuffers {
                    buffers: ClearBuffers.ColorBuffer
                    clearColor: Qt.rgba(0.0,0.5,0.0,1.0)
                    RenderSurfaceSelector {
                        // Default render output: window surface
                    }
                }
            }
        }
    }
    Text {
        anchors.centerIn: parent
        text: "First Window"
    }
}
