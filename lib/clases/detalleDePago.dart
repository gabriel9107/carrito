import 'detalleDePago.dart';

class PagosDetails {
  int nroFactura;
  formaDePago forma;
  entidadBancaria banco;
  double valorpago;
  late String nroCheque;
  late DateTime fechaCheque;
  String idCliente;
  String idVendedor;

  PagosDetails(
      {required this.nroFactura,
      required this.forma,
      required this.banco,
      required this.valorpago,
      required this.fechaCheque,
      required this.idVendedor,
      required this.idCliente,
      required this.nroCheque});
}

class entidadBancaria {
  int id;
  String nombre;
  entidadBancaria({required this.id, required this.nombre});

  static List<entidadBancaria> getentidadBancaria() {
    return <entidadBancaria>[
      entidadBancaria(id: 1, nombre: 'Popular'),
      entidadBancaria(id: 2, nombre: 'BHD'),
      entidadBancaria(id: 3, nombre: 'Banreserva'),
      entidadBancaria(id: 4, nombre: 'Scotia Bank'),
      entidadBancaria(id: 5, nombre: 'Banco Caribe'),
      entidadBancaria(id: 6, nombre: 'Banco Cibao'),
      entidadBancaria(id: 7, nombre: 'Banco de Ahorro y Credito'),
      entidadBancaria(id: 8, nombre: 'Caribe'),
      entidadBancaria(id: 9, nombre: 'Otros')
    ];
  }
}

class formaDePago {
  int id;
  String nombre;

  formaDePago({required this.id, required this.nombre});

  static List<formaDePago> getformadePago() {
    return <formaDePago>[
      formaDePago(id: 1, nombre: 'Efectivo'),
      formaDePago(id: 2, nombre: 'Cheque'),
      formaDePago(id: 3, nombre: 'Transferencia'),
    ];
  }
}
