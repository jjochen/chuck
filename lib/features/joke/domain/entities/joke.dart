import 'package:equatable/equatable.dart';

class Joke extends Equatable {
  const Joke({
    required this.iconUrl,
    required this.id,
    required this.url,
    required this.value,
  });

  final String iconUrl;
  final String id;
  final String url;
  final String value;

  @override
  List<Object?> get props => [
        iconUrl,
        id,
        url,
        value,
      ];
}
