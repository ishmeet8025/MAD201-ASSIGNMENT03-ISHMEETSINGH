import 'package:flutter/material.dart';
import '../models/movie.dart';

/// A reusable widget that displays movie info in a card/tile format.
class MovieTile extends StatelessWidget {
  final Movie movie;
  final VoidCallback onTap;
  final VoidCallback onFavoriteToggle;

  const MovieTile({
    super.key,
    required this.movie,
    required this.onTap,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ListTile(
        leading: Image.asset(movie.imagePath, width: 50, fit: BoxFit.cover),
        title: Text(movie.title),
        subtitle: Text("${movie.genre} • ${movie.year}"),
        trailing: IconButton(
          icon: Icon(
            movie.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: Colors.red,
          ),
          onPressed: onFavoriteToggle,
        ),
        onTap: onTap,
      ),
    );
  }
}
