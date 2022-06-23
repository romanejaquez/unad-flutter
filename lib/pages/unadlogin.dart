import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unad_app/helpers/utils.dart';
import 'package:unad_app/pages/unadhome.dart';
import 'package:unad_app/services/proxyservice.dart';
import 'package:unad_app/widgets/unadbutton.dart';

class UNADLogin extends StatefulWidget {
  const UNADLogin({Key? key}) : super(key: key);

  @override
  State<UNADLogin> createState() => _UNADLoginState();
}

class _UNADLoginState extends State<UNADLogin> {

  final TextEditingController usuarioText = TextEditingController(text: '');
  final TextEditingController pwText = TextEditingController(text: '');
  GlobalKey<FormState> formKey = GlobalKey();
  bool enableLogin = false;
  bool activateLock = false;

  void enableLoginEvent() {
    setState(() {
      enableLogin = usuarioText.text.isNotEmpty && pwText.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 50),
            Image.asset('assets/imgs/unadlogo.png', width: 80, height: 80),
            const SizedBox(height: 10),
            Text('Bienvenidos a', textAlign: TextAlign.center, style: TextStyle(fontSize: 25, color: Utils.mainColor)),
            Text('UNAD', textAlign: TextAlign.center, style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Utils.mainColor)),
            Text('Haga login usando\nlos campos proveidos', textAlign: TextAlign.center, style: TextStyle(fontSize: 15, color: Utils.secondaryColor)),
            Expanded(
              child: Center(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          enableLoginEvent();
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person_outline, color: Utils.mainColor),
                          labelText: 'Nombre de Usuario',
                          labelStyle: TextStyle(color: Utils.mainColor)
                        ),
                        controller: usuarioText,
                        validator: (value) {
                          return value!.isEmpty ? 'Required Field' : null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            activateLock = value.isNotEmpty;
                          });
                          enableLoginEvent();
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(activateLock ? Icons.lock_open_outlined : Icons.lock_outline, color: Utils.mainColor),
                          labelText: 'Contraseña',
                          labelStyle: TextStyle(color: Utils.mainColor)
                        ),
                        controller: pwText,
                        validator: (value) {
                          return value!.isEmpty ? 'Required Field' : null;
                        },
                      )
                    ],
                  )
                ),
              )
            ),
            UNADButton(
              label: 'Entrar',
              color: Utils.mainColor,
              isEnabled: enableLogin,
              onTap: () async {
                if (formKey.currentState!.validate()) {

                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => UNADHome())
                  );
                }
              },
            ),
            const SizedBox(height: 20),
            UNADButton(
              label: 'Registrate',
              color: Utils.secondaryColor,
              onTap: () {

              },
            ),
          ],
        )
      )
    );
  }
}