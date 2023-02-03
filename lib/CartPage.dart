import 'package:carrito/clases/facturaTempProductos.dart';

import 'package:carrito/pantallas/buscarProductosEnFactura.dart';
import 'package:carrito/pantallas/nav_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CartBottomNavBar.dart';

class CartPage extends StatefulWidget {
  String customerName;
  int? ordenNumero;

  CartPage(this.customerName, this.ordenNumero);

  @override
  _mainPage createState() => _mainPage(this.customerName);
}

class _mainPage extends State<CartPage> {
  String customerName;
  _mainPage(this.customerName);
  late List<FacturaDetalle> detalleFactura = FacturaDetalle.getFacturaDetalle();

  Future refresh() async {
    setState(() {
      detalleFactura = FacturaDetalle.getFacturaDetalle();
    });
  }

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 42, 135, 221),
        elevation: 0.0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 8.0),
              child: Text(
                "Siga - pedidos",
                style: TextStyle(color: Color(0xff444444), fontSize: 19),
              ),
            ),
            Text(
              this.customerName.toString(),
              style: TextStyle(color: Color(0xffa1a1a1), fontSize: 13),
            ),
          ],
        ),

        //Boton de Buscar
        actions: [
          IconButton(
            onPressed: () => {
              showSearch(
                  context: context, delegate: MySearchDelegateParaProductos())
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      drawer: NavigationDrawer(),
      body: newMethod(),
      bottomNavigationBar: CartBottomNavBar(this.customerName),
    );
    return scaffold;
  }

  RefreshIndicator newMethod() {
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
                                CupertinoIcons.plus,
                                color: Colors.white,
                              ),
                              Text(
                                detalleFactura[index]
                                    .cantidadProducto
                                    .toString(),
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
            ]),
          );
        },

        // children: [
      ),
    );
  }
}
