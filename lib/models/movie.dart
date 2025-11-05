/// Course: F2025 MAD201‑01
/// Assignment 3 – Movie Explorer App
/// Student: [Your Full Name, Student ID]
/// Description: Movie model class with favorite status.

class Movie {
  final String title;
  final String genre;
  final int year;
  final String description;
  final String imagePath;
  bool isFavorite;

  Movie({
    required this.title,
    required this.genre,
    required this.year,
    required this.description,
    required this.imagePath,
    this.isFavorite = false,
  });
}
