import 'package:carrito/clases/facturaTempProductos.dart';
import 'package:carrito/pantallas/buscarProductosEnFactura.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _mainPage createState() => _mainPage();
}

class _mainPage extends State<CartPage> {
  static List<FacturaDetalle> getFacturaDetalle2() {
    return <FacturaDetalle>[];
  }

  late List<FacturaDetalle> detalleFactura = getFacturaDetalle2();

  // final List<String> OrderDetails = [
  //   '11400-23830',
  //   '96000-06022',
  //   '95014-73100',
  //   '50610-087-00',
  //   '54410-01005-000',
  //   '3AA-15631-00',
  //   '52100-GK4-970A'
  //       '3AA-15631-00',
  //   '52100-GK4-970A'
  // ];

  Future refresh() async {
    setState(() {
      detalleFactura = FacturaDetalle.getFacturaDetalle();

      // detalleFactura.add(FacturaDetalle(
      //     facturaNumero: "1",
      //     codigoProducto: 'test',
      //     montoproducto: 155.2,
      //     nombreProducto: 'test',
      //     cantidadProducto: "10"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Siga Mobile - Pedidos'),
        backgroundColor: Color.fromARGB(255, 42, 135, 221),

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

        // title: Padding(

        //   padding: EdgeInsets.only(top: 0),
        //   child: Text(
        //     'Pedidos - Cliente : Gabriel Montero | 40221025725',
        //     style: TextStyle(color: Colors.blue),
        //   ),
        // ),
      ),

      // en este codigo esta el emcabezado
      //  Padding(
      //         padding: EdgeInsets.only(
      //           top: 20,
      //           left: 10,
      //           bottom: 10,
      //         ),
      //         child: Text(
      //           "Detalle del Pedido",
      //           style: TextStyle(
      //             fontSize: 30,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       ),
      body: RefreshIndicator(
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
                                detalleFactura[index].cantidadProducto,
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
      ),

      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Total",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "\$80",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 84, horizontal: 60),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28))),
                ),
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Cantidad de Articulos : ",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "10",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sub total  :",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "10",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Impuestos :",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "10",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Descuentos :",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "10",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total a Pagar : ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "\$10",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
