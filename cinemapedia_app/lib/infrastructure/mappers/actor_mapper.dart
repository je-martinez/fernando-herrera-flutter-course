import 'package:cinemapedia_app/domain/entities/actor.dart';
import 'package:cinemapedia_app/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast member) => Actor(
      id: member.id,
      name: member.name,
      profilePath: member.profilePath,
      character: member.character);
}
