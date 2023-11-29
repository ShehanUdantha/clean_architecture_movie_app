import 'package:equatable/equatable.dart';

class ReviewEntity extends Equatable {
  final String id;
  final String authorName;
  final String avatarUrl;
  final double rating;
  final String content;
  final String createdTime;

  const ReviewEntity({
    required this.id,
    required this.authorName,
    required this.avatarUrl,
    required this.rating,
    required this.content,
    required this.createdTime,
  });

  @override
  List<Object?> get props => [
        id,
        authorName,
        avatarUrl,
        rating,
        content,
        createdTime,
      ];
}
