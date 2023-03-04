import 'package:appmovie/models/cast_model.dart';
import 'package:flutter/material.dart';

class ItemCastWidget extends StatelessWidget {

  CastModel castModel;

  ItemCastWidget({
    required this.castModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      //width: 60,
      //height: 70,
      decoration: BoxDecoration(
        //color: Colors.white.withOpacity(0.8),
        borderRadius: const BorderRadius.all(
            Radius.circular(10)),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage( castModel.profilePath == null ? 'https://www.woolha.com/media/2020/03/eevee.png' :
                'https://image.tmdb.org/t/p/original/${castModel.profilePath}'),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              castModel.name.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
