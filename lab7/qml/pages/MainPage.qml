import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    property int stackDepth
    property int pushPages : 0
    property int popPages : 0

    Component.onCompleted:
    {
        pageStack.onDepthChanged.connect(onDepthChangedMy)
    }

    function onDepthChangedMy() {

            if(stackDepth > pageStack.depth)
            {
                popPages++;
            }
            else
            {
                pushPages++;
            }

        stackDepth = pageStack.depth
        console.log("Добавлено страниц: " + pushPages);
        console.log("Удалено страниц: " + popPages);
    }

    Column {
        PageHeader {
                    id : pheader
                    objectName: "pageHeader"
                    title: qsTr("11111111")
                    titleColor: "white"
                }
        anchors.fill: parent
        anchors.margins: Theme.paddingMedium
        spacing: Theme.paddingMedium
        Button {
           y: 200
           x: 100
           id: button1
           text: qsTr("1")
           onClicked: pageStack.push(Qt.resolvedUrl("Page1.qml"))
           backgroundColor: "white"
           color: "black"
        }
        Button {
           y: 200
           x: 100
           id: button2
           text: qsTr("2")
           onClicked: pageStack.push(Qt.resolvedUrl("Page2.qml"))
           backgroundColor: "white"
           color: "black"
        }
        Button {
           y: 200
           x: 100
           id: button3
           text: qsTr("3")
           onClicked: pageStack.push(Qt.resolvedUrl("Page3.qml"))
           backgroundColor: "white"
           color: "black"
        }
        Button {
           y: 200
           x: 100
           id: button4
           text: qsTr("4")
           onClicked: pageStack.push(Qt.resolvedUrl("Page4.qml"))
           backgroundColor: "white"
           color: "black"
        }
        Button {
           y: 200
           x: 100
           id: button5
           text: qsTr("5")
           onClicked: pageStack.push(Qt.resolvedUrl("Page5.qml"))
           backgroundColor: "white"
           color: "black"
        }
        Button {
           y: 200
           x: 100
           id: button6
           text: qsTr("6")
           onClicked: pageStack.push(Qt.resolvedUrl("Page6.qml"))
           backgroundColor: "white"
           color: "black"
        }
    }
}
