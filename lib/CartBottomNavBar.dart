import 'package:carrito/clases/facturaTempProductos.dart';
import 'package:carrito/clases/facturas.dart';
import 'package:carrito/pantallas/facturas/ordenDeventa.dart';
import 'package:carrito/pantallas/listaDePedidos.dart';
import 'package:carrito/servicios/db_helper.dart';
import 'package:flutter/material.dart';

class CartBottomNavBar extends StatelessWidget {
  String customerName;
  CartBottomNavBar(this.customerName);
  @override
  Widget build(BuildContext context) {
    FacturaMaster totales = FacturaMaster.totales();
    return BottomAppBar(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            height: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Cantidad de Articulos",
                      style: TextStyle(
                          color: Color(0xFF4C54A5),
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      totales.cantidadArticulos.toString(),
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C53A5)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sub total",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ("\$" + totales.subtotal.toString()),
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C53A5)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Descuentos",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ("\$" + totales.montoDescuento.toString()),
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C53A5)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Impuestos",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ("\$" + totales.montoImpuesto.toString()),
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C53A5)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total a Pagar",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ("\$" + totales.totalApagar.toString()),
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                          // color: Color(0xFF4C53A5)
                          ),
                    )
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 113, 219, 86),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        onPrimary: Colors.white,
                        shadowColor: Colors.greenAccent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        minimumSize: Size(680, 140), //////// HERE
                      ),
                      child: Text(
                        "Guardar",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      onPressed: () async {
                        print(FacturaDetalle.guardarFactura(this.customerName));

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => pedidosLista()));
                        // print("hola");
                      },
                    )
                  ]),
                  // alignment: Alignment.center,
                  // height: 50,
                  // width: double.infinity,
                  // decoration: BoxDecoration(
                  //   color: Color.fromARGB(255, 113, 219, 86),
                  //   borderRadius: BorderRadius.circular(20),
                  // ),
                  // child:
                  // Text(
                  //   "Guardar",
                  //   style: TextStyle(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.white),
                  // ),
                )
              ],
            )));
  }
}
