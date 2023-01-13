import 'package:carrito/clases/clientes.dart';
import 'package:flutter/services.dart';

class FacturaMaster {
  late int iD;
  String facturaNumero;
  String idClienteFactura;
  // DateTime fechaFactura;
  int cantidadArticulos;
  double subtotal;
  double montoDescuento;
  int montoImpuesto;
  double totalApagar;

  FacturaMaster(
      {required this.iD,
      required this.idClienteFactura,
      // required this.fechaFactura,
      required this.facturaNumero,
      required this.cantidadArticulos,
      required this.montoDescuento,
      required this.montoImpuesto,
      required this.subtotal,
      required this.totalApagar});

  static totales() {
    return FacturaMaster(
        cantidadArticulos: 20,
        facturaNumero: "1",
        iD: 1,
        idClienteFactura: "1",
        montoDescuento: 15.4,
        montoImpuesto: 2,
        subtotal: 23,
        totalApagar: 15);

    // double impuestoEmpleado;
    // double subtotalProducto;
    // int cantidadArticulo;
    // double montoDescuento ;
    // double impuesto;

    // montoDescuento = (subtotalProducto * descuentoPorEmpleador );

    // impuestoEmpleado = 10;

    // // impuestoEmpleado = impuestoPorEmpleador();

    // subtotalProducto = FacturaDetalle.getFacturaDetalle()
    //     .map((e) => e.montoproducto)
    //     .reduce((value, element) => value + element)
    //     .toDouble();

    // cantidadArticulo = FacturaDetalle.getFacturaDetalle()
    //     .map((e) => e.cantidadProducto)
    //     .reduce((value, element) => value + element);

    // impuesto = (subtotalProducto * impuestoEmpleado);

    // var result = FacturaMaster(
    //     iD: 1,
    //     idClienteFactura: "40221025725",
    //     facturaNumero: "1",
    //     cantidadArticulos: cantidadArticulo,
    //     montoDescuento:
    //     montoImpuesto:impuesto,
    //     subtotal: subtotal,
    //     totalApagar: totalApagar);
  }

  double impuestoPorEmpleador() {
    return 10.0;
  }

  double descuentoPorEmpleador() {
    return 10.0;
  }
}

class FacturaDetalle {
  late String facturaNumero;
  String codigoProducto;
  String nombreProducto;
  double montoproducto;
  int cantidadProducto;

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
