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
import ".."
import ArcGIS.AppFramework 1.0
import ArcGIS.AppFramework.Sql 1.0
//import Esri.ArcGISRuntime 100.6

App {
    id: app
    width: 1600
    height: 800

    property FileFolder sqlFolder: AppFramework.userHomeFolder.folder("ArcGIS/Data/Sql")
    property SqlTableModel sqlTableModel
    property string fecha: '27/08/2022'

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

            Row {
                id: rowFilters
                y: 0
                x: 21
                spacing: 30

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
                            id: comboboxFechaInicio
                            width: (rectangulo_blanco.width-42)/6
                            height: 40
                            opacity: 1
                            x: 501
                            y: 42

                            displayText: "Todas"
                            textRole: "etiqueta"

                            model: ListModel {
                                ListElement {
                                    etiqueta: "Todas"
                                    inicio: ""
                                    termino: ""
                                }
                                ListElement {
                                    etiqueta: "Personalizada"
                                    inicio: ""
                                    termino: ""
                                }
                            }

                            onActivated: {

                                if (comboboxFechaInicio.currentText === "Todas") {
                                    comboboxFechaInicio.displayText = "Todas"
                                    comboboxFechaInicio.currentIndex = 0
                                    filter(comboboxZona.currentText,
                                           comboboxLinea.currentText,
                                           comboboxActividad.currentText,
                                           comboboxEquipo.currentText,
                                           comboboxMantenedores.currentText,
                                           comboboxFechaInicio.currentText, "FechaTermino",
                                           "Todos") // filter(zona,linea,actividad,equipo,mantenedor,fechaInicio,fechaTermino,origen)
                                }
                                if (comboboxFechaInicio.currentText === "Personalizada") {

                                    comboboxFechaInicio.displayText = "Personalizada"
                                    comboboxFechaInicio.currentIndex = 1

                                    datePickerInicio.set(new Date().toLocaleString(
                                                             Qt.locale("es_CL"), "yyyy-MM-dd"))
                                    datePickerTermino.set(new Date().toLocaleString(
                                                              Qt.locale("es_CL"), "yyyy-MM-dd"))

                                    popupDatePicker.open()
                                }
                            }
                        }
        }

                        Popup {
                            id: popupDatePicker

                            anchors.centerIn: parent
                            focus: true
                            modal: true

                            width: 600
                            height: 500

                            Column {
                                anchors.fill: parent

                                spacing: 100

                                Row {
                                    anchors.fill: parent
                                    anchors.topMargin: 20
                                    height: 100
                                    Column {
                                        width: parent.width

                                        Text {

                                            text: "Seleccione un Rango de Fecha"
                                            font.pixelSize: 20
                                            anchors.centerIn: parent
                                        }
                                    }
                                }
                                Row {
                                    anchors.fill: parent
                                    anchors.topMargin: 100
                                    spacing: 50
                                    Column {
                                        DatePicker {
                                            id: datePickerInicio
                                            width: 250
                                            height: 250
                                        }
                                    }
                                    /*Column {

                                        DatePicker {
                                            id: datePickerTermino
                                            width: 250
                                            height: 250
                                        }
                                    }*/
                                }
                                Row {
                                    anchors.fill: parent
                                    anchors.topMargin: 350

                                    Button {
                                                        id: buttonPopupFiltrar
                                                        text: qsTr("FILTRAR")
                                                        anchors.centerIn: parent

                                                        contentItem: Text {
                                                            text: buttonPopupFiltrar.text
                                                            font: buttonPopupFiltrar.font
                                                            color: "white"
                                                            horizontalAlignment: Text.AlignHCenter
                                                            verticalAlignment: Text.AlignVCenter
                                                            elide: Text.ElideRight
                                                        }

                                                        background: Rectangle {
                                                            implicitWidth: 214
                                                            implicitHeight: 38
                                                            color: "#F28623"
                                                            radius: 3
                                                            opacity: 1
                                                        }
                                                        onClicked: {
                                                            fechaInicioPicker = datePickerInicio.get()
                                                            fechaTerminoPicker = datePickerTermino.get()

                                                            filter(comboboxZona.currentText,
                                                                   comboboxLinea.currentText,
                                                                   comboboxActividad.currentText,
                                                                   comboboxEquipo.currentText,
                                                                   comboboxMantenedores.currentText,
                                                                   comboboxFechaInicio.currentText, "FechaTermino",
                                                                   "Todos") // filter(zona,linea,actividad,equipo,mantenedor,fechaInicio,fechaTermino,origen)

                                                            popupDatePicker.close()
                                                        }
                                                    }
                                }
                            }
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
                                text: getLunes()
                                color: "black"
                                font.pixelSize: 14
                                x: 100
                                y: (rango_fecha.height-fecha.height)/2
                            }
                            Text {
                                id: guion
                                text: qsTr("---")
                                x: 175
                                y: (rango_fecha.height-fecha.height)/2+1
                            }
                            Text {
                                id: fecha2
                                width: rango_fecha/4
                                height: 20
                                text: getDomingo()
                                color: "black"
                                font.pixelSize: 14
                                x: 200
                                y: (rango_fecha.height-fecha.height)/2
                            }

                            Rectangle{
                                id: rec_flecha_der
                                width: 25
                                height: 20
                                x: rango_fecha.width-30
                                y: (rango_fecha.height-rec_flecha_der.height)/2
                                Button{
                                    onClicked: cambiarFecha(fecha, 7)
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
                                    onClicked: cambiarFecha(fecha, -7)
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
                                    source: "close.png"
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
                                    x: 30
                                    y: 5
                                }
                                Text {
                                    id: fecha_cuadro2
                                    text: getLunes(fecha)
                                    color: "white"
                                    font.pixelSize: 12
                                    x: 25
                                    y: 20
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
                                    x: 30
                                    y: 5
                                }
                                Text {
                                    id: fecha_cuadro3
                                    text: getMartes(fecha)
                                    color: "white"
                                    font.pixelSize: 12
                                    x: 25
                                    y: 20
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
                                    x: 25
                                    y: 5
                                }
                                Text {
                                    id: fecha_cuadro4
                                    text: getMiercoles(fecha)
                                    color: "white"
                                    font.pixelSize: 12
                                    x: 25
                                    y: 20
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
                                    x: 30
                                    y: 5
                                }
                                Text {
                                    id: fecha_cuadro5
                                    text: getJueves(fecha)
                                    color: "white"
                                    font.pixelSize: 12
                                    x: 25
                                    y: 20
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
                                    y: 5
                                }
                                Text {
                                    id: fecha_cuadro6
                                    text: getViernes(fecha)
                                    color: "white"
                                    font.pixelSize: 12
                                    x: 25
                                    y: 20
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
                                    y: 5
                                }
                                Text {
                                    id: fecha_cuadro7
                                    text: getSabado(fecha)
                                    color: "white"
                                    font.pixelSize: 12
                                    x: 25
                                    y: 20
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
                                    y: 5
                                }
                                Text {
                                    id: fecha_cuadro8
                                    text: getDomingo(fecha)
                                    color: "white"
                                    font.pixelSize: 12
                                    x: 20
                                    y: 20
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
                                                                        source: alertaIcon(lunes_preuso, lunes_noconf)
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
                                                                        source: alertaIcon(martes_preuso, martes_noconf)
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
                                                                        source: alertaIcon(miercoles_preuso, miercoles_noconf)
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
                                                                    source: alertaIcon(jueves_preuso, jueves_noconf)
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
                                                                    source: alertaIcon(viernes_preuso, viernes_noconf)
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
                                                                    source: alertaIcon(sabado_preuso, sabado_noconf)
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
                                                                    source: alertaIcon(domingo_preuso, domingo_noconf)
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


    function cambiarFecha(fecha, dias){
      fecha.setDate(fecha.getDate() + dias);
      return fecha;
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
    function alertaIcon (numero, noconf){

        if(numero > 0){
            if(noconf === 0){
                return "check.jpg"
            }
            else{
                return "x.jpg"
            }

          //return "x.jpg"
        }
        if(numero === 0){
            return "alerta.jpg"
        }
        /*if(numero === 2){
            return "alerta.jpg"
        }*/


    }

    function getLunes(fecha) {
          //const date = new Date(parseInt(fecha)).toLocaleString(Qt.locale("es_CL"),"dd-MM-yyyy")
          const date = new Date();
          const today = date.getDate();
          const currentDay = date.getDay();
          const newDate = date.setDate(today - currentDay + 1);
          var lunes = new Date(newDate * 1000);
          var year = date.getFullYear();
          var month = date.getMonth() + 1;
          var day = date.getDate();
          var lunes_final = `${day}/${month}/${year}`;
          return lunes_final;
        }
        function getMartes() {
          const date = new Date();
          const today = date.getDate();
          const currentDay = date.getDay();
          const newDate = date.setDate(today - currentDay + 2);
          var martes = new Date(newDate * 1000);
          var year = date.getFullYear();
          var month = date.getMonth() + 1;
          var day = date.getDate();
          var martes_final = `${day}/${month}/${year}`;
          return martes_final;
        }
        function getMiercoles() {
          const date = new Date();
          const today = date.getDate();
          const currentDay = date.getDay();
          const newDate = date.setDate(today - currentDay + 3);
          var miercoles = new Date(newDate * 1000);
          var year = date.getFullYear();
          var month = date.getMonth() + 1;
          var day = date.getDate();
          var miercoles_final = `${day}/${month}/${year}`;
          return miercoles_final;
        }
        function getJueves() {
          const date = new Date();
          const today = date.getDate();
          const currentDay = date.getDay();
          const newDate = date.setDate(today - currentDay + 4);
          var jueves = new Date(newDate * 1000);
          var year = date.getFullYear();
          var month = date.getMonth() + 1;
          var day = date.getDate();
          var jueves_final = `${day}/${month}/${year}`;
          return jueves_final;
        }
        function getViernes() {
          const date = new Date();
          const today = date.getDate();
          const currentDay = date.getDay();
          const newDate = date.setDate(today - currentDay + 5);
          var viernes = new Date(newDate * 1000);
          var year = date.getFullYear();
          var month = date.getMonth() + 1;
          var day = date.getDate();
          var viernes_final = `${day}/${month}/${year}`;
          return viernes_final;
        }
        function getSabado() {
          const date = new Date();
          const today = date.getDate();
          const currentDay = date.getDay();
          const newDate = date.setDate(today - currentDay + 6);
          var sabado = new Date(newDate * 1000);
          var year = date.getFullYear();
          var month = date.getMonth() + 1;
          var day = date.getDate();
          var sabado_final = `${day}/${month}/${year}`;
          return sabado_final;
        }
        function getDomingo() {
          const date = new Date();
          const today = date.getDate();
          const currentDay = date.getDay();
          const newDate = date.setDate(today - currentDay + 7);
          var domingo = new Date(newDate * 1000);
          var year = date.getFullYear();
          var month = date.getMonth() + 1;
          var day = date.getDate();
          var domingo_final = `${day}/${month}/${year}`;
          return domingo_final;
        }

    ListModel{
        id: listModelPreuso
    }

    function loadPreuso(){
        db.open()

        //let q1 = db.query("SELECT equipo, (SELECT count(temp_preuso.equipo) FROM temp_preuso WHERE temp_preuso.equipo = app_equipo.equipo AND temp_preuso.fecha = '"+getLunes(fecha)+"') AS lunes FROM app_equipo")
        let q1 = db.query("SELECT equipo,

(SELECT count(temp_preuso.equipo) FROM temp_formularios_consolidados as temp_preuso WHERE temp_preuso.equipo = app_equipo.equipo AND temp_preuso.fecha = '1660478400000') AS lunes_preuso,
(SELECT count(temp_preuso.equipo) FROM temp_formularios_consolidados as temp_preuso WHERE temp_preuso.equipo = app_equipo.equipo AND temp_preuso.fecha = '1660478400000' AND temp_preuso.observaciones IS NOT NULL ) AS lunes_noconf

FROM app_equipo")


        let q2 = db.query("SELECT equipo,

(SELECT count(temp_preuso.equipo) FROM temp_formularios_consolidados as temp_preuso WHERE temp_preuso.equipo = app_equipo.equipo AND temp_preuso.fecha = '1660478400000') AS martes_preuso,
(SELECT count(temp_preuso.equipo) FROM temp_formularios_consolidados as temp_preuso WHERE temp_preuso.equipo = app_equipo.equipo AND temp_preuso.fecha = '1660478400000' AND temp_preuso.observaciones IS NOT NULL ) AS martes_noconf

 FROM app_equipo")


        let q3 = db.query("SELECT equipo,
(SELECT count(temp_preuso.equipo) FROM temp_formularios_consolidados as temp_preuso WHERE temp_preuso.equipo = app_equipo.equipo AND temp_preuso.fecha = '1660478400000') AS miercoles_preuso,
(SELECT count(temp_preuso.equipo) FROM temp_formularios_consolidados as temp_preuso WHERE temp_preuso.equipo = app_equipo.equipo AND temp_preuso.fecha = '1660478400000' AND temp_preuso.observaciones IS NOT NULL ) AS miercoles_noconf

FROM app_equipo")


        let q4 = db.query("SELECT equipo,
(SELECT count(temp_preuso.equipo) FROM temp_formularios_consolidados as temp_preuso WHERE temp_preuso.equipo = app_equipo.equipo AND temp_preuso.fecha = '1660478400000') AS jueves_preuso,
(SELECT count(temp_preuso.equipo) FROM temp_formularios_consolidados as temp_preuso WHERE temp_preuso.equipo = app_equipo.equipo AND temp_preuso.fecha = '1660478400000' AND temp_preuso.observaciones IS NOT NULL ) AS jueves_noconf

FROM app_equipo")

        let q5 = db.query("SELECT equipo,
(SELECT count(temp_preuso.equipo) FROM temp_formularios_consolidados as temp_preuso WHERE temp_preuso.equipo = app_equipo.equipo AND temp_preuso.fecha = '1660478400000') AS viernes_preuso,
(SELECT count(temp_preuso.equipo) FROM temp_formularios_consolidados as temp_preuso WHERE temp_preuso.equipo = app_equipo.equipo AND temp_preuso.fecha = '1660478400000' AND temp_preuso.observaciones IS NOT NULL ) AS viernes_noconf

FROM app_equipo")

        let q6 = db.query("SELECT equipo,
(SELECT count(temp_preuso.equipo) FROM temp_formularios_consolidados as temp_preuso WHERE temp_preuso.equipo = app_equipo.equipo AND temp_preuso.fecha = '1660478400000') AS sabado_preuso,
(SELECT count(temp_preuso.equipo) FROM temp_formularios_consolidados as temp_preuso WHERE temp_preuso.equipo = app_equipo.equipo AND temp_preuso.fecha = '1660478400000' AND temp_preuso.observaciones IS NOT NULL ) AS sabado_noconf

FROM app_equipo")

        let q7 = db.query("SELECT equipo,
(SELECT count(temp_preuso.equipo) FROM temp_formularios_consolidados as temp_preuso WHERE temp_preuso.equipo = app_equipo.equipo AND temp_preuso.fecha = '1660478400000') AS domingo_preuso,
(SELECT count(temp_preuso.equipo) FROM temp_formularios_consolidados as temp_preuso WHERE temp_preuso.equipo = app_equipo.equipo AND temp_preuso.fecha = '1660478400000' AND temp_preuso.observaciones IS NOT NULL ) AS domingo_noconf

FROM app_equipo")


        for (let ok = q1.first();ok;ok = q1.next() ){

            listModelPreuso.append({
                                       "equipo":q1.values.equipo,
                                       "lunes_preuso":q1.values.lunes_preuso,
                                       "lunes_noconf":q1.values.lunes_noconf,
                                   })
        }

        for (let ok2 = q2.first();ok2;ok2 = q2.next() ){

            listModelPreuso.append({
                                       "equipo":q2.values.equipo,
                                       "martes_preuso":q2.values.martes_preuso,
                                       "martes_noconf":q2.values.martes_noconf,
                                   })
        }
        for (let ok3 = q3.first();ok3;ok3 = q3.next() ){

            listModelPreuso.append({
                                       "equipo":q3.values.equipo,
                                       "miercoles_preuso":q3.values.miercoles_preuso,
                                       "miercoles_noconf":q3.values.miercoles_noconf,
                                   })
        }
        for (let ok4 = q4.first();ok4;ok4 = q4.next() ){

            listModelPreuso.append({
                                       "equipo":q4.values.equipo,
                                       "jueves_preuso":q4.values.jueves_preuso,
                                       "jueves_noconf":q4.values.jueves_noconf,
                                   })
        }
        for (let ok5 = q5.first();ok5;ok5 = q5.next() ){

            listModelPreuso.append({
                                       "equipo":q5.values.equipo,
                                       "viernes_preuso":q5.values.viernes_preuso,
                                       "viernes_noconf":q5.values.viernes_noconf,
                                   })
        }
        for (let ok6 = q6.first();ok6;ok6 = q6.next() ){

            listModelPreuso.append({
                                       "equipo":q6.values.equipo,
                                       "sabado_preuso":q6.values.sabado_preuso,
                                       "sabado_noconf":q6.values.sabado_noconf
                                   })
        }
        for (let ok7 = q7.first();ok7;ok7 = q7.next() ){

            listModelPreuso.append({
                                       "equipo":q7.values.equipo,
                                       "domingo_preuso":q7.values.domingo_preuso,
                                       "domingo_noconf":q7.values.domingo_noconf
                                   })
        }


    }

}
