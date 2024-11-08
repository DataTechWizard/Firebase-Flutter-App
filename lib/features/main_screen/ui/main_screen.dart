import 'package:flutter/material.dart';
import './event_buttons_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Tracking Demo Home Page'),
      ),
      body: const EventButtonsWidget(),
    );
  }
}
