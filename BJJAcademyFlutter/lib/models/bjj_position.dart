import 'belt.dart';

class BjjPosition {
  final String id;
  final Belt belt;
  final String name;
  final int points;
  final String status;
  final String image;
  final String description;
  final List<String> criteria;
  final List<String> commonMistakes;

  const BjjPosition({
    required this.id,
    required this.belt,
    required this.name,
    required this.points,
    required this.status,
    required this.image,
    required this.description,
    required this.criteria,
    required this.commonMistakes,
  });
}
