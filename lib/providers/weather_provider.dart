import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/weather.dart';
import '../services/weather_service.dart';

class WeatherProvider with ChangeNotifier {
  Weather? _weather;
  bool _isLoading = false;
  String? _error;

  Weather? get weather => _weather;
  bool get isLoading => _isLoading;
  String? get error => _error;

  final WeatherService _weatherService = WeatherService();

  WeatherProvider() {
    _loadLastSearchedCity();
  }

  Future<void> fetchWeather(String cityName) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _weather = await _weatherService.fetchWeather(cityName);
      _saveLastSearchedCity(cityName);
    } catch (e) {
      _error = 'Failed to fetch weather. Please try again later.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _saveLastSearchedCity(String cityName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('last_searched_city', cityName);
  }

  Future<void> _loadLastSearchedCity() async {
    final prefs = await SharedPreferences.getInstance();
    final cityName = prefs.getString('last_searched_city');
    if (cityName != null) {
      await fetchWeather(cityName);
    }
  }
}
