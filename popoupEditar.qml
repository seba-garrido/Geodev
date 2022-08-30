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
import QtQuick.Controls 2.13
import ArcGIS.AppFramework 1.0
//import Esri.ArcGISRuntime 100.6

///////////////////// Editar Tarea ////////////////////////

App {
    id: app
    width: 1600
    height: 800

/////////////////////// Rectangulo Gris //////////////////////////////
    Rectangle {
        id: rectangulo_gris
        width: 1376
        height: 768
        color: "dimgrey"
        radius: 3
        x: (app.width-rectangulo_gris.width)/2
        y: (app.height-rectangulo_gris.height)/2

/////////////////////// Rectangulo Blanco //////////////////////////////

        Rectangle {
            id: rectangulo_blanco
            width: 1000
            height: 500
            color: "white"
            x: (rectangulo_gris.width-rectangulo_blanco.width)/2
            y: (rectangulo_gris.height-rectangulo_blanco.height)/2

            Rectangle{
                x: rectangulo_blanco.width-40
                y: 20
                Button{

                    width: 15
                    height: 25
                    background: Rectangle{
                        opacity: 2
                        radius: 5
                    }
                    //onClicked:
                    Image {
                        id: close
                        source: "close.png"
                        width: 25
                        height: 25
                    }
                }

            }

/////////////////////// Cuadro 1 //////////////////////////////

            Rectangle {
                id: rectangulo_1
                width: 130
                height: 40
                radius: 3
                border.color: "#D2D5DA"
                x: 42
                y: 42

                Text {
                    id: texto1
                    text: qsTr("Equipo")
                    width: 120
                    height: 20
                    font.pixelSize: 17
                    x: 40
                    y: 8
                    //anchors.fill: rectangulo_1
                }
            }

/////////////////////// Cuadro 2 //////////////////////////////

            Rectangle {
                id: rectangulo_2
                width: 130
                height: 40
                radius: 3
                border.color: "#D2D5DA"
                x: 202
                y: 42

                Text {
                    id: texto2
                    text: qsTr("Tarea")
                    width: 120
                    height: 20
                    font.pixelSize: 17
                    x: 40
                    y: 8
                    //anchors.fill: rectangulo_1
                }
            }

/////////////////////// Cuadro 3 //////////////////////////////

            Rectangle {
                id: rectangulo_3
                width: 130
                height: 40
                radius: 3
                border.color: "#D2D5DA"
                x: 362
                y: 42

                Text {
                    id: texto3
                    text: qsTr("Horas")
                    width: 120
                    height: 20
                    font.pixelSize: 17
                    x: 40
                    y: 8
                    //anchors.fill: rectangulo_1
                }
            }


///////////////////// Tabla de informacion //////////////////////////////

             Rectangle{
                 id: cuadro
                 width: 450
                 height: 251
                 x: 21
                 y: 120
                 color: "white"

///////////////////// Header //////////////////////////////

              Rectangle{
                 id: header_negro
                            width: 450
                            height: 40
                            radius: 1
                            opacity: 1
                            color: "black"
                            x: 21


                            Text {
                                id: opcion1
                                width: 60
                                text: qsTr("Producto")
                                color: "white"
                                font.pixelSize: 15
                                x: 30
                                y: 13
                            }
                            Text {
                                id: opcion2
                                width: 60
                                text: qsTr("Cantidad")
                                color: "white"
                                font.pixelSize: 15
                                x: 140
                                y: 13

                            }
                            Text {
                                id: opcion3
                                width: 60
                                text: qsTr("Medida")
                                color: "white"
                                font.pixelSize: 15
                                x: 250
                                y: 13
                            }
                            Text {
                                id: opcion4
                                width: 60
                                text: qsTr("Precio")
                                color: "white"
                                font.pixelSize: 15
                                x: 360
                                y: 13
                            }

                        }

            ///////////////////// Barra de scroll //////////////////////////////

                        ScrollView {
                            ScrollBar.horizontal.interactive: false
                            width: 450
                            height: 211
                            clip: true
                            y: 40
                            x: 21

            ///////////////////// Tabla de informacion //////////////////////////////

                            ListView {
                                    model: 10
                                    width: 90
                                    height: 30
                                    delegate:   Rectangle {
                                                    color: index%2 == 0 ? "white" : "whitesmoke";
                                                    width: 450 ;
                                                    height: 30

            ///////////////////// Primera columna //////////////////////////////

                                                        Rectangle {
                                                            y:10
                                                            x:60
                                                            Text {
                                                                text: qsTr("a")
                                                                font.pixelSize: 14
                                                            }
                                                        }

            ///////////////////// Segunda columna //////////////////////////////

                                                        Rectangle {
                                                            y:10
                                                            x:170
                                                            Text {
                                                                text: qsTr("b")
                                                            }
                                                        }

            ///////////////////// Tercera columna //////////////////////////////

                                                        Rectangle {
                                                            y:10
                                                            x:270
                                                            Text {
                                                                text: qsTr("c")
                                                            }
                                                        }

            ///////////////////// Cuarta columna //////////////////////////////

                                                        Rectangle {
                                                            y:10
                                                            x:380
                                                            Text {
                                                                text: qsTr("d")
                                                            }
                                                        }

                                        }
                                }

                        }
                    }

/////////////////////// Cuadro de Busqueda 1 //////////////////////////////
             Rectangle {
                 id: rectangulo_busqueda
                 width: 445
                 height: 212
                 //color: "black"
                 x: 516
                 y: 120
                 radius: 3
                 border.color: "#D2D5DA"

                 TextField {
                     id :busqueda
                     width: 445
                     height: 40
                     placeholderText: ("                            Ingrese texto a buscar")
                     clip: true
                     anchors.fill: parent.fill
                     anchors.bottom:observacion.height-20
                     focus: true
                     wrapMode: TextEdit.Wrap
                 }


                 ScrollView {
                     ScrollBar.horizontal.interactive: false
                     width: 444
                     height: 180
                     clip: true
                     y: 31
                     x: 1


     ///////////////////// Tabla de informacion //////////////////////////////

                     ListView {
                             model: 9
                             width: 442
                             height: 160
                             y: 31
                             x: 1
                             delegate:   Rectangle {
                                             color: index%2 == 0 ? "whitesmoke" : "white";
                                             width: 442 ;
                                             height: 30

     ///////////////////// Primera columna //////////////////////////////

                                                 Rectangle {
                                                     y:10
                                                     x:30
                                                     Text {
                                                         text: qsTr(" Texto indice "+index)
                                                         font.pixelSize: 14
                                                     }
                                                 }

                                             }
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
                                        text: qsTr("CANCELAR")
                                        color: "#646161"
                                        font.pixelSize: 14
                                        font.family: "Inter-semibold"
                                        width: 104
                                        height: 17
                                        y: 11
                                        x: 67

                                    }
                                    background: Rectangle {
                                        color: "#E0E0E0"
                                        radius: 3
                                        opacity: 1
                                        width: 214
                                        height: 38
                                    }
                                    y:430
                                    x:516

                                }

                    ///////////////////// Boton Naranjo //////////////////////////////

                            Button {
                                id: boton2
                                width: 214
                                height: 38
                                onClicked: iniciar(primero.text, segundo.text, tercero.text, cuarto.text, quinto.text)

                                Text {
                                    id: textboton2
                                    text: qsTr("GUARDAR")
                                    color: "#FFFFFF"
                                    font.pixelSize: 14
                                    //anchors.centerIn: boton2
                                    font.family: "Inter-semibold"
                                    width: 104
                                    height: 17
                                    y: 11
                                    x: 67

                                }
                                background: Rectangle {
                                    color: "#F28623"
                                    radius: 3
                                    opacity: 1
                                    width: 214
                                    height: 38
                                }
                                y:430
                                x:750

                            }


        }

    }
}
