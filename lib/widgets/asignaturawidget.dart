import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unad_app/helpers/utils.dart';
import 'package:unad_app/models/asignatura.dart';
import 'package:unad_app/services/asignaturaservice.dart';

class AsignaturaWidget extends StatelessWidget {

  final Asignatura asignatura;
  final Function onAsignaturaTap;
  const AsignaturaWidget({Key? key, required this.asignatura, required this.onAsignaturaTap }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        highlightColor: Utils.mainColor.withOpacity(0.1),
        splashColor: Utils.secondaryColor.withOpacity(0.1),
        onTap: () {
          onAsignaturaTap();
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.class_, color: Utils.mainColor),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(asignatura.nombre.toUpperCase(), 
                    style: const TextStyle(color: Utils.mainColor, fontWeight: FontWeight.bold)),
                    Text(asignatura.clave)
                  ],
                ),
              ),
              Consumer<AsignaturaService>(
                builder: (context, service, child) {
                  return Icon(asignatura.anadida ? Icons.check_circle : Icons.circle_outlined, color: Utils.secondaryColor);
                }
              ),
              const Icon(Icons.chevron_right, color: Colors.grey)
            ],
          ),
        ),
      ),
    );
  }
}