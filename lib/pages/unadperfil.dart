import 'package:flutter/material.dart';
import 'package:unad_app/helpers/utils.dart';

class UNADPerfil extends StatelessWidget {
  const UNADPerfil({Key? key}) : super(key: key);

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
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.account_circle, color: Utils.secondaryColor, size: 80),
            const Text('Roman Jaquez', textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Utils.secondaryColor.withOpacity(0.1)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.developer_board, color: Utils.secondaryColor, size: 30),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const[
                              Text('Carrera'),
                              Text('Ingeniería de Software',
                                style: TextStyle(color: Utils.secondaryColor, fontSize: 20)
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Icon(Icons.school, color: Utils.secondaryColor, size: 30),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const[
                              Text('Clases Registradas'),
                              Text('10 Clases',
                                style: TextStyle(color: Utils.secondaryColor, fontSize: 20)
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Icon(Icons.account_circle, color: Utils.secondaryColor, size: 30),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const[
                              Text('Estudiante Desde'),
                              Text('1/1/2022',
                                style: TextStyle(color: Utils.secondaryColor, fontSize: 20)
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                )
              ),
            )
          ],
        )
      )
    );
  }
}