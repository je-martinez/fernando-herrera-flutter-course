import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia_app/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MoviePosterLink extends StatelessWidget {
  final Movie movie;
  const MoviePosterLink({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: GestureDetector(
        onTap: () {
          context.push('/home/0/movie/${movie.id}');
        },
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              movie.posterPath,
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
