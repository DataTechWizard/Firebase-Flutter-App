import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'features/main_screen/ui/event_buttons_widget.dart'; // Import the refactored widget

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Ensure Firebase is initialized
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Tracking Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(), // Point to your main screen widget
    );
  }
}

// Define the MainScreen to wrap EventButtonsWidget
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Tracking Demo'),
      ),
      body: const EventButtonsWidget(), // Integrate your refactored widget
    );
  }
}
