import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ClimateByCityScreen extends StatefulWidget {
  @override
  _ClimateByCityScreenState createState() => _ClimateByCityScreenState();
}

class _ClimateByCityScreenState extends State<ClimateByCityScreen> {
  final TextEditingController cityController = TextEditingController();
  String weatherInfo = '';

  Future<void> fetchWeatherByCity(String city) async {
    final apiKey = '5f742fffec2a3d3c24590dc2b39e3863';
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric');
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
        title: Text('Clima por Ciudad'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: cityController,
              decoration: InputDecoration(labelText: 'Nombre de la Ciudad'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final city = cityController.text;
                if (city.isNotEmpty) {
                  fetchWeatherByCity(city);
                }
              },
              child: Text('Consultar Clima'),
            ),
            SizedBox(height: 20),
            Text(weatherInfo),
          ],
        ),
      ),
    );
  }
}
