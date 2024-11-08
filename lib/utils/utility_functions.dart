// File: lib/utils/utility_functions.dart
import 'dart:math';

/// Generates a random transaction ID consisting of 12 characters.
/// The ID is made up of uppercase letters and digits.
String generateRandomTransactionId() {
  const String characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  const int length = 12;
  final Random random = Random();
  return List.generate(
      length, (index) => characters[random.nextInt(characters.length)]).join();
}
