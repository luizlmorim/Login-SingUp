import 'package:flutter/material.dart';

void main() {
 runApp(MyApp());
}

class Movie {
  String title;
  String imageUrl;

  Movie(this.title, this.imageUrl);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Movie> favorites = [];
  List<Movie> watched = [];
  List<Movie> toWatch = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Lists App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildList("Favoritos", favorites),
            _buildList("Assistidos", watched),
            _buildList("Por Assistir", toWatch),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddMovieDialog(context),
        tooltip: 'Adicionar Filme',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildList(String title, List<Movie> movies) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Container(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildMovieCard(movies[index]),
              );
            },
          ),
        ),
        Divider(),
      ],
    );
  }

  Widget _buildMovieCard(Movie movie) {
    return Container(
      width: 150,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                movie.imageUrl,
                height: 100,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Lógica para adicionar aos favoritos
                        },
                        child: Text('Favoritos'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Lógica para marcar como assistido
                        },
                        child: Text('Assistido'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Lógica para mover para "Por Assistir"
                        },
                        child: Text('Por Assistir'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showAddMovieDialog(BuildContext context) async {
    TextEditingController titleController = TextEditingController();
    TextEditingController imageUrlController = TextEditingController();

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Adicionar Filme'),
          content: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Título do Filme'),
              ),
              TextField(
                controller: imageUrlController,
                decoration: InputDecoration(labelText: 'Nome do arquivo da Imagem'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  final movie = Movie(
                    titleController.text,
                    'assets/images/${imageUrlController.text}', // Caminho para a imagem local
                  );
                  toWatch.add(movie);
                });
                Navigator.of(context).pop();
              },
              child: Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }
}



