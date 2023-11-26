import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movieverse/data/datasources/remoteDataSource/remote_data_source.dart';
import 'package:http/http.dart' as http;
import 'package:movieverse/data/models/movie/movie_model.dart';
import 'package:movieverse/data/models/tv/tv_series_model.dart';
import 'package:movieverse/data/services/api_result.dart';
import 'package:movieverse/utils/network_exceptions.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late RemoteDataSourceImpl dataSource;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = RemoteDataSourceImpl(client: mockHttpClient);
  });

  group('getPopularMovies', () {
    test('should return MovieModel list when response code is 200', () async {
      // Arrange
      when(mockHttpClient.get(any)).thenAnswer(
          (_) async => httpResponse(200, {'results': []} as String));
      // Act
      final result = await dataSource.getPopularMovies();
      // Assert
      expect(result, isA<ApiResult<List<MovieModel>>>());
    });

    test('should return a ServerException when response code is 404 or other',
        () async {
      // Arrange
      when(mockHttpClient.get(any))
          .thenAnswer((_) async => httpResponse(404, '{"success": false}'));

      // Act
      final result = await dataSource.getPopularMovies();

      // Assert
      expect(
          result,
          const ApiResult<List<MovieModel>>.failure(
              error: NetworkExceptions.internalServerError()));
    });
  });

  group('getTopRatedMovies', () {
    test('should return MovieModel list when response code is 200', () async {
      // Arrange
      when(mockHttpClient.get(any)).thenAnswer(
          (_) async => httpResponse(200, {'results': []} as String));
      // Act
      final result = await dataSource.getTopRatedMovies();
      // Assert
      expect(result, isA<ApiResult<List<MovieModel>>>());
    });

    test('should return a ServerException when response code is 404 or other',
        () async {
      // Arrange
      when(mockHttpClient.get(any))
          .thenAnswer((_) async => httpResponse(404, '{"success": false}'));

      // Act
      final result = await dataSource.getTopRatedMovies();

      // Assert
      expect(
          result,
          const ApiResult<List<MovieModel>>.failure(
              error: NetworkExceptions.internalServerError()));
    });
  });

  group('getNowPlayingMovies', () {
    test('should return MovieModel list when response code is 200', () async {
      // Arrange
      when(mockHttpClient.get(any)).thenAnswer(
          (_) async => httpResponse(200, {'results': []} as String));
      // Act
      final result = await dataSource.getNowPlayingMovies();
      // Assert
      expect(result, isA<ApiResult<List<MovieModel>>>());
    });

    test('should return a ServerException when response code is 404 or other',
        () async {
      // Arrange
      when(mockHttpClient.get(any))
          .thenAnswer((_) async => httpResponse(404, '{"success": false}'));

      // Act
      final result = await dataSource.getNowPlayingMovies();

      // Assert
      expect(
          result,
          const ApiResult<List<MovieModel>>.failure(
              error: NetworkExceptions.internalServerError()));
    });
  });

  group('getDiscoverMovies', () {
    test('should return MovieModel list when response code is 200', () async {
      // Arrange
      when(mockHttpClient.get(any)).thenAnswer(
          (_) async => httpResponse(200, {'results': []} as String));
      // Act
      final result = await dataSource.getDiscoverMovies();
      // Assert
      expect(result, isA<ApiResult<List<MovieModel>>>());
    });

    test('should return a ServerException when response code is 404 or other',
        () async {
      // Arrange
      when(mockHttpClient.get(any))
          .thenAnswer((_) async => httpResponse(404, '{"success": false}'));

      // Act
      final result = await dataSource.getDiscoverMovies();

      // Assert
      expect(
          result,
          const ApiResult<List<MovieModel>>.failure(
              error: NetworkExceptions.internalServerError()));
    });
  });

  group('getTrendingMovies', () {
    test('should return MovieModel list when response code is 200', () async {
      // Arrange
      when(mockHttpClient.get(any)).thenAnswer(
          (_) async => httpResponse(200, {'results': []} as String));
      // Act
      final result = await dataSource.getTrendingMovies();
      // Assert
      expect(result, isA<ApiResult<List<MovieModel>>>());
    });

    test('should return a ServerException when response code is 404 or other',
        () async {
      // Arrange
      when(mockHttpClient.get(any))
          .thenAnswer((_) async => httpResponse(404, '{"success": false}'));

      // Act
      final result = await dataSource.getTrendingMovies();

      // Assert
      expect(
          result,
          const ApiResult<List<MovieModel>>.failure(
              error: NetworkExceptions.internalServerError()));
    });
  });

  group('getUpcomingMovies', () {
    test('should return MovieModel list when response code is 200', () async {
      // Arrange
      when(mockHttpClient.get(any)).thenAnswer(
          (_) async => httpResponse(200, {'results': []} as String));
      // Act
      final result = await dataSource.getUpcomingMovies();
      // Assert
      expect(result, isA<ApiResult<List<MovieModel>>>());
    });

    test('should return a ServerException when response code is 404 or other',
        () async {
      // Arrange
      when(mockHttpClient.get(any))
          .thenAnswer((_) async => httpResponse(404, '{"success": false}'));

      // Act
      final result = await dataSource.getUpcomingMovies();

      // Assert
      expect(
          result,
          const ApiResult<List<MovieModel>>.failure(
              error: NetworkExceptions.internalServerError()));
    });
  });

  group('getMovieRecommendations', () {
    const tId = 1;

    test('should return Movie Model list when response code is 200', () async {
      // Arrange
      when(mockHttpClient.get(any)).thenAnswer(
          (_) async => httpResponse(200, {'results': []} as String));

      // Act
      final result = await dataSource.getMovieRecommendations(tId);

      // Assert
      expect(result, isA<ApiResult<List<MovieModel>>>());
    });

    test('should return Server Failure when response code is 404 or other',
        () async {
      // Arrange
      when(mockHttpClient.get(any))
          .thenAnswer((_) async => httpResponse(404, '{"success": false}'));

      // Act
      final result = await dataSource.getMovieRecommendations(tId);

      // Assert
      expect(
          result,
          const ApiResult<List<MovieModel>>.failure(
              error: NetworkExceptions.internalServerError()));
    });
  });

  group('searchMovies', () {
    const tQuery = 'Spiderman';

    test('should return MovieModel list when response code is 200', () async {
      // Arrange
      when(mockHttpClient.get(any)).thenAnswer(
          (_) async => httpResponse(200, {'results': []} as String));

      // Act
      final result = await dataSource.searchMovies(tQuery);

      // Assert
      expect(result, isA<ApiResult<List<MovieModel>>>());
    });

    test('should return ServerFailure when response code is 404 or other',
        () async {
      // Arrange
      when(mockHttpClient.get(any))
          .thenAnswer((_) async => httpResponse(404, '{"success": false}'));

      // Act
      final result = await dataSource.searchMovies(tQuery);

      // Assert
      expect(
          result,
          const ApiResult<List<MovieModel>>.failure(
              error: NetworkExceptions.internalServerError()));
    });
  });

  group('getAiringTodayTvSeries', () {
    test('should return TvSeriesModel list when response code is 200',
        () async {
      // Arrange
      when(mockHttpClient.get(any)).thenAnswer(
          (_) async => httpResponse(200, {'results': []} as String));
      // Act
      final result = await dataSource.getAiringTodayTvSeries();
      // Assert
      expect(result, isA<ApiResult<List<TvSeriesModel>>>());
    });

    test('should return a ServerException when response code is 404 or other',
        () async {
      // Arrange
      when(mockHttpClient.get(any))
          .thenAnswer((_) async => httpResponse(404, '{"success": false}'));

      // Act
      final result = await dataSource.getAiringTodayTvSeries();

      // Assert
      expect(
          result,
          const ApiResult<List<TvSeriesModel>>.failure(
              error: NetworkExceptions.internalServerError()));
    });
  });

  group('getPopularTvSeries', () {
    test('should return TvSeriesModel list when response code is 200',
        () async {
      // Arrange
      when(mockHttpClient.get(any)).thenAnswer(
          (_) async => httpResponse(200, {'results': []} as String));
      // Act
      final result = await dataSource.getPopularTvSeries();
      // Assert
      expect(result, isA<ApiResult<List<TvSeriesModel>>>());
    });

    test('should return a ServerException when response code is 404 or other',
        () async {
      // Arrange
      when(mockHttpClient.get(any))
          .thenAnswer((_) async => httpResponse(404, '{"success": false}'));

      // Act
      final result = await dataSource.getPopularTvSeries();

      // Assert
      expect(
          result,
          const ApiResult<List<TvSeriesModel>>.failure(
              error: NetworkExceptions.internalServerError()));
    });
  });

  group('getTopRatedvSeries', () {
    test('should return TvSeriesModel list when response code is 200',
        () async {
      // Arrange
      when(mockHttpClient.get(any)).thenAnswer(
          (_) async => httpResponse(200, {'results': []} as String));
      // Act
      final result = await dataSource.getTopRatedTvSeries();
      // Assert
      expect(result, isA<ApiResult<List<TvSeriesModel>>>());
    });

    test('should return a ServerException when response code is 404 or other',
        () async {
      // Arrange
      when(mockHttpClient.get(any))
          .thenAnswer((_) async => httpResponse(404, '{"success": false}'));

      // Act
      final result = await dataSource.getTopRatedTvSeries();

      // Assert
      expect(
          result,
          const ApiResult<List<TvSeriesModel>>.failure(
              error: NetworkExceptions.internalServerError()));
    });
  });

  group('getDiscoverTvSeries', () {
    test('should return TvSeriesModel list when response code is 200',
        () async {
      // Arrange
      when(mockHttpClient.get(any)).thenAnswer(
          (_) async => httpResponse(200, {'results': []} as String));
      // Act
      final result = await dataSource.getDiscoverTvSeries();
      // Assert
      expect(result, isA<ApiResult<List<TvSeriesModel>>>());
    });

    test('should return a ServerException when response code is 404 or other',
        () async {
      // Arrange
      when(mockHttpClient.get(any))
          .thenAnswer((_) async => httpResponse(404, '{"success": false}'));

      // Act
      final result = await dataSource.getDiscoverTvSeries();

      // Assert
      expect(
          result,
          const ApiResult<List<TvSeriesModel>>.failure(
              error: NetworkExceptions.internalServerError()));
    });
  });

  group('getTrendingTvSeries', () {
    test('should return TvSeriesModel list when response code is 200',
        () async {
      // Arrange
      when(mockHttpClient.get(any)).thenAnswer(
          (_) async => httpResponse(200, {'results': []} as String));
      // Act
      final result = await dataSource.getTrendingTvSeries();
      // Assert
      expect(result, isA<ApiResult<List<TvSeriesModel>>>());
    });

    test('should return a ServerException when response code is 404 or other',
        () async {
      // Arrange
      when(mockHttpClient.get(any))
          .thenAnswer((_) async => httpResponse(404, '{"success": false}'));

      // Act
      final result = await dataSource.getTrendingTvSeries();

      // Assert
      expect(
          result,
          const ApiResult<List<TvSeriesModel>>.failure(
              error: NetworkExceptions.internalServerError()));
    });
  });

  group('getOnTheAirTvSeries', () {
    test('should return TvSeriesModel list when response code is 200',
        () async {
      // Arrange
      when(mockHttpClient.get(any)).thenAnswer(
          (_) async => httpResponse(200, {'results': []} as String));
      // Act
      final result = await dataSource.getOnTheAirTvSeries();
      // Assert
      expect(result, isA<ApiResult<List<TvSeriesModel>>>());
    });

    test('should return a ServerException when response code is 404 or other',
        () async {
      // Arrange
      when(mockHttpClient.get(any))
          .thenAnswer((_) async => httpResponse(404, '{"success": false}'));

      // Act
      final result = await dataSource.getOnTheAirTvSeries();

      // Assert
      expect(
          result,
          const ApiResult<List<TvSeriesModel>>.failure(
              error: NetworkExceptions.internalServerError()));
    });
  });

  group('getTvSeriesRecommendations', () {
    const tId = 1;

    test('should return TvSeries Model list when response code is 200',
        () async {
      // Arrange
      when(mockHttpClient.get(any)).thenAnswer(
          (_) async => httpResponse(200, {'results': []} as String));

      // Act
      final result = await dataSource.getTvSeriesRecommendations(tId);

      // Assert
      expect(result, isA<ApiResult<List<TvSeriesModel>>>());
    });

    test('should return Server Failure when response code is 404 or other',
        () async {
      // Arrange
      when(mockHttpClient.get(any))
          .thenAnswer((_) async => httpResponse(404, '{"success": false}'));

      // Act
      final result = await dataSource.getTvSeriesRecommendations(tId);

      // Assert
      expect(
          result,
          const ApiResult<List<TvSeriesModel>>.failure(
              error: NetworkExceptions.internalServerError()));
    });
  });

  group('searchTvSeries', () {
    const tQuery = 'Spiderman';

    test('should return TvSeriesModel list when response code is 200',
        () async {
      // Arrange
      when(mockHttpClient.get(any)).thenAnswer(
          (_) async => httpResponse(200, {'results': []} as String));

      // Act
      final result = await dataSource.searchTvSeries(tQuery);

      // Assert
      expect(result, isA<ApiResult<List<TvSeriesModel>>>());
    });

    test('should return ServerFailure when response code is 404 or other',
        () async {
      // Arrange
      when(mockHttpClient.get(any))
          .thenAnswer((_) async => httpResponse(404, '{"success": false}'));

      // Act
      final result = await dataSource.searchTvSeries(tQuery);

      // Assert
      expect(
          result,
          const ApiResult<List<TvSeriesModel>>.failure(
              error: NetworkExceptions.internalServerError()));
    });
  });
}

// Helper method
httpResponse(int statusCode, String body) {
  final response = http.Response(body, statusCode);
  return response;
}
