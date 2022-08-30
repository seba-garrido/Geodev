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


import QtQuick 2.13
import Qt.labs.qmlmodels 1.0
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import ArcGIS.AppFramework 1.0
//import Esri.ArcGISRuntime 100.6

App {
    id: app
    width: 1600
    height: 750


    Rectangle{
        id: cuadro_gris
        width: 1366
        height: 768
        color: "dimgrey"
        x:(app.width-cuadro_gris.width)/2
        y:(app.height-cuadro_gris.height)/2

        Rectangle{
            id: card
            width: 805
            height: 600
            color: "#FFFFFF"
            radius: 6
            opacity: 1
            x:(cuadro_gris.width-card.width)/2
            y:(cuadro_gris.height-card.height)/2

///////////////////// Texto //////////////////////////////

            Text {
                id: texto
                text: qsTr("Crear Nueva OT")
                width: 180
                height: 20
                color: "#000000"
                font.pixelSize: 17
                font.family: "inter"
                opacity: 1
                x: 21
                y: 21

            }

///////////////////// Primero //////////////////////////////

        ComboBox {
            id: primero
            width: 264
            height: 38
            opacity: 1
            x: 21
            y: 78
            model: [ "Mantenedor", "Opcion 1", "Opcion 2", "Opcion 3" ]
        }




///////////////////// Segundo //////////////////////////////

        ComboBox {
            id: segundo
            width: 264
            height: 38
            opacity: 1
            x: 520
            y: 78
            model: [ "Fecha","Opcion 1", "Opcion 2", "Opcion 3" ]
        }

///////////////////// Tercero  //////////////////////////////

        ComboBox {
            id: tercero
            width: 264
            height: 38
            opacity: 1
            x: 21
            y: 136
            model: [ "Prioridad","Opcion 1", "Opcion 2", "Opcion 3" ]
        }


///////////////////// Cuarto //////////////////////////////

        ComboBox {
            id: cuarto
            width: 264
            height: 38
            opacity: 1
            x: 520
            y: 136
            model: [ "Tiempo Asignado","Opcion 1", "Opcion 2", "Opcion 3" ]
        }


///////////////////// Quinto //////////////////////////////

        ComboBox {
            id: quinto
            width: 763
            height: 38
            opacity: 1
            x: 21
            y: 194
            model: [ "Formulario Survey123", "Inspección Técnica", "Mantención Diaria", "Mantención Programado", "Reparación...", "Reparación Programado" ]

        }



///////////////////// Tabla de informacion //////////////////////////////

        Rectangle{
            id: cuadro
            width: 758
            height: 251
            x: 21
            y: 251
            color: "white"

///////////////////// Header //////////////////////////////

                Row{
                    spacing: 20
                }

                Rectangle{
                    id: cuadro1
                    width: 109
                    height: 40
                    opacity: 1
                    color: "black"
                    Text {
                        id: opcion1
                        width: 110
                        text: qsTr("Tarea")
                        color: "white"
                        font.pixelSize: 13
                        anchors.verticalCenter: cuadro1.verticalCenter
                        //anchors.horizontalCenter: cuadro1.horizontalCenter
                        x: 40
                    }

                }

                Rectangle{
                    id: cuadro2
                    width: 110
                    height: 40
                    opacity: 1
                    color: "black"
                    x: 109
                    Text {
                        id: opcion2
                        width: 110
                        text: qsTr("Equipo")
                        color: "white"
                        font.pixelSize: 13
                        anchors.verticalCenter: cuadro2.verticalCenter
                        //anchors.horizontalCenter: cuadro1.horizontalCenter
                        x: 40

                    }

                }

                Rectangle{
                    id: cuadro3
                    width: 109
                    height: 40
                    opacity: 1
                    color: "black"
                    x: 218
                    Text {
                        id: opcion3
                        width: 110
                        text: qsTr("Linea")
                        color: "white"
                        font.pixelSize: 13
                        anchors.verticalCenter: cuadro3.verticalCenter
                        //anchors.horizontalCenter: cuadro1.horizontalCenter
                        x: 40

                    }

                }

                Rectangle{
                    id: cuadro4
                    width: 109
                    height: 40
                    opacity: 1
                    color: "black"
                    x: 327
                    Text {
                        id: opcion4
                        width: 110
                        text: qsTr("Fecha")
                        color: "white"
                        font.pixelSize: 13
                        anchors.verticalCenter: cuadro4.verticalCenter
                        //anchors.horizontalCenter: cuadro1.horizontalCenter
                        x: 40

                    }

                }

                Rectangle{
                    id: cuadro5
                    width: 109
                    height: 40
                    opacity: 1
                    color: "black"
                    x: 436
                    Text {
                        id: opcion5
                        width: 110
                        text: qsTr("Insumos")
                        color: "white"
                        font.pixelSize: 13
                        anchors.verticalCenter: cuadro5.verticalCenter
                        //anchors.horizontalCenter: cuadro1.horizontalCenter
                        x: 40

                    }

                }

                Rectangle{
                    id: cuadro6
                    width: 109
                    height: 40
                    opacity: 1
                    color: "black"
                    x: 545
                    Text {
                        id: opcion6
                        width: 110
                        text: qsTr("Tarea Completada")
                        color: "white"
                        font.pixelSize: 13
                        anchors.verticalCenter: cuadro6.verticalCenter
                        //anchors.horizontalCenter: cuadro1.horizontalCenter

                    }

                }


                Rectangle{
                    id: cuadro7
                    width: 109
                    height: 40
                    opacity: 1
                    color: "black"
                    x: 654
                    Text {
                        id: opcion7
                        width: 110
                        text: qsTr("Rechazar Tarea")
                        color: "white"
                        font.pixelSize: 13
                        anchors.verticalCenter: cuadro7.verticalCenter
                        x: 10

                    }

                }



                /*Text {
                    id: opcion3
                    width: 110
                    text: qsTr("Linea")
                    color: "white"
                    font.pixelSize: 13
                    x: opcion1.width+opcion2.width
                    y: 13
                }
                Text {
                    id: opcion4
                    width: 60
                    text: qsTr("Fecha")
                    color: "white"
                    font.pixelSize: 13
                    x: opcion1.width+opcion2.width+opcion3.width
                    y: 13
                }
                Text {
                    id: opcion5
                    width: 60
                    text: qsTr("Insumos")
                    color: "white"
                    font.pixelSize: 13
                    x: opcion1.width+opcion2.width+opcion3.width+opcion4.width
                    y: 13
                }
                Text {
                    id: opcion6
                    width: 60
                    text: qsTr("Tarea Completada")
                    color: "white"
                    font.pixelSize: 13
                    x: opcion1.width+opcion2.width+opcion3.width+opcion4.width+opcion5.width
                    y: 13
                }
                Text {
                    id: opcion7
                    width: 60
                    text: qsTr("Rechazar Tarea")
                    color: "white"
                    font.pixelSize: 13
                    x: opcion1.width+opcion2.width+opcion3.width+opcion4.width+opcion6.width
                    y: 13
                }*/



///////////////////// Barra de scroll //////////////////////////////

            ScrollView {
                ScrollBar.horizontal.interactive: false
                width: 763
                height: 211
                y: 40

///////////////////// Tabla de informacion //////////////////////////////

                ListView {
                        model: 15
                        width: 109
                        height: 30
                        clip: true
                        delegate:   Rectangle {
                                        color: index%2 == 0 ? "white" : "whitesmoke";
                                        width: 763 ;
                                        height: 30

///////////////////// Primera columna //////////////////////////////

                                            Rectangle {
                                                id: uno
                                                y:10
                                                x:20
                                                Text {
                                                    text: qsTr("Opcion 1")
                                                    font.pixelSize: 14

                                                }
                                            }

///////////////////// Segunda columna //////////////////////////////

                                            Rectangle {
                                                y:10
                                                x:120
                                                Text {
                                                    font.pixelSize: 14
                                                    text: qsTr("Opcion 2")
                                                }
                                            }

///////////////////// Tercera columna //////////////////////////////

                                            Rectangle {
                                                y:10
                                                x:210
                                                Text {
                                                    font.pixelSize: 14
                                                    text: qsTr("Opcion 3")
                                                }
                                            }

///////////////////// Cuarta columna //////////////////////////////

                                            Rectangle {
                                                y:10
                                                x:300
                                                Text {
                                                    font.pixelSize: 14
                                                    text: qsTr("Opcion 4")
                                                }
                                            }

///////////////////// Quinta columna //////////////////////////////

                                            Rectangle {
                                                y:10
                                                x:390
                                                Text {
                                                    font.pixelSize: 14
                                                    text: qsTr("Opcion 5")
                                                }
                                           }

///////////////////// Sexta columna //////////////////////////////

                                            Rectangle {
                                                y:10
                                                x:480
                                                Text {
                                                    font.pixelSize: 14
                                                    text: qsTr("Opcion 6")
                                                }

                                    }

///////////////////// Septima columna //////////////////////////////

                                            Rectangle {
                                                y:10
                                                x:565
                                                Text {
                                                    font.pixelSize: 14
                                                    text: qsTr("Opcion 7")
                                                }

                                    }

///////////////////// Octava columna //////////////////////////////

                                            Rectangle {
                                                y:10
                                                x:674
                                                Text {
                                                    font.pixelSize: 14
                                                    text: qsTr("Opcion 8")
                                                }

                                    }
                            }
                    }

            }
        }

///////////////////// Boton aviso //////////////////////////////

        Button {

                   y:545
                   x:22

                   onClicked: oculta(password)
                   background: Rectangle {
                       width: 15
                       height: 15
                       opacity: 1
                       color: "light grey"
                       radius: 1
                       border.color: "#D2D5DA"

                   }
                   }

///////////////////// Texto 2 //////////////////////////////

        Text {
            id: texto2
            text: qsTr("OT requiere aprobación")
            width: 160
            height: 16
            x: 46
            y: 550
            font.pixelSize: 13
            font.family: "inter"
        }
        Text {
            id: arroba
            text: qsTr("*")
            color: "red"
            x: 185
            y: 550
            font.family: "inter"
            font.pixelSize: 13
        }

///////////////////// Boton Naranjo //////////////////////////////

        Button {
            id: boton
            width: 214
            height: 38
            onClicked: iniciar(primero.text, segundo.text, tercero.text, cuarto.text, quinto.text)

            Text {
                id: user
                text: qsTr("CREAR ORDEN")
                color: "#FFFFFF"
                font.pixelSize: 14
                anchors.centerIn: boton
                font.family: "Inter-semibold"
                width: 104
                height: 17
                y: 11
                x: 55

            }
            background: Rectangle {
                color: "#F28623"
                radius: 3
                opacity: 1
                width: 214
                height: 38
            }
            y:540
            x:570

        }

        }


    }
}
