import 'package:ejercicio_clima/src/pages/clima_ciudad.dart';
import 'package:ejercicio_clima/src/pages/clima_cordenadas.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta Clima'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ClimateByCoordinatesScreen()),
                );
              },
              child:const Text('Consultar por Coordenadas'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ClimateByCityScreen()),
                );
              },
              child:const Text('Consultar por Ciudad'),
            ),
          ],
        ),
      ),
    );
  }
}
