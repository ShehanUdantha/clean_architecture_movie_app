class APIConstant {
  static const String apiKey = '8202ae76eb5d560f9fe77fdd05308420';
  static const String baseUrl = 'https://api.themoviedb.org/3';

  static const String baseImageURL = "https://image.tmdb.org/t/p/w500";
  static const String baseProfileUrl = 'https://image.tmdb.org/t/p/w300';
  static const String baseAvatarUrl = 'https://image.tmdb.org/t/p/w185';
  static const String baseVideoUrl = 'https://www.youtube.com/watch?v=';

  static const String popularUrl =
      '$baseUrl/movie/popular?api_key=$apiKey&language=en-US&sort_by=release_date.desc&page=';
  static const String upcomingUrl =
      '$baseUrl/movie/upcoming?api_key=$apiKey&language=en-US&sort_by=release_date.desc';
  static const trendingUrl =
      '$baseUrl/trending/movie/day?api_key=$apiKey&language=en-US&sort_by=release_date.desc&page=';
  static const genreUrl =
      '$baseUrl/discover/movie?api_key=$apiKey&language=en-US&sort_by=release_date.desc&page=1&with_genres=';
  static const String searchMovieUrl = '$baseUrl/search/movie?query=';

  static const String defaultUserImage =
      'https://st3.depositphotos.com/4111759/13425/v/600/depositphotos_134255710-stock-illustration-avatar-vector-male-profile-gray.jpg';
  static const String defaultMovieImage =
      'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/330px-No-Image-Placeholder.svg.png?20200912122019';
}
