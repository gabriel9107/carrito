class Usuario {
  late int? id;
  final String usuarioNombre;
  final String usuarioClave;
  final String compagnia;
  final String activo;

  Usuario(
      {this.id,
      required this.usuarioClave,
      required this.usuarioNombre,
      required this.compagnia,
      required this.activo});

  String get usuario => usuarioNombre;
  String get clave => usuarioClave;
  String get empresa => compagnia;

  factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
      id: json['id'],
      usuarioNombre: json['UsuarioNombre'],
      usuarioClave: json['UsuarioClave'],
      compagnia: json['Compagnia'],
      activo: json['Activo']);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'UsuarioNombre': usuarioNombre,
      'UsuarioClave': usuarioClave,
      'Compagnia': compagnia,
      'Activo': activo
    };
  }
}
