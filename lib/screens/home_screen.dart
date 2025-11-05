import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../widgets/movie_tile.dart';
import 'movie_detail_screen.dart';

/// Home Screen showing all movies.
class HomeScreen extends StatefulWidget {
  final List<Movie> movies;
  final Function(Movie) toggleFavorite;

  const HomeScreen({super.key, required this.movies, required this.toggleFavorite});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.movies.length,
      itemBuilder: (context, index) {
        final movie = widget.movies[index];
        return MovieTile(
          movie: movie,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetailScreen(
                  movie: movie,
                  onFavoriteToggle: () {
                    widget.toggleFavorite(movie);
                    setState(() {});
                  },
                ),
              ),
            );
          },
          onFavoriteToggle: () {
            widget.toggleFavorite(movie);
            setState(() {});
          },
        );
      },
    );
  }
}
