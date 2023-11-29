import '../../domain/entities/movie_credit_entity.dart';

class MovieCreditModel extends MovieCreditEntity {
  const MovieCreditModel({
    name,
    profileUrl,
  }) : super(
          name: name,
          profileUrl: profileUrl,
        );

  factory MovieCreditModel.fromMap(Map<String, dynamic> map) =>
      MovieCreditModel(
        name: map['name'] ?? map['original_name'],
        profileUrl: map['profile_path'] ?? '',
      );
}
