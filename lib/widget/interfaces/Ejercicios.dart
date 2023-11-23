import 'package:flutter/material.dart';
import 'package:login_jc_2023/screens/home_page.dart';
import 'package:login_jc_2023/widget/interfaces/widgets.dart';

class Ejercicios extends StatefulWidget {
  final List<String> selectedMusc;
  final List<String> selectedDias;
  final String? cliente;
  const Ejercicios(
      {super.key,
      required this.selectedMusc,
      required this.selectedDias,
      this.cliente});

  @override
  State<Ejercicios> createState() => _EjerciciosState();
}

List<String> ejerciciosSeleccionados = [];
String repe = '';
String serie = '';

class _EjerciciosState extends State<Ejercicios> {
  //List<ExerciseService>? data;
  int cantidad = 0;
  @override
  void initState() {
    super.initState();
    print('El cliente ohhhhh: ${widget.cliente}');
    ejerciciosSeleccionados = [];

  //   // Llama a la función para recuperar los datos del usuario
  //   if (widget.selectedMusc.length == 1) {
  //     getExerciseData1();
  //   } else if (widget.selectedMusc.length == 2) {
  //     getExerciseData2();
  //   } else {
  //     getExerciseData3();
  //   }
  // }

  // Future<void> getExerciseData1() async {
  //   final exerciseData = await readOneExercise(widget.selectedMusc[0]);
  //   if (exerciseData != null && exerciseData.isNotEmpty) {
  //     data = exerciseData;
  //     setState(() {
  //       cantidad = data!.length;
  //     });
  //   }
  // }

  // Future<void> getExerciseData2() async {
  //   final exerciseData =
  //       await readTwoExercise(widget.selectedMusc[0], widget.selectedMusc[1]);
  //   if (exerciseData != null && exerciseData.isNotEmpty) {
  //     data = exerciseData;
  //     setState(() {
  //       cantidad = data!.length;
  //     });
  //   }
  // }

  // Future<void> getExerciseData3() async {
  //   final exerciseData = await readThreeExercise(
  //       widget.selectedMusc[0], widget.selectedMusc[1], widget.selectedMusc[2]);
  //   if (exerciseData != null && exerciseData.isNotEmpty) {
  //     // for in para meterlos posible(?)
  //     data = exerciseData;
  //     setState(() {
  //       cantidad = data!.length;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text('Musculos: ${widget.selectedMusc}', maxLines: 2),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            const Buscador_uwu(),
          ],
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (widget.cliente!.isEmpty) {
             // addRutina(ejerciciosSeleccionados, widget.selectedDias);
            } else {
             // addRutinaUsuario(
                //  ejerciciosSeleccionados, widget.selectedDias, widget.cliente);
            }
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
              (route) => false,
            );
          },
          child: const Icon(Icons.check),
        ),
      ),
    );
  }
}


/*
TextButton(
  child: const Text('LISTEN'),
  onPressed: () {/* ... */},
),
*/

/// Flutter code sample for [DropdownMenu].
List<String> rep = ['1', '2', '3', '5', '8', '10', '12', '15', '18', '20'];
List<String> series = ['1', '2', '3', '4', '5'];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }






}