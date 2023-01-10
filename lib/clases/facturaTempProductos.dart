import 'package:carrito/clases/clientes.dart';

class FacturaMaster {
  late String iD;
  String facturaNumero;
  String idClienteFactura;
  DateTime fechaFactura;
  int cantidadArticulos;
  double subtotal;
  double montoDescuento;
  double montoImpuesto;
  double totalApagar;

  FacturaMaster(
      {required this.iD,
      required this.idClienteFactura,
      required this.fechaFactura,
      required this.facturaNumero,
      required this.cantidadArticulos,
      required this.montoDescuento,
      required this.montoImpuesto,
      required this.subtotal,
      required this.totalApagar});
}

class FacturaDetalle {
  late String facturaNumero;
  String codigoProducto;
  String nombreProducto;
  double montoproducto;
  String cantidadProducto;

  FacturaDetalle(
      {required this.facturaNumero,
      required this.codigoProducto,
      required this.montoproducto,
      required this.nombreProducto,
      required this.cantidadProducto});

  static List<FacturaDetalle> getFacturaDetalle() {
    return <FacturaDetalle>[];
    //   FacturaDetalle(
    //       facturaNumero: '01',
    //       codigoProducto: '64511-23460-RE',
    //       montoproducto: 227.6,
    //       nombreProducto: 'CATAL. TRAS. 37',
    //       cantidadProducto: '10')
    // ];
  }
}
