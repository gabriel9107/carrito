import 'package:carrito/clases/Pago.dart';
import 'package:carrito/clases/facturaTempProductos.dart';
import 'package:carrito/clases/facturas.dart';
import 'package:carrito/pantallas/realizarPagos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../CartPage.dart';

class detallePage extends StatefulWidget {
  //Titulo del App bar en caso de que se edite o que se agregue un nuevo registro.

  String customerName;

  detallePage(this.customerName);
  @override
  _detallePageState createState() => _detallePageState(customerName);
}

class _detallePageState extends State<detallePage> {
  String customerName;

  List<facturaCabecera> detallefactura = facturaCabecera.getFacturas();
  List<PagoMaster> detallePagos = PagoMaster.getPagos();

  _detallePageState(this.customerName);

  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: <Widget>[
                Row(
                  children: [
                    Text(customerName)
                    // Text("Gabriel Montero | 402-2102572-5"),
                  ],
                ),
              ],
            ),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'Factura',
                ),
                Tab(
                  text: 'Pagos',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(
                child: ListView.builder(
                  itemCount: detallefactura.length,
                  itemBuilder: (BuildContext context, int index) {
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
                            child: Row(children: [
                              Container(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: 50,
                                  width: 150,
                                ),
                              ),
                              Container(
                                width: 250,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Numero pedido: " +
                                          detallefactura[index].numeroPedido,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Numero Factura : " +
                                          detallefactura[index].numeroPedido,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      "Termino " +
                                          detallefactura[index]
                                              .montofactura
                                              .toString(),
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      "Fecha Factura :" +
                                          detallefactura[index]
                                              .montofactura
                                              .toString(),
                                      style: TextStyle(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 1),
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Monto Factura :" +
                                            detallefactura[index]
                                                .montofactura
                                                .toString(),
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.black),
                                      ),
                                      Text(
                                        "Monto Pendiente :" +
                                            detallefactura[index]
                                                .montofactura
                                                .toString(),
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.red),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ]),
                          ),
                        ),
                      ]),
                    );

                    // ListTile(
                    //   leading: Icon(Icons.calculate),
                    //   title: Text("Pedido :" +
                    //       detallefactura[index].numeroFactura.toString()),
                    //   subtitle: Text(
                    //       "Factura :" + detallefactura[index].numeroFactura),
                    // );
                  },
                ),
              ),

              //Aqui esta el detalle de los Pagos
              Center(
                child: ListView.builder(
                  itemCount: detallePagos.length,
                  itemBuilder: (BuildContext context, int index) {
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
                            child: Row(children: [
                              Container(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: 50,
                                  width: 150,
                                ),
                              ),
                              Container(
                                width: 250,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Fecha de Pago : " +
                                          detallefactura[index].numeroPedido,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Nro recibo : " +
                                          detallefactura[index].numeroPedido,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      "Termino " +
                                          detallefactura[index]
                                              .montofactura
                                              .toString(),
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      " Nro Factura :" +
                                          detallefactura[index]
                                              .montofactura
                                              .toString(),
                                      style: TextStyle(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 1),
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Tipo de Pago  :" +
                                            detallefactura[index]
                                                .montofactura
                                                .toString(),
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.black),
                                      ),
                                      Text(
                                        "Monto :" +
                                            detallefactura[index]
                                                .montofactura
                                                .toString(),
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.red),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ]),
                          ),
                        ),
                      ]),
                    );

                    // ListTile(
                    //   leading: Icon(Icons.calculate),
                    //   title: Text("Pedido :" +
                    //       detallefactura[index].numeroFactura.toString()),
                    //   subtitle: Text(
                    //       "Factura :" + detallefactura[index].numeroFactura),
                    // );
                  },
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => realizarPagos()),
              );
            },
            tooltip: 'Agregar',
            child: Icon(Icons.add),
          ),
        ),
      );
}
