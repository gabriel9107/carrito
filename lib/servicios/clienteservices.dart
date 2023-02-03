import 'dart:convert';

import 'package:carrito/servicios/modeloclientes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ClienteServices extends ChangeNotifier {
  final String _baseUrl = 'sigaapp-127c4-default-rtdb.firebaseio.com';

  final List<Clientes> clientes = [];
  bool isLoading = true;

  ClienteServices() {
    this.loadClientes();
  }

  Future loadClientes() async {
    final url = Uri.https(_baseUrl, 'Clientes.json');
    final resp = await http.get(url);

    final List<Map<String, dynamic>> clienteMap = json.decode(resp.body);

    // clienteMap.forEach((key, value) {
    //   final temCliente = Clientes.fromJson(value);
    //   // temCliente.id = key;
    //   this.clientes.add(temCliente);
    // });
    // return this.clientes;
  }
}
