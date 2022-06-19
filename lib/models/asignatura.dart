class Asignatura {

  String id;
  String nombre;
  String descripcion;
  String clave;
  String prerequisito;
  bool anadida;

  Asignatura({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.clave,
    required this.prerequisito,
    required this.anadida
  });

  factory Asignatura.fromJSON(Map<String, dynamic> json) {

    return Asignatura(
      id: json['id'],
      nombre: json['nombre'], 
      descripcion: json['descripcion'], 
      clave: json['clave'], 
      prerequisito: json['prerequisito'], 
      anadida: json['anadida']
    );
  }
}