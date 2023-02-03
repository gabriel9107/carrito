import 'package:carrito/pantallas/login/createUser.dart';
import 'package:flutter/material.dart';

import '../../../servicios/db_helper.dart';
import '../../../servicios/login_form_provider.dart';

import '../../clases/ui/input_decorations.dart';
import '../../widgets/auth_background.dart';
import '../../widgets/card_container.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
            child: SingleChildScrollView(
      child: Column(children: [
        SizedBox(height: 350),
        CardContainer(
            child: Column(
          children: [
            SizedBox(height: 10),
            Text('Siga', style: Theme.of(context).textTheme.headline4),
            SizedBox(height: 15),
            Text('Sistema de Pedidos',
                style: Theme.of(context).textTheme.headline4),
            SizedBox(height: 10),
            Text('Login', style: Theme.of(context).textTheme.headline4),
            SizedBox(height: 30),
            ChangeNotifierProvider(
              create: (_) => LoginFormProvider(),
              child: _LoginForm(),
            )
            // _LoginForm()
          ],
        )),
        SizedBox(height: 50),
        TextButton(
            onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => createuser())),
            style: ButtonStyle(
                overlayColor:
                    MaterialStateProperty.all(Colors.indigo.withOpacity(0.1)),
                shape: MaterialStateProperty.all(StadiumBorder())),
            child: Text(
              'Crear una nueva cuenta',
              style: TextStyle(fontSize: 18, color: Colors.black87),
            )),
      ]),
    )

            // Container(
            //   width: double.infinity,
            //   height: 300,
            //   color: Colors.red,
            // ),
            ));
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(
          key: loginForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                    hintText: '40221025725',
                    labelText: 'Nombre de usuario',
                    prefixIcon: Icons.alternate_email_sharp),
                onChanged: (value) => loginForm.email = value,
              ),
              SizedBox(height: 30),
              TextFormField(
                autocorrect: false,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                    hintText: '********',
                    labelText: 'Contraseña',
                    prefixIcon: Icons.lock_outline),
                onChanged: (value) => loginForm.password = value,
                validator: (value) {
                  return (value != null && value.length >= 6)
                      ? null
                      : 'La contraseña debe de ser de 6 caracteres';
                },
              ),
              SizedBox(height: 50),
              MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  disabledColor: Colors.grey,
                  elevation: 0,
                  color: Colors.deepPurple,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    child:
                        Text('Ingresar', style: TextStyle(color: Colors.white)),
                  ),
                  onPressed: () {
                    // falta la validacion con el usuario

                    var errorMessage = DatabaseHelper.instance
                        .getLogin(loginForm.email, loginForm.password);
                    Navigator.pushReplacementNamed(context, 'home');
                  }),
            ],
          )),
    );
  }
}
