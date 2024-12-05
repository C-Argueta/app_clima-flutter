import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ClimateByCoordinatesScreen extends StatefulWidget {
  @override
  _ClimateByCoordinatesScreenState createState() =>
      _ClimateByCoordinatesScreenState();
}

class _ClimateByCoordinatesScreenState extends State<ClimateByCoordinatesScreen> {
  final TextEditingController latController = TextEditingController();
  final TextEditingController lonController = TextEditingController();
  String weatherInfo = '';

  Future<void> fetchWeatherByCoordinates(double lat, double lon) async {
    final carlos = '5f742fffec2a3d3c24590dc2b39e3863';
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$carlos&units=metric');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        weatherInfo =
            'Temperatura: ${data['main']['temp']}°C\nDescripción: ${data['weather'][0]['description']}';
      });
    } else {
      setState(() {
        weatherInfo = 'No se pudo obtener el clima.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clima por Coordenadas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: latController,
              decoration: const InputDecoration(labelText: 'Latitud'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: lonController,
              decoration: const InputDecoration(labelText: 'Longitud'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final lat = double.tryParse(latController.text);
                final lon = double.tryParse(lonController.text);

                if (lat != null && lon != null) {
                  fetchWeatherByCoordinates(lat, lon);
                }
              },
              child: const Text('Consultar Clima'),
            ),
             const SizedBox(height: 20),
            Text(weatherInfo),
          ],
        ),
      ),
    );
  }
}
