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
      iconUrl: json['icon_url'],
      id: json['id'],
      url: json['url'],
      value: json['value'],
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
