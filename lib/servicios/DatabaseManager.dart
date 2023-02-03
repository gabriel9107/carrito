import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

getDataFromDatabase() async {
  var value = FirebaseDatabase.instance.reference();
  var getValue = await value.child('Clientes').once();

  print('prueba en la data');

  print(getValue);
  return getValue;
}
