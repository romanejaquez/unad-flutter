import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unad_app/helpers/utils.dart';
import 'package:unad_app/models/asignatura.dart';
import 'package:unad_app/services/asignaturaservice.dart';
import 'package:unad_app/widgets/unadbutton.dart';

class UNADAsignaturaDetalles extends StatelessWidget {
  const UNADAsignaturaDetalles({Key? key}) : super(key: key);

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
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Consumer<AsignaturaService>(
          builder: (context, service, child) {

            Asignatura asignatura = service.asignaturaSeleccionada!;

            return Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.class_, color: Utils.mainColor),
                      const SizedBox(height: 10),
                      const Text('Asignatura'),
                      Text(asignatura.nombre,
                        style: const TextStyle(color: Utils.mainColor, fontSize: 30)
                      ),
                      const SizedBox(height: 20),
                      const Text('Descripción'),
                      Text(asignatura.descripcion,
                        style: const TextStyle(color: Colors.black, fontSize: 15)
                      ),
                      const SizedBox(height: 20),
                      const Text('Clave'),
                      Text(asignatura.clave,
                        style: const TextStyle(color: Colors.black, fontSize: 30)
                      ),
                      const SizedBox(height: 20),
                      const Text('Pre-Requisito'),
                      Text(asignatura.prerequisito,
                        style: const TextStyle(color: Utils.secondaryColor, fontSize: 30)
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                UNADButton(
                  label: asignatura.anadida ? 'Retirar Asignatura' : 'Añadir Asignatura',
                  color: asignatura.anadida ? Utils.secondaryColor : Utils.mainColor,
                  onTap: () {
                    if (!asignatura.anadida) {
                      service.agregarAsignatura(asignatura.id);
                    }
                    else {
                      service.retirarAsignatura(asignatura.id);
                    }
                  },
                ),
              ],
            );
          }
        )
      ),
    );
  }
}