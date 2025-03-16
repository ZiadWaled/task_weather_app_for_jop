// search_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_weather_app/features/weather/presentation/bloc/weather/weather_bloc.dart';
import 'package:task_weather_app/features/weather/presentation/bloc/weather/weather_events.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 200), () {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                focusNode: _focusNode,
                textInputAction: TextInputAction.search,
                style: const TextStyle(fontSize: 18, color: Colors.black),
                onSubmitted: (value) async {
                  if (value.trim().isNotEmpty) {
                    context.read<WeatherBloc>().add(GetWeatherEvent(cityName: value));
                    Navigator.pop(context);
                  }
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  hintText: 'Enter city name',
                  label: const Text(
                    'City Name',
                    style: TextStyle(color: Colors.green),
                  ),
                  hintStyle: const TextStyle(color: Colors.black),
                  prefixIcon: const Icon(Icons.insert_chart_outlined_sharp, color: Colors.green),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search_rounded, color: Colors.green, size: 28),
                    onPressed: () {
                      if (_searchController.text.trim().isNotEmpty) {
                        context.read<WeatherBloc>().add(
                          GetWeatherEvent(cityName: _searchController.text),
                        );
                        Navigator.pop(context);
                      }
                    },
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.green, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.green, width: 2),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.green, width: 2),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Enter a city name to get\nthe latest weather information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.red,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}