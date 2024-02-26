import 'package:flutter/material.dart';
import './movies_card.dart';
import './movies_class.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Movieclass> _moviesList = [
    Movieclass(
      "John Wick",
      "John Wick is an American action thriller media franchise created by Derek Kolstad and centered around John Wick, a former hitman who is forced back into the criminal underworld he had previously abandoned",
    ),
    Movieclass(
      "Smile",
      "Smile is a psychological horror movie about a therapist, Dr. Rose Cotter, who witnesses a patient's suicide and becomes haunted by a presence that shows itself in people's faces with a sinister smile123. The movie explores themes of trauma, mental health, and curse, and features extreme gore, violence, and jump scares",
    ),
    Movieclass(
      "Silent Voice",
      "When a grade school student with impaired hearing is bullied mercilessly, she transfers to another school. Years later, one of her former tormentors sets out to make amends.",
    ),
    Movieclass(
      "Dark Desire",
      "Dark Desire or Oscuro Deseo is a story of Alma (Maite Perroni), a woman married to Leonardo (Jorge Poza). The couple has a teenage daughter. One day, Alma spends her weekend with best friend, Brenda. She doubts Leo is having an affair with his secretary. Brenda tells her what stops her from having fun if Leo is doing what he wants to.",
    ),
  ];

  final titleTextController = TextEditingController();
  final descriptionTextController = TextEditingController();

  late Movieclass newMovie;

  void submit() {
    newMovie = Movieclass(
      titleTextController.text,
      descriptionTextController.text,
    );

    setState(() {
      _moviesList.add(newMovie);
    });

    Navigator.of(context).pop();

    titleTextController.text = '';
    descriptionTextController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.person_4),
        centerTitle: true,
        elevation: 7.0,
        title: const Text("Favorite Movies"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
              children: _moviesList.map((movie) {
            return MovieInfoCard(movie);
          }).toList()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog<Movieclass>(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Movie Info"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    autofocus: true,
                    decoration: InputDecoration(hintText: 'Title'),
                    controller: titleTextController,
                  ),
                  TextField(
                    autofocus: true,
                    decoration:
                        InputDecoration(hintText: 'Enter Description Here'),
                    controller: descriptionTextController,
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: submit,
                  child: Text("Add"),
                  style: TextButton.styleFrom(
                      shape: CircleBorder(eccentricity: 0.8),
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.blue),
                ),
              ],
            ),
          );
        },
        child: Icon(
          Icons.add_sharp,
          color: Colors.black,
          size: 38,
        ),
        backgroundColor: Color.fromRGBO(204, 255, 204, 0.7),
      ),
    );
  }
}
