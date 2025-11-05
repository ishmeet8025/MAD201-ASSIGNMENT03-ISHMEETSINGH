import 'package:flutter/material.dart';
import '../models/movie.dart';

/// Detail Screen displaying selected movie info.
class MovieDetailScreen extends StatefulWidget {
  final Movie movie;
  final VoidCallback onFavoriteToggle;

  const MovieDetailScreen({super.key, required this.movie, required this.onFavoriteToggle});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.movie.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(widget.movie.imagePath, height: 250),
            const SizedBox(height: 16),
            Text(widget.movie.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text("${widget.movie.genre} • ${widget.movie.year}"),
            const SizedBox(height: 10),
            Text(widget.movie.description),
            const Spacer(),
            IconButton(
              icon: Icon(
                widget.movie.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
                size: 36,
              ),
              onPressed: () {
                setState(() {
                  widget.movie.isFavorite = !widget.movie.isFavorite;
                });
                widget.onFavoriteToggle();
              },
            ),
          ],
        ),
      ),
    );
  }
}
