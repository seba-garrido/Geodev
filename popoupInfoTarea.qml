/* Copyright 2020 Esri
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */


// You can run your app in Qt Creator by pressing Alt+Shift+R.
// Alternatively, you can run apps through UI using Tools > External > AppStudio > Run.
// AppStudio users frequently use the Ctrl+A and Ctrl+I commands to
// automatically indent the entirety of the .qml file.

///////////////// Info Tarea //////////////////

import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.3

import ArcGIS.AppFramework 1.0
//import Esri.ArcGISRuntime 100.6

App {
    id: app
    width: 1500
    height: 800

//////////////////////////////// Rectangulo gris ////////////////////////////////////////////

    Rectangle {
        id: rectangulo_negro
        width: 1366
        height: 768
        color: "dimgrey"
        x: (app.width-rectangulo_negro.width)/2
        y: (app.height-rectangulo_negro.height)/2


//////////////////////////////// Rectangulo Blanco ////////////////////////////////////////////

        Rectangle {
            width: 500
            height: 411
            color: "#FFFFFF"
            y: 179
            x: 433
            radius: 6

//////////////////////////////// Texto 1 ////////////////////////////////////////////

            Text {
                id: texto1
                width: 173
                height: 20
                text: qsTr("Información de Tarea")
                font.pixelSize: 17
                font.family: "inter"
                x: 21
                y: 21
                opacity: 1
            }

//////////////////////////////// Texto 2 ////////////////////////////////////////////

            Text {
                id: texto2
                width: 54
                height: 19
                text: qsTr("Equipo: ")
                font.pixelSize: 15
                font.family: "inter"
                color: "#000000"
                x: 21
                y: 70
                opacity: 1
            }

//////////////////////////////// Texto 3 ////////////////////////////////////////////

            Text {
                id: texto3
                width: 45
                height: 19
                text: qsTr("Tarea: ")
                font.pixelSize: 15
                font.family: "inter"
                color: "#000000"
                x: 265
                y: 70
                opacity: 1
            }

//////////////////////////////// Texto 4 ////////////////////////////////////////////

            Text {
                id: texto4
                width: 63
                height: 19
                text: qsTr("TOR-102")
                font.pixelSize: 15
                font.family: "inter"
                color: "#000000"
                x: 21
                y: 91
                opacity: 0.64
            }

//////////////////////////////// Texto 5 ////////////////////////////////////////////

            Text {
                id: texto5
                width: 164
                height: 19
                text: qsTr("Estado de Cable Aéreo")
                font.pixelSize: 15
                font.family: "inter"
                color: "#000000"
                x: 265
                y: 91
                opacity: 0.64
            }

//////////////////////////////// Texto 6 ////////////////////////////////////////////

            Text {
                id: texto6
                width: 90
                height: 19
                text: qsTr("Origen Tarea: ")
                font.pixelSize: 15
                font.family: "inter"
                color: "#000000"
                x: 21
                y: 129
                opacity: 1
            }

//////////////////////////////// Texto 7 ////////////////////////////////////////////

            Text {
                id: texto7
                width: 117
                height: 19
                text: qsTr("Pauta de Preuso")
                font.pixelSize: 15
                font.family: "inter"
                color: "#000000"
                x: 21
                y: 150
                opacity: 0.64
            }

//////////////////////////////// Menu 1 ////////////////////////////////////////////

            ComboBox {
                id: primero
                width: 214
                height: 38
                opacity: 1
                x: 265
                y: 131
                model: [ "Constitución", "Opcion 1", "Opcion 2", "Opcion 3" ]
            }

//////////////////////////////// Menu 2 ////////////////////////////////////////////

            ComboBox {
                id: segundo
                width: 214
                height: 38
                opacity: 1
                x: 21
                y: 190
                model: [ "1-CIMA-A", "Opcion 1", "Opcion 2", "Opcion 3" ]
            }

//////////////////////////////// Menu 3 ////////////////////////////////////////////

            ComboBox {
                id: tercero
                width: 214
                height: 38
                opacity: 1
                x: 265
                y: 190
                model: [ "No Asignado", "Opcion 1", "Opcion 2", "Opcion 3" ]
            }

           Rectangle{
                id: cuadro1
                width: 214
                height: 79
                border.color: "#D2D5DA"
                x: 21
                y: 249
                radius: 3
                ScrollView{
                    id: scroll
                    width: 213
                    height: 87
                    clip: true
                    TextArea{
                        id: textarea1
                        anchors.fill: cuadro1.width
                        textMargin: 1
                        placeholderText: "  Observación:"
                        width: 50
                        height: 87
                        x:5

                    }
                }


            }



            Rectangle{
                id: cuadro2
                width: 214
                height: 79
                border.color: "#D2D5DA"
                x: 263
                y: 249
                radius: 3
                ScrollView{
                    id: scroll2
                    width: 213
                    height: 87
                    x:1
                    TextArea{
                        id: textarea2
                        placeholderText: "  Motivo:"
                        width: 200
                        height: 87
                        x: 5
                    }

                }


            }



//////////////////////////////// Boton 1 ////////////////////////////////////////////

            Button {
                id: boton
                width: 214
                height: 38
                onClicked: iniciar(primero.text, segundo.text, tercero.text, cuarto.text, quinto.text)

                Text {
                    id: user
                    text: qsTr("RECHAZAR")
                    color: "#646161"
                    font.pixelSize: 14
                    font.family: "Inter-semibold"
                    width: 80
                    height: 17
                    y: 11
                    x: 67
                    horizontalAlignment: Text.AlignHCenter

                }
                background: Rectangle {
                    color: "#E0E0E0"
                    radius: 3
                    opacity: 1
                    width: 214
                    height: 38
                }
                y:351
                x:21

            }

//////////////////////////////// Boton 2 ////////////////////////////////////////////

            Button {
                id: boton2
                width: 214
                height: 38
                onClicked: iniciar(primero.text, segundo.text, tercero.text, cuarto.text, quinto.text)

                Text {
                    id: user2
                    text: qsTr("GUARDAR CAMBIO")
                    color: "#FFFFFF"
                    font.pixelSize: 14
                    font.family: "Inter-semibold"
                    width: 134
                    height: 17
                    x: 40
                    y: 11
                    horizontalAlignment: Text.AlignHCenter


                }
                background: Rectangle {
                    color: "#F28623"
                    radius: 3
                    opacity: 1
                    width: 214
                    height: 38
                }
                y:351
                x:261

            }

        }
    }
}

