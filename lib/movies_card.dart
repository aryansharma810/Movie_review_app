import 'package:flutter/material.dart';

import './movies_class.dart';

class MovieInfoCard extends StatelessWidget {
  final Movieclass _movie;

  const MovieInfoCard(this._movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(153, 0, 255, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: Image.asset(
              'images/bg1.jpg',
              fit: BoxFit.cover,
              height: 300,
              width: double.infinity,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _movie.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(
                  color: Color.fromRGBO(255, 102, 153, 0.5),
                ),
                Text(_movie.Description,
                    style: TextStyle(
                      color: Color.fromARGB(219, 255, 255, 255),
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
