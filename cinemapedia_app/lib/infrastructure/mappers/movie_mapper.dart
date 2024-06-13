import 'package:cinemapedia_app/domain/entities/movie.dart';
import 'package:cinemapedia_app/infrastructure/models/moviedb/movie_details.dart';
import 'package:cinemapedia_app/infrastructure/models/moviedb/movie_moviedb.dart';

// ignore: constant_identifier_names
enum MovieDefaults { no_poster }

const String notFoundImage =
    'https://img.freepik.com/vector-gratis/poster-error-404-pagina-no-encontrada-usar-sitio-web_1284-49337.jpg';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB movie) => Movie(
      adult: movie.adult,
      backdropPath: movie.backdropPath != ""
          ? 'https://image.tmdb.org/t/p/w500/${movie.backdropPath}'
          : notFoundImage,
      genreIds: movie.genreIds.map((e) => e.toString()).toList(),
      id: movie.id,
      originalLanguage: movie.originalLanguage,
      originalTitle: movie.originalTitle,
      overview: movie.overview,
      popularity: movie.popularity,
      posterPath: movie.posterPath != ""
          ? 'https://image.tmdb.org/t/p/w500/${movie.posterPath}'
          : MovieDefaults.no_poster.name,
      releaseDate: movie.releaseDate,
      title: movie.title,
      video: movie.video,
      voteAverage: movie.voteAverage,
      voteCount: movie.voteCount);
  static Movie movieDBDetailsToMovie(MovieDetails movie) => Movie(
      adult: movie.adult,
      backdropPath: movie.backdropPath != ""
          ? 'https://image.tmdb.org/t/p/w500/${movie.backdropPath}'
          : notFoundImage,
      genreIds: movie.genres.map((e) => e.name.toString()).toList(),
      id: movie.id,
      originalLanguage: movie.originalLanguage,
      originalTitle: movie.originalTitle,
      overview: movie.overview,
      popularity: movie.popularity,
      posterPath: movie.posterPath != ""
          ? 'https://image.tmdb.org/t/p/w500/${movie.posterPath}'
          : MovieDefaults.no_poster.name,
      releaseDate: movie.releaseDate,
      title: movie.title,
      video: movie.video,
      voteAverage: movie.voteAverage,
      voteCount: movie.voteCount);
}
