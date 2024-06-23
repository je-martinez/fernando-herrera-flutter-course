import 'package:cinemapedia_app/domain/entities/actor.dart';
import 'package:cinemapedia_app/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast member) => Actor(
      id: member.id,
      name: member.name,
      profilePath: member.profilePath == null
          ? 'https://qph.cf2.quoracdn.net/main-qimg-6d72b77c81c9841bd98fc806d702e859-lq'
          : 'https://image.tmdb.org/t/p/w500/${member.profilePath}',
      character: member.character);
}
