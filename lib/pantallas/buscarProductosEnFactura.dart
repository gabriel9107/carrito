//Eliminar la busqueda
import 'package:carrito/clases/facturaTempProductos.dart';
import 'package:carrito/clases/productos.dart';
import 'package:flutter/material.dart';

class MySearchDelegateParaProductos extends SearchDelegate {
  @override
  final textController = TextEditingController();

  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              if (query.isEmpty) {
                close(context, null);
              } else {
                query = '';
              }
            }),
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        //Boton para regresar atras
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Text(
          query,
          style: const TextStyle(fontSize: 64, fontWeight: FontWeight.w300),
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Productos> suggestions = Productos.getProductos().where((element) {
      final result = element.nombreProducto.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text('Nombre: ' + suggestion.descripcionProducto),
          subtitle: Text('Costo : ' + suggestion.precioProducto.toString()),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.production_quantity_limits)),
              Container(
                width: 100,
                child: TextField(
                  controller: textController,
                  decoration: InputDecoration(hintText: 'Cantidad'),
                  keyboardType: TextInputType.numberWithOptions(
                      signed: false, decimal: true),
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                  onPressed: () {
                    // FacturaDetalle.getFacturaDetalle().add(FacturaDetalle(
                    //     facturaNumero: "1",
                    //     codigoProducto: suggestion.codigoProducto,
                    //     montoproducto: suggestion.precioProducto,
                    //     nombreProducto: suggestion.nombreProducto,
                    //     cantidadProducto: textController.toString()));

                    FacturaDetalle.getFacturaDetalle().add(FacturaDetalle(
                        facturaNumero: "1",
                        codigoProducto: 'test',
                        montoproducto: 155.2,
                        nombreProducto: 'test',
                        cantidadProducto: "10"));

                    // Productos.getProductos().add(Productos(codigoProducto: codigoProducto, nombreProducto: nombreProducto, descripcionProducto: descripcionProducto, precioProducto: precioProducto))
                  },
                  child: Text('Agregar'),
                ),
              )
            ],
          ),
          onTap: () {
            query = suggestion.nombreProducto;
          },
        );
      },
    );
  }
}
