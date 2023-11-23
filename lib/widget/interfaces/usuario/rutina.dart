import 'package:flutter/material.dart';


class Rutinas extends StatefulWidget {
  const Rutinas({super.key});

  @override
  State<Rutinas> createState() => _RutinasState();
}

List<Color> color = [];

class _RutinasState extends State<Rutinas> {
 // List<RutinaService>? data;
  int cantidad = 0;

  @override
  void initState() {
    super.initState();
   // getRutina();
  }

  // Future<void> getRutina() async {
  //   final rutinaData = await readRutina();
  //   if (rutinaData != null && rutinaData.isNotEmpty) {
  //     data = rutinaData;
  //     setState(() {
  //       cantidad = data!.length;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    color = List<Color>.generate(cantidad, (index) => const Color(0xff484848));

    return MaterialApp(
      theme: ThemeData.dark().copyWith(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   leading: IconButton(
        //     icon: const Icon(Icons.arrow_back),
        //     onPressed: () {
        //       Navigator.of(context).pop();
        //     },
        //   ),
        //   title: Text('Rutina:'),
        // ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // CardR(
              //   cantidad: cantidad,
              //   data: data,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}



