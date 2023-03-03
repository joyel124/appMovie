import 'package:appmovie/UI/general/colors.dart';
import 'package:appmovie/models/movie_model.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  MovieModel movieModel;

  DetailPage({
    required this.movieModel,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            backgroundColor: kBrandSecondaryColor,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(movieModel.title),
              centerTitle: true,
              background: Image.network(
                'https://image.tmdb.org/t/p/original//${movieModel.backdropPath}',
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
                                'https://image.tmdb.org/t/p/original/${movieModel.posterPath}'),
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
                                movieModel.releaseDate
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
                              movieModel.title,
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
                                  movieModel.popularity.toString(),
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
                    movieModel.overview,
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
                    decoration: BoxDecoration(
                      color: kBrandSecondaryColor,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
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
                    ),
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
                    height: 10,
                  ),
                  Row(
                    children: movieModel.genreIds
                        .map((e) => Container(
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.8),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Text(
                                e.toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                  const SizedBox(
                    height: 10,
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
                    height: 10,
                  ),
                  Row(
                    children: movieModel.genreIds
                        .map((e) => Container(
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.8),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Text(
                                e.toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ])),
        ],
      ),
    );
  }
}
