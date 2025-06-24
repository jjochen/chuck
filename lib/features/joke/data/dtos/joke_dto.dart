import 'package:chuck/core/core.dart';
import 'package:chuck/features/joke/domain/entities/joke.dart';

class JokeDto extends Joke {
  const JokeDto({
    required super.iconUrl,
    required super.id,
    required super.url,
    required super.value,
  });

  factory JokeDto.fromJson(Map<String, dynamic> json) {
    return JokeDto(
      iconUrl: json.get<String>('icon_url'),
      id: json.get<String>('id'),
      url: json.get<String>('url'),
      value: json.get<String>('value'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'icon_url': iconUrl,
      'id': id,
      'url': url,
      'value': value,
    };
  }
}
