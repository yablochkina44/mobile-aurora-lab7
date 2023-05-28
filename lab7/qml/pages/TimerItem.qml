import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1


Item {
    id: clock
    width: label.width*6
    height: label.height*6
    property int seconds: 0
    property int minutes: 0
    property int hours: 0
    Timer
    {
        id: timer
        interval: 1
        repeat: true
        onTriggered: {
            seconds++
            minutes = (seconds / 60) % 60
            hours = (minutes / 60) % 24
        }
    }

    function start()
    {
        clock.seconds = 0;
        timer.start();
    }

    function stop()
    {
        timer.stop();
    }
    function chek()
    {
       //time1.text=hours + ":" + minutes + ":" + seconds % 60
        notesListModel.append({h: hours, m: minutes, s:seconds})
    }

    Label
       {
           id: label
           text: hours + ":" + minutes + ":" + seconds % 60
           anchors.horizontalCenter: parent.horizontalCenter
       }

    SilicaListView {

                    width: parent.width;
                    height: 800
                    anchors.left: parent.left

                    //header: PageHeader { title: "Список" }
                    model: ListModel
                    { id: notesListModel }
                        delegate: ListItem
                        {
                            Label
                            {

                                text:h + ":" + m + ":" + s % 60
                            }
                        }


                    }
                }








