import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    // 3. Создать приложение, отображающее строку текста вверху экрана.
    // При нажатии на текст он должен плавно перемещаться вниз экрана, поворачивать на 180 градусов и менять цвет.
    // Когда нажатие прекращается, он должен так же плавно возвращаться в исходное положение.
    Column {
        id: column

        width: page.width
        spacing: Theme.paddingLarge
        PageHeader {
                    id : pheader
                    objectName: "pageHeader"
                    title: qsTr("11111111")
                    titleColor: "white"
                }
        PageHeader {
                    id : pheader2
                    objectName: "pageHeader"
                    title: qsTr("11111111")
                    titleColor: "white"
                }

        Label
        {
            id: label
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Hello world!"
            font.pixelSize: Theme.fontSizeExtraLarge
            state: "StartState"

            property var currentY
            property var currentRotation
            property var currentColor

            states: [
                State
                {
                    name: "Pressed"

                    PropertyChanges
                    {
                        target: label
                        y: 900
                        rotation: 180
                        color: "blue"
                    }
                },
                State
                {
                    name: "Released"
                    PropertyChanges {
                        target: label
                        y: label.currentY
                        rotation: label.currentRotation
                        color: label.currentColor
                    }
                },
                State
                {
                    name: "StartState"
                    PropertyChanges {
                        target: label
                        y: 0
                        rotation: 0
                        color: "red"
                    }
                }

            ]

            Timer // таймер нужен для того, чтобы запускать функцию onTriggered.
                  // менять состояние из Transition нельзя, а, запуская таймер, функция-триггер срабатывает минимум через interval
            {
                id: timer
                interval: 0
                repeat: false
                onTriggered: {
                    label.state = "StartState"
                }
            }

            transitions: [
                Transition
                {
                    to: "Pressed"
                    SequentialAnimation
                    {
                        NumberAnimation
                        {
                            properties: "y,rotation"
                            duration: 3000
                        }
                    }
                    ColorAnimation {
                        duration: 3000
                    }
                    onRunningChanged: {
                        if (!running)
                        {
                            label.currentY = label.y
                            label.currentRotation = label.rotation
                            label.currentColor = label.color
                        }
                    }
                },
                Transition {
                    to: "Released"
                    SequentialAnimation
                    {
                        ScriptAction
                        {
                            script: timer.start()
                        }
                    }
                },
                Transition
                {
                    to: "StartState"
                    NumberAnimation
                    {
                        properties: "y,rotation"
                        duration: 3000
                    }
                    ColorAnimation {
                        duration: 3000
                    }
                }

            ]
            MouseArea
            {
                anchors.fill: label
                onPressed: label.state = "Pressed"
                onReleased: label.state = "Released"
            }
        }
    }
}
