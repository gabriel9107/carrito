class Productos {
  String codigoProducto;
  String nombreProducto;
  String descripcionProducto;
  double precioProducto;

  Productos(
      {required this.codigoProducto,
      required this.nombreProducto,
      required this.descripcionProducto,
      required this.precioProducto});

  static List<Productos> getProductos() {
    return <Productos>[
      Productos(
          codigoProducto: '160X14 ',
          nombreProducto: 'TVR ARO',
          descripcionProducto: 'TVR ARO 1.60 X 14 NIQUEL',
          precioProducto: 993.18),
      Productos(
          codigoProducto: '3AA-15631-00',
          nombreProducto: '31120-CG125 ',
          descripcionProducto: 'TVR CAMPO 8-BOB CG125 COMPL    ',
          precioProducto: 804.07)
    ];
  }
}
