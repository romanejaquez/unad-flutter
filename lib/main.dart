import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:unad_app/helpers/utils.dart';
import 'package:unad_app/services/proxyservice.dart';

void main() {
  runApp(
     MultiProvider(
       providers: [
         ChangeNotifierProvider(
           create: (_) => AsignaturaService(),
         )
       ],
       child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  UNADApp()
      )  
     )
  );
}

class UNADApp extends StatefulWidget {
  const UNADApp({Key? key}) : super(key: key);

  @override
  State<UNADApp> createState() => _UNADAppState();
}

class _UNADAppState extends State<UNADApp> {

  late Timer timer;

  @override 
  void initState() {
    super.initState();

    timer = Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => UNADLogin())
      );
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      body: Stack( 
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/imgs/unadlogo.png'),
                Image.asset('assets/imgs/unadlogotext.png'),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: CircularProgressIndicator(
                    strokeWidth: 5,
                    valueColor: AlwaysStoppedAnimation(Utils.mainColor.withOpacity(0.5)),
                  )
                )
              ],
            ),
          ),
          Positioned(
            bottom: -220,
            left: (MediaQuery.of(context).size.width * .5) * -1,
            child: Transform.rotate(
              angle: .2,
              child: Container(
                width: MediaQuery.of(context).size.width * 2,
                height: 300,
                color: Utils.mainColor
              ),
            ),
          ),
          Positioned(
            bottom: -190,
            left: (MediaQuery.of(context).size.width * .5) * -1,
            child: Transform.rotate(
              angle: .15,
              child: Container(
                width: MediaQuery.of(context).size.width * 2,
                height: 300,
                color: Utils.mainColor.withOpacity(0.75)
              ),
            ),
          ),
          Positioned(
            bottom: -160,
            left: (MediaQuery.of(context).size.width * .5) * -1,
            child: Transform.rotate(
              angle: .1,
              child: Container(
                width: MediaQuery.of(context).size.width * 2,
                height: 300,
                color: Utils.mainColor.withOpacity(0.5)
              ),
            ),
          )
        ],
      )
    );
  }
}

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
            SvgPicture.asset('assets/imgs/forest.svg', width: 80, height: 80),
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

                  var posts = await ProxyService.sendPost();
                  
                  if (posts.length > 0) {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => UNADHome())
                    );
                  }
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

class UNADButton extends StatelessWidget {

  final String label;
  final Color color;
  final IconData? icon;
  final bool? isEnabled;
  Function onTap;

  UNADButton({super.key, 
    required this.label, 
    required this.color, 
    this.icon,
    this.isEnabled = true,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isEnabled!) {
          onTap();
        }
      } ,
      child: Opacity(
        opacity: isEnabled! ? 1 : 0.5,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50)
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              icon != null ? Align(alignment: Alignment.centerLeft, child: Icon(icon, color: Colors.white)) : const SizedBox(height: 25),
              Align(
                alignment: Alignment.center,
                child: Text(label, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class UNADHome extends StatelessWidget {
  const UNADHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Utils.secondaryColor),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset('assets/imgs/unadlogo.png', width: 30, height: 30),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: const Icon(Icons.notifications, size: 30, color: Utils.secondaryColor)
          )
        ],
      ),
      drawer: Drawer(
        child: Container(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hola,', style: TextStyle(color: Utils.mainColor, fontSize: 20)),
            Text('Roman Jaquez', style: TextStyle(color: Utils.mainColor, fontWeight: FontWeight.bold, fontSize: 25)),
            const SizedBox(height: 10),
            UNADButton(
              icon: Icons.account_circle,
              label: 'Ver Mi Perfil', color: Utils.secondaryColor, onTap: () {

            }),
            const SizedBox(height: 20),
            ColoredBox(
              color: Utils.mainColor.withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: const [
                    Icon(Icons.school, color: Utils.secondaryColor),
                    SizedBox(width: 10),
                    Text('Mis Clases', style: TextStyle(fontSize: 20, color: Utils.secondaryColor, fontWeight: FontWeight.bold))
                  ],
                )
              ),
            ),
            const ListaDeAsignaturas()
          ]
        )
      )
    );
  }
}

class Asignatura {

  String id;
  String nombre;
  String descripcion;
  String clave;
  String prerequisito;
  bool anadida;

  Asignatura({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.clave,
    required this.prerequisito,
    required this.anadida
  });

  factory Asignatura.fromJSON(Map<String, dynamic> json) {

    return Asignatura(
      id: json['id'],
      nombre: json['nombre'], 
      descripcion: json['descripcion'], 
      clave: json['clave'], 
      prerequisito: json['prerequisito'], 
      anadida: json['anadida']
    );
  }
}

class AsignaturaService extends ChangeNotifier {

  List<Asignatura> asignaturas = Utils.getAsignaturas();

  void addAsignatura(String id) {
    var asignatura = asignaturas.where((a) => a.id == id).first;
    asignatura.anadida = !asignatura.anadida;
    notifyListeners();
  }
}

class ListaDeAsignaturas extends StatelessWidget {
  const ListaDeAsignaturas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AsignaturaService>(
      builder: (context, service, child) {
        return Expanded(
          child: ListView.builder(
            itemCount: service.asignaturas.length,
            itemBuilder: (context, index) {

              var asignatura = service.asignaturas[index];

              return Material(
                color: Colors.transparent,
                child: InkWell(
                  highlightColor: Utils.mainColor.withOpacity(0.1),
                  splashColor: Utils.secondaryColor.withOpacity(0.1),
                  onTap: () {
                    service.addAsignatura(asignatura.id);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.class_, color: Utils.mainColor),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(asignatura.nombre.toUpperCase(), style: TextStyle(color: Utils.mainColor, fontWeight: FontWeight.bold)),
                              Text(asignatura.clave)
                            ],
                          ),
                        ),
                        Icon(asignatura.anadida ? Icons.check_circle : Icons.circle_outlined, color: Utils.secondaryColor),
                        Icon(Icons.chevron_right, color: Colors.grey)
                      ],
                    ),
                  ),
                ),
              );
            }
          ),
        );
      }
    );
  }
}