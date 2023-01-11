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

  static List<FacturaDetalle> facturaDetalle = <FacturaDetalle>[];

  static void addfacturaDetalle(FacturaDetalle detalle) {
    print('inicio de la lista');
    facturaDetalle.add(detalle);

    print(detalle.codigoProducto.toString());
    print('detalle agregado a la factura');
  }

  static List<FacturaDetalle> getFacturaDetalle() {
    return facturaDetalle.toList();
    //   FacturaDetalle(
    //       facturaNumero: '01',
    //       codigoProducto: '64511-23460-RE',
    //       montoproducto: 227.6,
    //       nombreProducto: 'CATAL. TRAS. 37',
    //       cantidadProducto: '10')
    // ];
  }
}
