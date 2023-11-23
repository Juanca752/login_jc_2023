import 'package:flutter/material.dart';
import 'package:login_jc_2023/utils/utils.dart';
import 'package:intl/intl.dart';

class RegistroH extends StatefulWidget {
  final String? usuario;

  const RegistroH({Key? key, this.usuario}) : super(key: key);

  @override
  State<RegistroH> createState() => _RegistroHState();
}

class _RegistroHState extends State<RegistroH> {
  String? fullname;
  String? objectid;
 // List<AsistenciaService> listaAsistencia = [];

  @override
  void initState() {
    super.initState();
    fullname = widget.usuario;

    // if(fullname!=null){
    //   _getData();
    // }else{
    //   _getDataGeneral();
    // }

    
  }

  // Future<void> _getData() async {
  //   try {
  //     final userid = await getObjectIdByFullname(fullname!);
  //     if (userid != null) {
  //       final data = await readAsistenciasUsuario(userid);
  //       setState(() {
  //         listaAsistencia = data;
  //       });
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }
  // Future<void> _getDataGeneral() async {
  //   try {
  //       final data = await readAsistenciasGeneral();
  //       setState(() {
  //         listaAsistencia = data;
  //       });
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }

  final TextEditingController nombreController = TextEditingController();
  final TextEditingController fechaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Registros'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Agregar Registro'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: nombreController,
                        decoration: InputDecoration(labelText: 'Nombre',),
                        
                        //que solo deje poner los de la base de datos y que haga busquedas que coincidan con lo que se va escribiendo?
                      ),
                      TextField(
                        controller: fechaController,
                        decoration: const InputDecoration(
                            labelText: 'Fecha',
                            icon: Icon(Icons.calendar_today)),
                        readOnly:
                            true, //set it true, so that user will not able to edit text
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(
                                  2023), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime
                                  .now()); //la ultima fecha que puede escoger es la de hoy
                          if (pickedDate != null) {
                            // print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            // print(formattedDate); //formatted date output using intl package =>  2021-03-16
                            //you can implement different kind of Date Format here according to your requirement

                            setState(() {
                              fechaController.text =
                                  formattedDate; //set output date to TextField value.
                              //Mandarlo a la base de datos
                            });
                          } else {
                            Utils.showSnackBar("Date is not selected");
                          }
                        },
                        //InputDecoration(labelText: 'Fecha (yyyy-MM-dd)'),
                      ),
                      Container(
                        // color: Color.fromARGB(255, 128, 123, 155),
                        height: 10,
                        alignment: Alignment.center,

                        // child: const DatePickerApp(), //No funciona xd hay que modificar el DatePickerApp
                        //Poner un boton que llame para escoger la fecha y llamar a DatePickerApp()
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Cancelar'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: const Text('Agregar'),
                      onPressed: () async {
                        final nombre = nombreController.text;
                        final fechaStr = fechaController.text;
                        if (nombre.isNotEmpty && fechaStr.isNotEmpty) {
                        // Llamada al método addAsistenciaUsuario con nombre y fecha
                         // await addAsistenciaUsuarioFecha(nombre, fechaStr);

                            // Limpiar controladores y cerrar el cuadro de diálogo
                            nombreController.clear();
                            fechaController.clear();
                            Navigator.of(context).pop();
                          
                          } else {
                            Utils.showSnackBar("Nombre y fecha son obligatorios");
                          }
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}


// class Registro {
//   final String name;
//   final DateTime date;

//   Registro(this.name, this.date);
// }

// class Date_Picker extends StatefulWidget {
//   const Date_Picker({super.key});

//   @override
//   State<Date_Picker> createState() => _Date_PickerState();
// }

// class _Date_PickerState extends State<Date_Picker> {
//   TextEditingController dateinput = TextEditingController();
//   @override
//   void initState() {
//     dateinput.text = ""; //set the initial value of text field
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//         child: TextField(
//       controller: dateinput, //editing controller of this TextField
//       decoration: InputDecoration(
//           icon: Icon(Icons.calendar_today), //icon of text field
//           labelText: "Enter Date" //label text of field
//           ),
//       readOnly: true, //set it true, so that user will not able to edit text
//       onTap: () async {
//         DateTime pickedDate = await showDatePicker(
//             context: context,
//             initialDate: DateTime.now(),
//             firstDate: DateTime(
//                 2000), //DateTime.now() - not to allow to choose before today.
//             lastDate: DateTime(2101));

//         if (pickedDate != null) {
//           print(
//               pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
//           String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
//           print(
//               formattedDate); //formatted date output using intl package =>  2021-03-16
//           //you can implement different kind of Date Format here according to your requirement

//           setState(() {
//             dateinput.text =
//                 formattedDate; //set output date to TextField value.
//           });
//         } else {
//           print("Date is not selected");
//         }
//       },
//     ));
//   }
// }