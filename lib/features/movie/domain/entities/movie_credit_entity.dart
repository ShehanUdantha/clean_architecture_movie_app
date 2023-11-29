import 'package:equatable/equatable.dart';

class MovieCreditEntity extends Equatable {
  final String name;
  final String profileUrl;

  const MovieCreditEntity({
    required this.name,
    required this.profileUrl,
  });

  @override
  List<Object?> get props => [
        name,
        profileUrl,
      ];
}
