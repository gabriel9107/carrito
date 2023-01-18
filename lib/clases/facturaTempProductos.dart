import 'dart:ffi';

import 'package:carrito/clases/clientes.dart';
import 'package:flutter/services.dart';

import 'formatos.dart';

class FacturaMaster {
  late int iD;
  String facturaNumero;
  String idClienteFactura;
  // DateTime fechaFactura;
  int cantidadArticulos;
  String subtotal;
  String montoDescuento;
  String montoImpuesto;
  String totalApagar;

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
    int facturaNumeriI = 1;
    int cantidadArticulos = 0;
    Double montoDescuento;
    int descuentoI = 0;

    double impuestoI;
    double impuesto = 0;
    double descuento = 0;

    double subtotal = 0;

    double totalApagar = 0;

    descuentoI = 10;

    if (FacturaDetalle.getFacturaDetalle().isEmpty) {
      return FacturaMaster(
          cantidadArticulos: cantidadArticulos,
          facturaNumero: "1",
          iD: 1,
          idClienteFactura: "1",
          montoDescuento: numberFormat(descuento),
          montoImpuesto: numberFormat(impuesto),
          subtotal: numberFormat(subtotal),
          totalApagar: numberFormat(totalApagar));
    }
    cantidadArticulos = FacturaDetalle.getFacturaDetalle()
        .map((e) => e.cantidadProducto)
        .reduce((value, element) => value + element)
        .toInt();

    subtotal = (FacturaDetalle.getFacturaDetalle()
            .map((e) => e.montoproducto)
            .reduce((value, element) => value + element) *
        cantidadArticulos);

    descuento = ((subtotal * descuentoI) / 1000).toDouble();

    impuestoI = 5;

    impuesto = ((subtotal * impuestoI) / 1000).toDouble();

    totalApagar = ((subtotal - descuento) + impuesto);

    return FacturaMaster(
        cantidadArticulos: cantidadArticulos,
        facturaNumero: facturaNumeriI.toString(),
        iD: 1,
        idClienteFactura: "1",
        montoDescuento: numberFormat(descuento),
        montoImpuesto: numberFormat(impuesto),
        subtotal: numberFormat(subtotal),
        totalApagar: numberFormat(totalApagar));
  }

  int impuestoPorEmpleador() {
    return 10;
  }

  double get descuentoPorEmpleador {
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
  }
}
