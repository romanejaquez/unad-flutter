import 'package:flutter/material.dart';
import 'package:unad_app/helpers/utils.dart';
import 'package:unad_app/widgets/listadeasignaturas.dart';
import 'package:unad_app/widgets/unadbutton.dart';

class UNADHome extends StatelessWidget {
  const UNADHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Utils.secondaryColor),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset('assets/imgs/unadlogo.png', width: 30, height: 30),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: const Icon(Icons.notifications, size: 30, color: Utils.secondaryColor)
          )
        ],
      ),
      drawer: Drawer(
        child: Container(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hola,', style: TextStyle(color: Utils.mainColor, fontSize: 20)),
            Text('Roman Jaquez', style: TextStyle(color: Utils.mainColor, fontWeight: FontWeight.bold, fontSize: 25)),
            const SizedBox(height: 10),
            UNADButton(
              icon: Icons.account_circle,
              label: 'Ver Mi Perfil', color: Utils.secondaryColor, onTap: () {

            }),
            const SizedBox(height: 20),
            ColoredBox(
              color: Utils.mainColor.withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: const [
                    Icon(Icons.school, color: Utils.secondaryColor),
                    SizedBox(width: 10),
                    Text('Mis Clases', style: TextStyle(fontSize: 20, color: Utils.secondaryColor, fontWeight: FontWeight.bold))
                  ],
                )
              ),
            ),
            const ListaDeAsignaturas()
          ]
        )
      )
    );
  }
}