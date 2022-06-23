import 'package:flutter/material.dart';
import 'package:unad_app/helpers/utils.dart';
import 'package:unad_app/models/asignatura.dart';

class AsignaturaService extends ChangeNotifier {

  List<Asignatura> asignaturas = Utils.getAsignaturas();

  Asignatura? asignaturaSeleccionada;

  void selectionarAsignatura(Asignatura a) {
    asignaturaSeleccionada = a;
  }

  void agregarAsignatura(String id) {
    var asignatura = asignaturas.where((a) => a.id == id).first;
    asignatura.anadida = true;
    notifyListeners();
  }

  void retirarAsignatura(String id) {
    var asignatura = asignaturas.where((a) => a.id == id).first;
    asignatura.anadida = false;
    notifyListeners();
  }
}