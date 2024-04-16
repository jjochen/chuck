import 'package:chuck/features/joke/domain/entities/joke.dart';

class JokeModel extends Joke {
  const JokeModel({
    required super.iconUrl,
    required super.id,
    required super.url,
    required super.value,
  });

  factory JokeModel.fromJson(Map<String, dynamic> json) {
    return JokeModel(
      iconUrl: json['icon_url'] as String,
      id: json['id'] as String,
      url: json['url'] as String,
      value: json['value'] as String,
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
