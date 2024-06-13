import 'package:cinemapedia_app/presentation/providers/movies/movies_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final nowPlayingEmpty = ref.watch(nowPlayingMoviesProvider).isEmpty;
  final popularEmpty = ref.watch(popularMoviesProvider).isEmpty;
  final upcomingEmpty = ref.watch(upcomingMoviesProvider).isEmpty;
  final topRatedEmpty = ref.watch(topRatedMoviesProvider).isEmpty;
  if (nowPlayingEmpty || popularEmpty || upcomingEmpty || topRatedEmpty) {
    return true;
  }
  return false;
});
