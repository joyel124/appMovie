import 'package:appmovie/UI/general/colors.dart';
import 'package:appmovie/UI/widgets/item_cast_widget.dart';
import 'package:appmovie/models/movie_model.dart';
import 'package:flutter/material.dart';

import '../models/cast_model.dart';
import '../models/movie_detail_model.dart';
import '../services/api_service.dart';

class DetailPage extends StatefulWidget {
  int movieId;

  DetailPage({
    required this.movieId,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<CastModel> casts = [];
  final APIService _apiService = APIService();
  MovieDetailModel? movieDetailModel;
  bool isloading = true;

  initState() {
    super.initState();
    getData();
  }

  getData() {
    _apiService.getCastsByMovie(widget.movieId).then((value) {
      if (value != null) {
        casts = value;
        //isloading = false;
        setState(() {});
      }
    });
    _apiService.getMovie(widget.movieId).then((value) {
      if (value != null) {
        movieDetailModel = value;
        isloading = false;
        setState(() {});
      }
    });
    //setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: !isloading ? CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            backgroundColor: kBrandSecondaryColor,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(movieDetailModel!.title),
              centerTitle: true,
              background: Image.network(
                'https://image.tmdb.org/t/p/original//${movieDetailModel!.backdropPath}',
                fit: BoxFit.cover,
              ),
            ),
            pinned: true,
            floating: true,
            snap: false,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              width: double.infinity,
              height: height,
              color: kBrandPrimaryColor,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/original/${movieDetailModel!.posterPath}'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Icon(
                                Icons.calendar_today,
                                color: Colors.white,
                                size: 13,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                movieDetailModel!.releaseDate
                                    .toString()
                                    .substring(0, 10),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                            ]),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              movieDetailModel!.title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 13,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  movieDetailModel!.popularity.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Resumen',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 3.2,
                    decoration: BoxDecoration(
                      color: kBrandSecondaryColor,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    movieDetailModel!.overview,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.link,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Home Page',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              kBrandSecondaryColor),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Géneros',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 3.2,
                    decoration: BoxDecoration(
                      color: kBrandSecondaryColor,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: movieDetailModel!.genres
                          .map((e) => Container(
                                margin: const EdgeInsets.only(right: 10),
                                //width: 60,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.8),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                ),
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    e.name,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //géneros
                  Text(
                    'Elenco',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 3.2,
                    decoration: BoxDecoration(
                      color: kBrandSecondaryColor,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: casts
                          .map((e) => ItemCastWidget(castModel: e)).toList(),
                  ),
                  ),
                ],
              ),
            ),
          ])),
        ],
      ) : Center(child: CircularProgressIndicator(),),
    );
  }
}
