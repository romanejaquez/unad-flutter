import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unad_app/helpers/utils.dart';
import 'package:unad_app/services/asignaturaservice.dart';

class ListaDeAsignaturas extends StatelessWidget {
  const ListaDeAsignaturas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AsignaturaService>(
      builder: (context, service, child) {
        return Expanded(
          child: ListView.builder(
            itemCount: service.asignaturas.length,
            itemBuilder: (context, index) {

              var asignatura = service.asignaturas[index];

              return Material(
                color: Colors.transparent,
                child: InkWell(
                  highlightColor: Utils.mainColor.withOpacity(0.1),
                  splashColor: Utils.secondaryColor.withOpacity(0.1),
                  onTap: () {
                    service.addAsignatura(asignatura.id);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.class_, color: Utils.mainColor),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(asignatura.nombre.toUpperCase(), style: TextStyle(color: Utils.mainColor, fontWeight: FontWeight.bold)),
                              Text(asignatura.clave)
                            ],
                          ),
                        ),
                        Icon(asignatura.anadida ? Icons.check_circle : Icons.circle_outlined, color: Utils.secondaryColor),
                        Icon(Icons.chevron_right, color: Colors.grey)
                      ],
                    ),
                  ),
                ),
              );
            }
          ),
        );
      }
    );
  }
}