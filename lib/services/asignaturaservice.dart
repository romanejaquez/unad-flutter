import 'package:flutter/material.dart';
import 'package:unad_app/helpers/utils.dart';
import 'package:unad_app/models/asignatura.dart';

class AsignaturaService extends ChangeNotifier {

  List<Asignatura> asignaturas = Utils.getAsignaturas();

  void addAsignatura(String id) {
    var asignatura = asignaturas.where((a) => a.id == id).first;
    asignatura.anadida = !asignatura.anadida;
    notifyListeners();
  }
}