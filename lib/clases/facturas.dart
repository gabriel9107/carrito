class facturaCabecera {
  String numeroPedido;
  String numeroFactura;
  String termino;
  String fechadeVencimiento;
  String montofactura;
  String montopendiente;

  facturaCabecera(
      {required this.numeroPedido,
      required this.numeroFactura,
      required this.fechadeVencimiento,
      required this.montofactura,
      required this.montopendiente,
      required this.termino});

  static List<facturaCabecera> getFacturas() {
    return <facturaCabecera>[
      facturaCabecera(
          numeroPedido: 'PVS003019',
          numeroFactura: 'FVS002495',
          fechadeVencimiento: '04/Jan/2019 12:00:00 AM',
          montofactura: '9692.32',
          montopendiente: '9692.32',
          termino: '45'),
      facturaCabecera(
          numeroPedido: 'PVS003019',
          numeroFactura: 'FVS002495',
          fechadeVencimiento: '10/Dec/2020 12:00:00 AM',
          montofactura: '9692.32',
          montopendiente: '9692.32',
          termino: '45'),
      facturaCabecera(
          numeroPedido: 'PVS002643',
          numeroFactura: 'FVS002495',
          fechadeVencimiento: '05/Feb/2019 12:00:00 AM',
          montofactura: '9692.32',
          montopendiente: '9692.32',
          termino: '45'),
      facturaCabecera(
          numeroPedido: 'PVS003299',
          numeroFactura: 'FVS002495',
          fechadeVencimiento: '19/Jul/2019 12:00:00 AM',
          montofactura: '9692.32',
          montopendiente: '9692.32',
          termino: '45')
    ];
  }
}
