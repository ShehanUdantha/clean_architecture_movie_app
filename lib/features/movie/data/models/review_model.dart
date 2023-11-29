import '../../domain/entities/review_entity.dart';

class ReviewModel extends ReviewEntity {
  const ReviewModel({
    id,
    authorName,
    avatarUrl,
    rating,
    content,
    createdTime,
  }) : super(
          id: id,
          authorName: authorName,
          avatarUrl: avatarUrl,
          rating: rating,
          content: content,
          createdTime: createdTime,
        );

  factory ReviewModel.fromMap(Map<String, dynamic> map) => ReviewModel(
        id: map['id'],
        authorName: map['author'] ?? map['author_details']['username'],
        avatarUrl: map['author_details']['avatar_path'] ?? '',
        rating: map['author_details']['rating'] ?? 0.0,
        content: map['content'],
        createdTime: map['created_at'],
      );
}
