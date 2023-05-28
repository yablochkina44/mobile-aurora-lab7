import QtQuick 2.0
import Sailfish.Silica 1.0

//Создать QML компонент со свойством по умолчанию, который берет значение свойства text
//любого объявленного внутри него объекта и создает Button с тем же текстом.
//Добавить возможность задавать цвет кнопки при объявлении компонента.



Page {
    id: page

    Column
    {
        PageHeader {
                    id : pheader
                    objectName: "pageHeader"
                    title: qsTr("11111111")
                    titleColor: "white"
                }
        width: parent.width
        Page5item
        {

            Label
            {
                text: "Red Button"
            }
            width: parent.width
            color: "red"
        }
    }
}
