import 'package:flutter/material.dart';
import 'package:unad_app/main.dart';

class Utils {
  static const Color mainColor = Color(0xFF265A4C);
  static const Color secondaryColor = Color(0xFF00A77A);

  static List<Asignatura> getAsignaturas() {
    return [
      Asignatura(
          id: '1',
          nombre: "Matematica Basica",
          descripcion: "Matematica Basica",
          clave: 'MAT-1111',
          prerequisito: 'Bachiller',
          anadida: false
      ),
      Asignatura(
          id: '2',
          nombre: "Matematica Basica",
          descripcion: "Matematica Basica",
          clave: 'MAT-1111',
          prerequisito: 'Bachiller',
          anadida: false
      ),
      Asignatura(
          id: '3',
          nombre: "Comunicacion Oral",
          descripcion: "Comunicacion Oral",
          clave: 'LESP-1111',
          prerequisito: 'Bachiller',
          anadida: false
      ),
      Asignatura(
          id: '4',
          nombre: "Introduccion a la Ingenieria y Computacion",
          descripcion: "Matematica Basica",
          clave: 'COMP-2111',
          prerequisito: 'Bachiller',
          anadida: false
      )
    ];
  }
}
