import 'package:flutter/material.dart';
import 'package:unad_app/main.dart';
import 'package:unad_app/models/asignatura.dart';

class Utils {
  static const Color mainColor = Color(0xFF265A4C);
  static const Color secondaryColor = Color(0xFF00A77A);

  static List<Asignatura> getAsignaturas() {
    return [
      Asignatura(
          id: '1',
          nombre: "Matematica Basica",
          descripcion: "Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione.",
          clave: 'MAT-1111',
          prerequisito: 'Bachiller',
          anadida: false
      ),
      Asignatura(
          id: '2',
          nombre: "Matematica Basica",
          descripcion: "Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione.",
          clave: 'MAT-1111',
          prerequisito: 'Bachiller',
          anadida: false
      ),
      Asignatura(
          id: '3',
          nombre: "Comunicacion Oral",
          descripcion: "Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione.",
          clave: 'LESP-1111',
          prerequisito: 'Bachiller',
          anadida: false
      ),
      Asignatura(
          id: '4',
          nombre: "Introduccion a la Ingenieria y Computacion",
          descripcion: "Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione.",
          clave: 'COMP-2111',
          prerequisito: 'Bachiller',
          anadida: false
      )
    ];
  }
}
