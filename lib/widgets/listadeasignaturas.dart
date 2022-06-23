import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unad_app/helpers/utils.dart';
import 'package:unad_app/services/asignaturaservice.dart';
import 'package:unad_app/widgets/asignaturawidget.dart';

class ListaDeAsignaturas extends StatelessWidget {

  final Function onItemTap;
  const ListaDeAsignaturas({Key? key, required this.onItemTap }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AsignaturaService service = Provider.of<AsignaturaService>(context, listen: false);
    
    return Expanded(
      child: ListView.builder(
        itemCount: service.asignaturas.length,
        itemBuilder: (context, index) {

          var asignatura = service.asignaturas[index];

          return AsignaturaWidget(
            asignatura: asignatura,
            onAsignaturaTap: () {
              service.selectionarAsignatura(asignatura);
              onItemTap();
            }
          );
        }
      ),
    );
  }
}