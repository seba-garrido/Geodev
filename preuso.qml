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
import ArcGIS.AppFramework.Sql 1.0
//import Esri.ArcGISRuntime 100.6

App {
    id: app
    width: 1600
    height: 800

    property FileFolder sqlFolder: AppFramework.userHomeFolder.folder("ArcGIS/Data/Sql")
    property SqlTableModel sqlTableModel
    property string fecha: '1657123200000'

    SqlDatabase{
        id: db
        databaseName: sqlFolder.filePath("BD_CIMA7.sqlite")
    }
    Component.onCompleted: {
        loadPreuso()
    }

    Rectangle{
        id: rectangulo_gris
        width: 1366
        height: 768
        color: "dimgrey"
        radius: 3
        x: (app.width-rectangulo_gris.width)/2
        y: (app.height-rectangulo_gris.height)/2

        Rectangle{
            id: rectangulo_blanco
            width: 762
            height: 450
            color: "white"
            radius: 3
            x: (rectangulo_gris.width-rectangulo_blanco.width)/2
            y: (rectangulo_gris.height-rectangulo_blanco.height)/2



                        ComboBox {
                            id: menu1
                            width: (rectangulo_blanco.width-42)/6
                            height: 40
                            opacity: 1
                            x: 21
                            y: 42
                            model: [ "Zona","Opcion 1", "Opcion 2", "Opcion 3" ]
                        }

                        ComboBox {
                            id: menu2
                            width: (rectangulo_blanco.width-42)/6
                            height: 40
                            opacity: 1
                            x: 181
                            y: 42
                            model: [ "Linea","Opcion 1", "Opcion 2", "Opcion 3" ]
                        }

                        ComboBox {
                            id: menu3
                            width: (rectangulo_blanco.width-42)/6
                            height: 40
                            opacity: 1
                            x: 341
                            y: 42
                            model: [ "Equipo","Opcion 1", "Opcion 2", "Opcion 3" ]
                        }

                        ComboBox {
                            id: menu4
                            width: (rectangulo_blanco.width-42)/6
                            height: 40
                            opacity: 1
                            x: 501
                            y: 42
                            model: [ "Fecha","Opcion 1", "Opcion 2", "Opcion 3" ]
                        }

                        Rectangle{
                            id: rango_fecha
                            width: ((rectangulo_blanco.width-42)/6)*3
                            height: 40
                            x: (rectangulo_blanco.width-rango_fecha.width)/2
                            y: 96.5
                            radius: 3
                            border.color: "dimgrey"

                            Text {
                                id: fecha
                                width: rango_fecha/4
                                height: 20
                                text: qsTr("Rango de Fechas")
                                font.pixelSize: 16
                                x: (rango_fecha.width-fecha.width)/2
                                y: (rango_fecha.height-fecha.height)/2

                            }

                            Rectangle{
                                id: rec_flecha_der
                                width: 25
                                height: 20
                                x: rango_fecha.width-30
                                y: (rango_fecha.height-rec_flecha_der.height)/2
                                Button{

                                    width: 25
                                    height: 20
                                    background: Rectangle{
                                        opacity: 2
                                        radius: 5
                                    }

                                    Image {
                                        id: flecha_der
                                        source: "flecha_derecha.png"
                                        width: 20
                                        height: 20
                                    }
                                }

                            }

                            Rectangle{
                                id: rec_flecha_izq
                                width: 25
                                height: 20
                                x: rango_fecha.x-190
                                y: (rango_fecha.height-rec_flecha_der.height)/2
                                Button{

                                    width: 25
                                    height: 20
                                    background: Rectangle{
                                        opacity: 2
                                        radius: 5
                                    }

                                    Image {
                                        id: flecha_izq
                                        source: "flecha_izquierda.png"
                                        width: 20
                                        height: 20
                                    }
                                }

                            }
                        }

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

                                Image {
                                    id: close
                                    source: "close.jpg"
                                    width: 25
                                    height: 25
                                }
                            }

                        }

///////////////////// Tabla de informacion //////////////////////////////

                   /* Rectangle{
                        id: cuadro
                        width: rectangulo_blanco.width-42
                        height: 251
                        x: 21
                        y: 151
                        color: "white"*/

            ///////////////////// Header //////////////////////////////



                            Rectangle{
                                id: cuadro1
                                width: (rectangulo_blanco.width-42)/8
                                height: 40
                                opacity: 1
                                color: "black"
                                x:21
                                y:151
                                Text {
                                    id: opcion1
                                    width: (rectangulo_blanco.width-42)/8
                                    text: qsTr("Equipos")
                                    color: "white"
                                    font.pixelSize: 13
                                    anchors.verticalCenter: cuadro1.verticalCenter
                                    //anchors.horizontalCenter: cuadro1.horizontalCenter
                                    x: 30
                                }

                            }

                            Rectangle{
                                id: cuadro2
                                width: (rectangulo_blanco.width-42)/8
                                height: 40
                                opacity: 1
                                color: "black"
                                x: cuadro1.x+(rectangulo_blanco.width-42)/8
                                y: 151
                                Text {
                                    id: opcion2
                                    width: (rectangulo_blanco.width-42)/8
                                    text: qsTr("Lunes")
                                    color: "white"
                                    font.pixelSize: 13
                                    anchors.verticalCenter: cuadro2.verticalCenter
                                    //anchors.horizontalCenter: cuadro1.horizontalCenter
                                    x: 30

                                }

                            }

                            Rectangle{
                                id: cuadro3
                                width: (rectangulo_blanco.width-42)/8
                                height: 40
                                opacity: 1
                                color: "black"
                                x: cuadro1.x+((rectangulo_blanco.width-42)/8)*2
                                y: 151
                                Text {
                                    id: opcion3
                                    width: (rectangulo_blanco.width-42)/8
                                    text: qsTr("Martes")
                                    color: "white"
                                    font.pixelSize: 13
                                    anchors.verticalCenter: cuadro3.verticalCenter
                                    //anchors.horizontalCenter: cuadro1.horizontalCenter
                                    x: 30

                                }

                            }

                            Rectangle{
                                id: cuadro4
                                width: (rectangulo_blanco.width-42)/8
                                height: 40
                                opacity: 1
                                color: "black"
                                x: cuadro1.x+((rectangulo_blanco.width-42)/8)*3
                                y: 151
                                Text {
                                    id: opcion4
                                    width: (rectangulo_blanco.width-42)/8
                                    text: qsTr("Miercoles")
                                    color: "white"
                                    font.pixelSize: 13
                                    anchors.verticalCenter: cuadro4.verticalCenter
                                    //anchors.horizontalCenter: cuadro1.horizontalCenter
                                    x: 25

                                }

                            }

                            Rectangle{
                                id: cuadro5
                                width: (rectangulo_blanco.width-42)/8
                                height: 40
                                opacity: 1
                                color: "black"
                                x: cuadro1.x+((rectangulo_blanco.width-42)/8)*4
                                y: 151
                                Text {
                                    id: opcion5
                                    width: (rectangulo_blanco.width-42)/8
                                    text: qsTr("Jueves")
                                    color: "white"
                                    font.pixelSize: 13
                                    anchors.verticalCenter: cuadro5.verticalCenter
                                    //anchors.horizontalCenter: cuadro1.horizontalCenter
                                    x: 30

                                }

                            }

                            Rectangle{
                                id: cuadro6
                                width: (rectangulo_blanco.width-42)/8
                                height: 40
                                opacity: 1
                                color: "black"
                                x: cuadro1.x+((rectangulo_blanco.width-42)/8)*5
                                y: 151
                                Text {
                                    id: opcion6
                                    width: (rectangulo_blanco.width-42)/8
                                    text: qsTr("Viernes")
                                    color: "white"
                                    font.pixelSize: 13
                                    x: 30
                                    anchors.verticalCenter: cuadro6.verticalCenter
                                    //anchors.horizontalCenter: cuadro1.horizontalCenter

                                }

                            }

                            Rectangle{
                                id: cuadro7
                                width: (rectangulo_blanco.width-42)/8
                                height: 40
                                opacity: 1
                                color: "black"
                                x: cuadro1.x+((rectangulo_blanco.width-42)/8)*6
                                y: 151
                                Text {
                                    id: opcion7
                                    width: (rectangulo_blanco.width-42)/8
                                    text: qsTr("Sabado")
                                    color: "white"
                                    font.pixelSize: 13
                                    x: 30
                                    anchors.verticalCenter: cuadro7.verticalCenter
                                    //anchors.horizontalCenter: cuadro1.horizontalCenter

                                }

                            }

                            Rectangle{
                                id: cuadro8
                                width: (rectangulo_blanco.width-42)/8
                                height: 40
                                opacity: 1
                                color: "black"
                                x: cuadro1.x+((rectangulo_blanco.width-42)/8)*7
                                y: 151
                                Text {
                                    id: opcion8
                                    width: (rectangulo_blanco.width-42)/8
                                    text: qsTr("Domingo")
                                    color: "white"
                                    font.pixelSize: 13
                                    x: 20
                                    anchors.verticalCenter: cuadro8.verticalCenter
                                    //anchors.horizontalCenter: cuadro1.horizontalCenter

                                }

                            }







            ///////////////////// Barra de scroll //////////////////////////////

                        ScrollView {
                            ScrollBar.horizontal.interactive: false
                            width: (rectangulo_blanco.width-42)
                            height: 211
                            x: 21
                            y: 191

            ///////////////////// Tabla de informacion //////////////////////////////

                            ListView {
                                    id: list
                                    model: listModelPreuso
                                    width: (rectangulo_blanco.width-42)/8
                                    height: 30
                                    clip: true
                                    delegate:   Rectangle {
                                                    color: index%2 == 0 ? "white" : "whitesmoke";
                                                    width: (rectangulo_blanco.width-42) ;
                                                    height: 30

            ///////////////////// Primera columna //////////////////////////////

                                                        Rectangle {
                                                            id: uno
                                                            y:10
                                                            x:20
                                                            Text {
                                                                text: qsTr(equipo)
                                                                font.pixelSize: 14

                                                            }

                                                        }

            ///////////////////// Segunda columna //////////////////////////////

                                                        Rectangle {
                                                            y:10
                                                            x:uno.x+(rectangulo_blanco.width-42)/8
                                                            /*Text {
                                                                font.pixelSize: 14
                                                                text: epoch(getLunes())
                                                            }*/
                                                            Rectangle{
                                                                x: 20
                                                                y: -5
                                                                Button{

                                                                    width: 20
                                                                    height: 20
                                                                    background: Rectangle{
                                                                        width: 0.1
                                                                        height: 0.1
                                                                        opacity: 2
                                                                        radius: 5
                                                                        x: 10
                                                                        color: "black"
                                                                    }

                                                                    Image {
                                                                        id: col1
                                                                        source: alertaIcon(lunes)
                                                                        width: 20
                                                                        height: 20
                                                                    }
                                                                }

                                                            }
                                                        }

            ///////////////////// Tercera columna //////////////////////////////

                                                        Rectangle {
                                                            y:10
                                                            x:uno.x+((rectangulo_blanco.width-42)/8)*2
                                                            /*Text {
                                                                font.pixelSize: 14
                                                                text: qsTr("Opcion 3")
                                                            }*/
                                                            Rectangle{
                                                                x: 20
                                                                y: -5
                                                                Button{

                                                                    width: 20
                                                                    height: 20
                                                                    background: Rectangle{
                                                                        width: 0.5
                                                                        height: 0.5
                                                                        opacity: 0.1
                                                                        radius: 5
                                                                        x: 7
                                                                        y: 40
                                                                        color: "black"
                                                                    }

                                                                    Image {
                                                                        id: col2
                                                                        source: alertaIcon(martes)
                                                                        width: 20
                                                                        height: 20
                                                                    }
                                                                }

                                                            }
                                                        }

            ///////////////////// Cuarta columna //////////////////////////////

                                                        Rectangle {
                                                            y:10
                                                            x:uno.x+((rectangulo_blanco.width-42)/8)*3
                                                            /*Text {
                                                                font.pixelSize: 14
                                                                text: qsTr("Opcion 4")
                                                            }*/
                                                            Rectangle{
                                                                x: 20
                                                                y: -5
                                                                Button{

                                                                    width: 20
                                                                    height: 20
                                                                    background: Rectangle{
                                                                        width: 10
                                                                        height: 5
                                                                        opacity: 2
                                                                        radius: 5
                                                                        x: 5
                                                                        color: "white"
                                                                    }

                                                                    Image {
                                                                        id: col3
                                                                        source: alertaIcon(miercoles)
                                                                        width: 20
                                                                        height: 20
                                                                    }
                                                                }

                                                            }
                                                        }

            ///////////////////// Quinta columna //////////////////////////////

                                                        Rectangle {
                                                            y:10
                                                            x:uno.x+((rectangulo_blanco.width-42)/8)*4
                                                            Button{

                                                                width: 20
                                                                height: 20
                                                                background: Rectangle{
                                                                    width: 10
                                                                    height: 5
                                                                    opacity: 2
                                                                    radius: 5
                                                                    x: 20
                                                                    color: "white"
                                                                }

                                                                Image {
                                                                    id: col4
                                                                    source: alertaIcon(jueves)
                                                                    width: 20
                                                                    height: 20
                                                                    x: 20
                                                                }
                                                            }
                                                       }

            ///////////////////// Sexta columna //////////////////////////////

                                                        Rectangle {
                                                            y:10
                                                            x:uno.x+((rectangulo_blanco.width-42)/8)*5
                                                            Button{

                                                                width: 20
                                                                height: 20
                                                                background: Rectangle{
                                                                    width: 10
                                                                    height: 5
                                                                    opacity: 2
                                                                    radius: 5
                                                                    x: 20
                                                                    color: "white"
                                                                }

                                                                Image {
                                                                    id: col5
                                                                    source: alertaIcon(viernes)
                                                                    width: 20
                                                                    height: 20
                                                                    x: 20
                                                                }
                                                            }

                                                }

            ///////////////////// Septima columna //////////////////////////////

                                                        Rectangle {
                                                            y:10
                                                            x:uno.x+((rectangulo_blanco.width-42)/8)*6
                                                            Button{

                                                                width: 20
                                                                height: 20
                                                                background: Rectangle{
                                                                    width: 10
                                                                    height: 5
                                                                    opacity: 2
                                                                    radius: 5
                                                                    x: 20
                                                                    color: "white"
                                                                }

                                                                Image {
                                                                    id: col6
                                                                    source: alertaIcon(sabado)
                                                                    width: 20
                                                                    height: 20
                                                                    x: 20
                                                                }
                                                            }

                                                }

//////////////////////////// Octava Columna /////////////////////////

                                                        Rectangle {
                                                            y:10
                                                            x:uno.x+((rectangulo_blanco.width-42)/8)*7
                                                            Button{

                                                                width: 20
                                                                height: 20
                                                                background: Rectangle{
                                                                    width: 10
                                                                    height: 5
                                                                    opacity: 2
                                                                    radius: 5
                                                                    x: 20
                                                                    color: "white"
                                                                }

                                                                Image {
                                                                    id: col7
                                                                    source: alertaIcon(domingo)
                                                                    width: 20
                                                                    height: 20
                                                                    x: 20
                                                                }
                                                            }

                                                }

                                        }
                                }

                        }

        }
    }

    function epoch (date) {
          //return Date.parse(date)
            var result = date.valueOf()
            return result
        }

    function alerta_random (){
        var min = Math.ceil(1);
        var max = Math.floor(4);
        var numero = Math.floor(Math.random() * (max - min) + min)

        if(numero == 1){
            return "check.png"
        }
        if(numero == 2){
            return "x.png"
        }
        if(numero == 3){
            return "alerta.png"
        }


    }
    function alertaIcon (numero){

        if(numero > 0){
            return "x.png"
        }
        if(numero === 0){
            return "check.png"
        }
        if(numero === 2){
            return "alerta.png"
        }


    }

    function getLunes(fecha) {
          const date = new Date(fecha);
          const today = date.getDate();
          const currentDay = date.getDay();
          const newDate = date.setDate(today - currentDay + 1);
          return new Date(newDate).valueOf();
        }
        function getMartes() {
          const date = new Date();
          const today = date.getDate();
          const currentDay = date.getDay();
          const newDate = date.setDate(today - currentDay + 2);
          return new Date(newDate);
        }
        function getMiercoles() {
          const date = new Date();
          const today = date.getDate();
          const currentDay = date.getDay();
          const newDate = date.setDate(today - currentDay + 3);
          return new Date(newDate);
        }
        function getJueves() {
          const date = new Date();
          const today = date.getDate();
          const currentDay = date.getDay();
          const newDate = date.setDate(today - currentDay + 4);
          return new Date(newDate);
        }
        function getViernes() {
          const date = new Date();
          const today = date.getDate();
          const currentDay = date.getDay();
          const newDate = date.setDate(today - currentDay + 5);
          return new Date(newDate);
        }
        function getSabado() {
          const date = new Date();
          const today = date.getDate();
          const currentDay = date.getDay();
          const newDate = date.setDate(today - currentDay + 6);
          return new Date(newDate);
        }
        function getDomingo() {
          const date = new Date();
          const today = date.getDate();
          const currentDay = date.getDay();
          const newDate = date.setDate(today - currentDay + 7);
          return new Date(newDate);
        }

    ListModel{
        id: listModelPreuso
    }

    function loadPreuso(){
        db.open()

        let q1 = db.query("SELECT equipo, (SELECT count(temp_preuso.equipo) FROM temp_preuso WHERE temp_preuso.equipo = app_equipo.equipo AND temp_preuso.fecha = '"+getLunes(fecha)+"') AS lunes FROM app_equipo")
        let q2 = db.query("SELECT equipo, (SELECT count(temp_preuso.equipo) FROM temp_preuso WHERE temp_preuso.equipo = app_equipo.equipo AND temp_preuso.fecha = '"+fecha+"') AS martes FROM app_equipo")
        let q3 = db.query("SELECT equipo, (SELECT count(temp_preuso.equipo) FROM temp_preuso WHERE temp_preuso.equipo = app_equipo.equipo AND temp_preuso.fecha = '"+fecha+"') AS miercoles FROM app_equipo")
        let q4 = db.query("SELECT equipo, (SELECT count(temp_preuso.equipo) FROM temp_preuso WHERE temp_preuso.equipo = app_equipo.equipo AND temp_preuso.fecha = '"+fecha+"') AS jueves FROM app_equipo")
        let q5 = db.query("SELECT equipo, (SELECT count(temp_preuso.equipo) FROM temp_preuso WHERE temp_preuso.equipo = app_equipo.equipo AND temp_preuso.fecha = '"+fecha+"') AS viernes FROM app_equipo")
        let q6 = db.query("SELECT equipo, (SELECT count(temp_preuso.equipo) FROM temp_preuso WHERE temp_preuso.equipo = app_equipo.equipo AND temp_preuso.fecha = '"+fecha+"') AS sabado FROM app_equipo")
        let q7 = db.query("SELECT equipo, (SELECT count(temp_preuso.equipo) FROM temp_preuso WHERE temp_preuso.equipo = app_equipo.equipo AND temp_preuso.fecha = '"+fecha+"') AS domingo FROM app_equipo")


        for (let ok = q1.first();ok;ok = q1.next() ){

            listModelPreuso.append({
                                       "equipo":q1.values.equipo,
                                       "lunes":q1.values.lunes,
                                   })
        }

        for (let ok2 = q2.first();ok2;ok2 = q2.next() ){

            listModelPreuso.append({
                                       "equipo":q2.values.equipo,
                                       "martes":q2.values.martes,
                                   })
        }
        for (let ok3 = q3.first();ok3;ok3 = q3.next() ){

            listModelPreuso.append({
                                       "equipo":q3.values.equipo,
                                       "miercoles":q3.values.miercoles,
                                   })
        }
        for (let ok4 = q4.first();ok4;ok4 = q4.next() ){

            listModelPreuso.append({
                                       "equipo":q4.values.equipo,
                                       "jueves":q4.values.jueves,
                                   })
        }
        for (let ok5 = q5.first();ok5;ok5 = q5.next() ){

            listModelPreuso.append({
                                       "equipo":q5.values.equipo,
                                       "viernes":q5.values.viernes,
                                   })
        }
        for (let ok6 = q6.first();ok6;ok6 = q6.next() ){

            listModelPreuso.append({
                                       "equipo":q6.values.equipo,
                                       "sabado":q6.values.sabado,
                                   })
        }
        for (let ok7 = q7.first();ok7;ok7 = q7.next() ){

            listModelPreuso.append({
                                       "equipo":q7.values.equipo,
                                       "domingo":q7.values.domingo,
                                   })
        }


    }

}
