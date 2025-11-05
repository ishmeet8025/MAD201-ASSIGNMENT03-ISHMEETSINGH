import 'package:flutter/material.dart';
import 'models/movie.dart';
import 'screens/home_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/about_screen.dart';
import 'screens/contact_screen.dart';

void main() {
  runApp(const MovieApp());
}

/// Main App Widget
class MovieApp extends StatefulWidget {
  const MovieApp({super.key});

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  int _currentIndex = 0;

  final List<Movie> _movies = [
    Movie(
      title: "Inception",
      genre: "Sci-Fi",
      year: 2010,
      description: "A thief who steals corporate secrets through dream-sharing technology.",
      imagePath: "assets/posters/inception.jpg",
    ),
    Movie(
      title: "Interstellar",
      genre: "Adventure",
      year: 2014,
      description: "A team travels through a wormhole in space to ensure humanity's survival.",
      imagePath: "assets/posters/interstellar.jpg",
    ),
    Movie(
      title: "Avatar",
      genre: "Fantasy",
      year: 2009,
      description: "A marine becomes part of the Na'vi world on the moon Pandora.",
      imagePath: "assets/posters/avatar.jpg",
    ),
  ];

  void _toggleFavorite(Movie movie) {
    setState(() {
      movie.isFavorite = !movie.isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      HomeScreen(movies: _movies, toggleFavorite: _toggleFavorite),
      FavoritesScreen(movies: _movies, toggleFavorite: _toggleFavorite),
      const ProfileScreen(),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Explorer',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Scaffold(
        appBar: AppBar(title: const Text("Movie Explorer")),
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.deepPurple),
                child: Text("Menu", style: TextStyle(color: Colors.white, fontSize: 24)),
              ),
              ListTile(
                title: const Text("Home"),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MovieApp())),
              ),
              ListTile(
                title: const Text("About"),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutScreen())),
              ),
              ListTile(
                title: const Text("Contact Us"),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ContactScreen())),
              ),
            ],
          ),
        ),
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
