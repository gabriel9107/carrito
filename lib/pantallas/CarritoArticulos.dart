import 'package:carrito/CartPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../clases/facturaTempProductos.dart';

class CarritoArticulos extends State<CartPage> {
  late List<FacturaDetalle> detalleFactura = FacturaDetalle.getFacturaDetalle();

  Future refresh() async {
    setState(() {
      detalleFactura = FacturaDetalle.getFacturaDetalle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refresh,
      child: ListView.builder(
        itemCount: detalleFactura.length,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
              child: Column(children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Container(
                width: 650,
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: Offset(0, 3))
                    ]),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 50,
                        width: 150,
                      ),
                    ),
                    Container(
                      width: 450,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            detalleFactura[index].codigoProducto,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            detalleFactura[index].nombreProducto,
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            detalleFactura[index].montoproducto.toString(),
                            style: TextStyle(fontSize: 20, color: Colors.red),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              CupertinoIcons.minus,
                              color: Colors.white,
                            ),
                            Text(
                              detalleFactura[index].cantidadProducto.toString(),
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Icon(
                              CupertinoIcons.minus,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]));
        },

        // children: [
      ),
    );
  }
}
