import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "./src"

//需要引入的模块
//QT += qml quick
//QT += 3dcore 3drender 3dinput 3dlogic 3dextras 3dquick 3danimation
//我使用的桌面OpenGL，对于Qt版本和OpenGL版本请自行修改
//我再main.cpp中设置了全局字体
Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello Qt3D")
    Component.onCompleted: {
        console.log("QQ交流群：647637553")
    }

    HomePage{
        id: homePage
        visible: true
        anchors.fill: parent
    }
    LoaderPage{
        id:loaderPage
        visible:!homePage.visible
        anchors.fill: parent
    }
}
