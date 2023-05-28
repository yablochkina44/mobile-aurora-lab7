import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1




Page {
    id: page


    Column
    {
        anchors.fill: parent
        anchors.margins: Theme.paddingMedium
        spacing: Theme.paddingMedium
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
        TimerItem {
            id: clock
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Button
        {
           // width: parent.width / 2
            text: "Старт"
            onClicked: clock.start()
            anchors.horizontalCenter: parent.horizontalCenter

        }
        Button
        {
            //width: parent.width / 2
            text: "Стоп"
            onClicked: clock.stop()
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Button
        {

            text: "chek"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: clock.chek()


        }






            }
        }



