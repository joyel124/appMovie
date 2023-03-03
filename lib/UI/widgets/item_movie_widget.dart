import 'package:flutter/material.dart';

import '../../models/movie_model.dart';
import '../general/colors.dart';

class ItemMovieWidget extends StatelessWidget {

  MovieModel movieModel;

  ItemMovieWidget({
    required this.movieModel,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      height: height * 0.60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              "https://image.tmdb.org/t/p/original/${movieModel.posterPath}"),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: const Offset(0, 5),
            blurRadius: 12,
          ),
        ],
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: kBrandPrimaryColor.withOpacity(0.7),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movieModel.title,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 100,
                    height: 3.2,
                    decoration: BoxDecoration(
                      color: kBrandSecondaryColor,
                      borderRadius:
                      const BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    movieModel.overview,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            size: 15,
                            Icons.calendar_today,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            movieModel.releaseDate.toString().substring(0,10),
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            size: 15,
                            Icons.thumb_up,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            movieModel.voteCount.toString(),
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xff0f79af),
                shape: BoxShape.circle,
              ),
              child: Text(
                movieModel.voteAverage.toString(),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
