import 'dart:convert';

import 'package:appmovie/UI/general/colors.dart';
import 'package:appmovie/UI/widgets/item_movie_widget.dart';
import 'package:appmovie/models/movie_model.dart';
import 'package:appmovie/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MovieModel> movies = [];

  initState() {
    super.initState();
    getData();
  }

  getData(){
    APIService _apiService = APIService();
    _apiService.getMovies().then((value) {
      movies = value;
      setState((){});
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
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
                        color: kBrandSecondaryColor,
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
                      movieModel: movies[index],
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
