import 'dart:convert';

import 'package:appmovie/UI/widgets/item_movie_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List movies = [];

  initState() {
    super.initState();
    getMovies();
  }

  getMovies() async {
    String _url =
        "https://api.themoviedb.org/3/movie/popular?api_key=5b6cf5e2308f7946d22206fb4e945700&language=es-ES&page=2";
    Uri _uri = Uri.parse(_url);
    http.Response _response = await http.get(_uri);
    if(_response.statusCode == 200){
      Map<String, dynamic> moviesMap = json.decode(_response.body);
      movies = moviesMap["results"];
      setState((){});
    }
  }

  @override
  Widget build(BuildContext context) {
    getMovies();

    return Scaffold(
      backgroundColor: Color(0xff1a232f),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bienvenido, Christian",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Descubre",
                            style: TextStyle(
                              height: 1.25,
                              fontSize: 38,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: Color(0xff0f79af),
                        shape: BoxShape.circle,
                      ),
                      child: const CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            "https://avatars.githubusercontent.com/u/1681236?v=4"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return ItemMovieWidget(
                      movieMap: movies[index],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
