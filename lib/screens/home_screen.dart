import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/components/DefField.dart';
import '../providers/weather_provider.dart';
import 'weather_details_screen.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Weather App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DefField(
              controller: _cityController,
              hint: "enter city name", 
              obsecure: false, 
              lable: "City"),
            const SizedBox(height: 30.0),
            Container(
              color: Colors.green,
              child: ElevatedButton(
                onPressed: () async {
                  if (_cityController.text.isNotEmpty) {
                    await context.read<WeatherProvider>().fetchWeather(_cityController.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WeatherDetailsScreen(),
                      ),
                    );
                  }
                },
                child: const Text('Search'),
              
              ),
            ),
            Consumer<WeatherProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return const CircularProgressIndicator();
                }
                if (provider.error != null) {
                  return Text(provider.error!);
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
