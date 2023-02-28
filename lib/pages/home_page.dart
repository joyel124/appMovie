import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

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
                Container(
                  height: height * 0.60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://i.pinimg.com/474x/5c/37/45/5c3745dfcb150e4753bdc9c99020dd2e--minions-trailer-minion-movie.jpg"),
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
                            color: Color(0xff1a232f).withOpacity(0.7),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Minions",
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
                                  color: Color(0xff0f79af),
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(20)),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Ganadarora de varios premios y  nominaciones, dirigida por Pierre Coffin y Kyle Balda, escrita por Brian Lynch y producida por Chris Meledandri y Janet Healy. Es la primera película de la franquicia de Minions y la tercera película de la franquicia de Los Minions, después de Minions (2015) y Mi Villano Favorito 3 (2017).",
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
                                        "2015",
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
                                        "150",
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
                            "8.5",
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
