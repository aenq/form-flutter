import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:email_validator/email_validator.dart';

class Login extends StatefulWidget {

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController controllerNPM = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  void kirimdata() {
    AlertDialog alertDialog = AlertDialog(
        content: Container(
          height: 200.0,
          child: Column(
            children: <Widget>[
              Text("NPM : ${controllerNPM.text}"),
              Text("Email : ${controllerEmail.text}"),
              Text("Password : ${controllerPassword.text}"),
              ElevatedButton(onPressed: () => Navigator.pop(context), child: Text("OK"))
            ],
          ),
        )
    );



    final EmailValidator = ValidationBuilder().email().minLength(50).build();
    final NPMValidator = ValidationBuilder().minLength(9).build();
    final PasswordValidator = ValidationBuilder().maxLength(20).build();


    showDialog(context: context, builder: (context) => AlertDialog(content: alertDialog));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Form(
        child: Column(
          children: <Widget> [
            Padding(padding: EdgeInsets.all(20.0)),
            TextFormField(

                controller: controllerNPM,
                decoration: InputDecoration(
                    hintText: "NPM",
                    labelText: "NPM",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    )
                )
            ),
            Padding(padding: EdgeInsets.only(top: 20.0),),
            TextFormField(
                validator: ValidationBuilder().email().maxLength(50).build(),
                controller: controllerEmail,
                decoration: InputDecoration(
                    hintText: "Email",
                    labelText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    )
                )
            ),
            Padding(padding: EdgeInsets.only(top: 20.0),),
            TextFormField(
                controller: controllerPassword,
                decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    )
                )
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            ElevatedButton(
                onPressed: () { kirimdata(); },
                child: const Text("Kirim"))
          ],
        ),
      ),
    );
  }
}
