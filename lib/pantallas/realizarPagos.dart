import 'package:carrito/clases/detalleDePago.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class realizarPagos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forms'),
      ),
      body: PaymentForm(), // We'll add this in a bit
    );
  }
}

class PaymentForm extends StatefulWidget {
  @override
  _PaymentFormState createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  TextEditingController fechaDeChequeController = TextEditingController();
  TextEditingController formaDepagoController = TextEditingController();
  TextEditingController tipoPagoController = TextEditingController();
  TextEditingController valorController = TextEditingController();
  TextEditingController numeroChequeController = TextEditingController();

  List<formaDePago> _formadePagoL = formaDePago.getformadePago();
  var _selectedvalue;

  PagosDetails _cardDetails = new PagosDetails();

  List<entidadBancaria> _entidadBancaria = entidadBancaria.getentidadBancaria();
  var _selectedValueformadePago;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Container(
        padding: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField(
                      value: _selectedValueformadePago,
                      items: _formadePagoL
                          .map(
                            (e) => DropdownMenuItem(
                              child: Text(e.nombre),
                              value: e.id,
                            ),
                          )
                          .toList(),
                      hint: const Text("Forma de Pago"),
                      onChanged: ((value) {
                        setState(() {
                          _selectedvalue = value;
                        });
                      }),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: _selectedvalue,
                      items: _entidadBancaria
                          .map(
                            (e) => DropdownMenuItem(
                              child: Text(e.nombre),
                              value: e.id,
                            ),
                          )
                          .toList(),
                      hint: const Text("Forma de Pago"),
                      onChanged: ((value) {
                        setState(() {
                          _selectedvalue = value;
                        });
                      }),
                    ),
                  )
                ],
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Valor Pago', icon: Icon(Icons.account_circle)),
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Numero Cheque',
                    icon: Icon(Icons.account_circle)),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Fecha cheque',
                  icon: Icon(Icons.calendar_today),
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(), //get today's date
                      firstDate: DateTime(
                          2000), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101));
                  if (pickedDate != null) {
                    print(pickedDate);
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(formattedDate);

                    setState(() {
                      fechaDeChequeController.text = formattedDate;
                    });
                  } else {
                    print("Date is not selected");
                  }
                },
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 15.5, bottom: 15.5),
        child: Row(children: <Widget>[
          ElevatedButton(
            child: const Text('Finalizar Pago'),
            onPressed: () {
              print("puta");
            },
            // onPressed: () async {
            // await DatabaseHelper.instance.Add(Customers(
            //     CustomerCode: customerCodeController.text,
            //     CustomerName: customerNameController.text,
            //     CustomerDir: customerDirController.text,
            //     Phone1: phone1Controller.text,
            //     Phone2: phone2Controller.text,
            //     Comment1: commentController.text));

            style: ElevatedButton.styleFrom(
                textStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                    fontWeight: FontWeight.bold)),
          ),
        ]),
      ),
    ]);
  }
}

class PagosDetails {}
