import QtQuick 2.13
import QtQuick.Layouts 1.13
import QtQuick.Controls 2.13
import QtQuick.Controls.Material 2.13

Page {
    id: page
    width: 1600
    height: 700
////////////////////////////   Rectangulo Gris    /////////////////////////////////////
    Rectangle {
        id: gris
        width: 1366
        height: 768
        x:(page.width-gris.width)/2
        y:(page.height-gris.height)/2
        color: "#F5F6FA"
    }

////////////////////////////   Rectangulo Login    /////////////////////////////////////

    Rectangle {
        anchors.centerIn: gris
        id: cuadro_gris
        width: 1000
        height: 500
        color: "white"
        x:(page.width-gris.width)/2
        y:(page.height-gris.height)/2
        radius: 6
        border.color: "#00000029"

////////////////////////////   Imagen    /////////////////////////////////////

        Image {
            id: image
            source: "bosque2.png"
            width: 555
            height: 500
            x:445
        }

        /*Text {
            id: texto5
            text: qsTr("Arauco ")
            y:(cuadro_gris.height/2)-250
            x:((cuadro_gris.width)/2)+280
            font.pointSize: 80
            font.family: "Brush Script MT"
            color: "white"
        }*/

////////////////////////////   Textos    /////////////////////////////////////

        Text {
            id: texto1
            text: qsTr("Ingreso")
            y:104
            x:92
            font.pixelSize: 27
            horizontalAlignment: left
            font.family: "Inter"
            width: 96
            height: 33
            color: "#000000"
            opacity: 1
        }

        Text {
            id: texto2
            text: qsTr("Control de Mantenimiento")
            y:136
            x:92
            font.pixelSize: 15
            horizontalAlignment: left
            font.family: "Inter"
            color: "#636E80"
            width: 186
            height: 19
            opacity: 1
        }

////////////////////////////   Login Usuario     /////////////////////////////////////

        Text {
            id: texto3
            text: qsTr("Email: ")
            y:179.5
            x:92.5
            font.pixelSize: 12
            horizontalAlignment: left
            font.family: "Inter"
            color: "#242424"
            width: 34
            height: 15
            opacity: 1

        }

        Rectangle{
            width: 279.8
            height: 40
            radius: 3
            border.color: "#D2D5DA"
            opacity: 1
            y: 199.5
            x: 91.5

            TextField {
                id: usuario
                placeholderText: qsTr("john.doe@arauco.com")
                font.pixelSize: 12
                color: "#242424"
                opacity: 0.5
                y:0
                x:15.5
                width: 264.3
                height: 48
            }


        }

        /*TextField {
            id: usuario
            placeholderText: qsTr("john.doe@arauco.com")
            y:212
            x:107
            font.pixelSize: 12
            horizontalAlignment: left
            font.family: "Inter"
            width: 127
            height: 15
            color: "#242424"
            opacity: 0.5
            background: Rectangle {
                implicitWidth: 279.8
                implicitHeight: 40
                radius: 1
                border.color: "#D2D5DA"
                border.width: 1
                y: -13.5
                x: -15.5
                opacity: 1
            }
        }*/
////////////////////////////   Login Passowrd     /////////////////////////////////////

        Text {
            id: texto4
            text: qsTr("Password: ")
            y:263.5
            x:92.5
            font.pixelSize: 12
            horizontalAlignment: left
            font.family: "Inter"
            width: 60
            height: 15
            color: "#242424"
            opacity: 1
        }
        TextField {
            id: password
            placeholderText: qsTr("•••••••••••••")
            font.pixelSize: 12
            color: "#242424"
            opacity: 0.5
            y:296
            x:107
            width: 88
            height: 15
            background: Rectangle {
                implicitWidth: 279.8
                implicitHeight: 40
                radius: 1
                border.color: "#D2D5DA"
                border.width: 1
                y: -13.5
                x: -15.5
            }
        }
////////////////////////////   Boton  Ingresar  /////////////////////////////////////

        Button {
            id: boton
            width: 279
            height: 40
            onClicked: iniciar(usuario.text,password.text)
            opacity: 1
            y:348
            x:92

            Text {
                id: user
                text: qsTr("INGRESAR")
                color: "white"
                font.pixelSize: 12
                anchors.centerIn: boton
                width: 68
                height: 15
                y: 361
                x: 201

            }
            background: Rectangle {
                opacity: 1
                color: "#F28600"
                radius: 3
                border.color: "#C17313"
            }
        }

////////////////////////////   Boton Ocultar    /////////////////////////////////////

       /* Button {

            y:(cuadro_gris.height/2)-15
            x:((cuadro_gris.width+75)/2)-260
            width: 20
            height: 30
            highlighted : true


            onClicked: oculta(password)
            background: Rectangle {
                opacity: 2
                color: "light grey"
                radius: 1
                border.color: "#C17313"

            }
            }*/

    }

    function oculta(password){
        if (password.echoMode===TextInput.Normal){
            password.echoMode=TextInput.Password

        }
        else{
            password.echoMode=TextInput.Normal

        }
    }

}
