import 'package:flutter/material.dart';

void main() {
 runApp(MyApp(movies: [
    Movie('Coraline', 'assets/images/coraline.jpg'),
  ]));
}

class MyApp extends StatelessWidget {
 final List<Movie> movies;

 MyApp({required this.movies});

 @override
 Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lista de Filmes'),
        ),
        body: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return _buildMovieCard(movies[index]);
          },
        ),
      ),
    );
 }

 Widget _buildMovieCard(Movie movie) {
    return ListTile(
      leading: Image.asset(
        movie.imageUrl,
        height: 100,
        width: 100,
        fit: BoxFit.cover,
      ),
      title: Text(
        movie.title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
 }
}

class Movie {
 final String title;
 final String imageUrl;

 Movie(this.title, this.imageUrl);
}