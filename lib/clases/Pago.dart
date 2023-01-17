import 'package:flutter/cupertino.dart';

import 'Pago.dart';
import 'Pago.dart';

class PagoMaster {
  String fechaPago;
  String noRecibo;
  String noFactura;
  String tipoPago;
  String montoPago;

  PagoMaster(
      {required this.fechaPago,
      required this.noRecibo,
      required this.noFactura,
      required this.tipoPago,
      required this.montoPago});

  static List<PagoMaster> getPagos() {
    return <PagoMaster>[
      PagoMaster(
          fechaPago: '04/Jan/2019 12:00:00 AM',
          noRecibo: 'FVS002495',
          noFactura: 'PVS003019',
          tipoPago: '1',
          montoPago: '4106.85'),
      PagoMaster(
          fechaPago: '04/Jan/2019 12:00:00 AM',
          noRecibo: 'FVS002495',
          noFactura: 'PVS003019',
          tipoPago: '1',
          montoPago: '4106.85'),
      PagoMaster(
          fechaPago: '04/Jan/2019 12:00:00 AM',
          noRecibo: 'FVS002495',
          noFactura: 'PVS003019',
          tipoPago: '1',
          montoPago: '4106.85'),
      PagoMaster(
          fechaPago: '04/Jan/2019 12:00:00 AM',
          noRecibo: 'FVS002495',
          noFactura: 'PVS003019',
          tipoPago: '1',
          montoPago: '4106.85')
    ];
  }
}
