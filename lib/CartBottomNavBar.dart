import 'package:carrito/clases/facturaTempProductos.dart';
import 'package:flutter/material.dart';

class CartBottomNavBar extends StatelessWidget {
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
                  child: Text(
                    "Guardar",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )
              ],
            )));
  }
}
