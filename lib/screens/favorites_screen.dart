import 'package:flutter/material.dart';
/// FavoritesScreen: lists movies the user marked as favorites (edited for PR).
import '../models/movie.dart';
import '../widgets/movie_tile.dart';
import 'movie_detail_screen.dart';

/// Displays user's favorite movies only.
class FavoritesScreen extends StatelessWidget {
  final List<Movie> movies;
  final Function(Movie) toggleFavorite;

  const FavoritesScreen({super.key, required this.movies, required this.toggleFavorite});

  @override
  Widget build(BuildContext context) {
    final favoriteMovies = movies.where((m) => m.isFavorite).toList();

    if (favoriteMovies.isEmpty) {
      return const Center(child: Text("No favorites added yet."));
    }

    return ListView.builder(
      itemCount: favoriteMovies.length,
      itemBuilder: (context, index) {
        final movie = favoriteMovies[index];
        return MovieTile(
          movie: movie,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetailScreen(
                  movie: movie,
                  onFavoriteToggle: () => toggleFavorite(movie),
                ),
              ),
            );
          },
          onFavoriteToggle: () => toggleFavorite(movie),
        );
      },
    );
  }
}
