import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movieverse/data/models/movie/movie_model.dart';
import 'package:movieverse/data/models/tv/tv_series_model.dart';
import 'package:movieverse/data/repositories/repository_impl.dart';
import 'package:movieverse/data/services/api_result.dart';
import 'package:movieverse/domain/entities/movie/movie.dart';
import 'package:movieverse/domain/entities/tv/tv_series.dart';
import 'package:movieverse/utils/network_exceptions.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late RepositoryImpl repository;
  late MockRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    repository = RepositoryImpl(remoteDataSource: mockRemoteDataSource);
  });

  const tMovieModel = MovieModel(
      adult: false,
      backdropPath: '/fakeBackdropPath.jpg',
      genreIds: [1, 2, 3],
      id: 1,
      originalTitle: 'Original Title',
      overview: 'Overview',
      popularity: 8.5,
      posterPath: '/fakePoster.jpg',
      releaseDate: '2022-01-01',
      title: 'Fake Movie',
      video: false,
      voteAverage: 7.5,
      voteCount: 150);

  const tTvSeriesModel = TvSeriesModel(
      backdropPath: '/fakeBackdrop.jpg',
      firstAirDate: '2022-01-01',
      genreIds: [1, 2, 3],
      id: 1,
      originalName: 'Original Name',
      overview: 'Overview',
      popularity: 8.5,
      posterPath: '/fakePoster.jpg',
      name: 'Fake TV Show',
      voteAverage: 7.5,
      voteCount: 150);

  group('getPopularMovies', () {
    test(
      'should return movie list when the call to remote data source is successful',
      () async {
        // arrange
        when(mockRemoteDataSource.getPopularMovies()).thenAnswer(
            (_) async => const ApiResult.success(data: [tMovieModel]));

        // act
        final result = await repository.getPopularMovies();

        // assert
        verify(mockRemoteDataSource.getPopularMovies());
        expect(
          result,
          isA<Right<NetworkExceptions, List<Movie>>>(),
        );
      },
    );

    test(
      'should return server failure when the call to remote data source is unsuccessful',
      () async {
        // arrange
        when(mockRemoteDataSource.getPopularMovies()).thenAnswer((_) async =>
            const ApiResult.failure(
                error: NetworkExceptions.unexpectedError()));

        // act
        final result = await repository.getPopularMovies();

        // assert
        verify(mockRemoteDataSource.getPopularMovies());
        expect(result, const Left(NetworkExceptions.unexpectedError()));
      },
    );

    test(
      'should return connection failure when the device is not connected to internet',
      () async {
        // arrange
        when(mockRemoteDataSource.getPopularMovies()).thenThrow(
            const SocketException('Failed to connect to the network'));

        // act
        final result = await repository.getPopularMovies();

        // assert
        verify(mockRemoteDataSource.getPopularMovies());
        expect(result, const Left(NetworkExceptions.unexpectedError()));
      },
    );
  });

  group('getTopRatedMovies', () {
    test(
      'should return movie list when the call to remote data source is successful',
      () async {
        // arrange
        when(mockRemoteDataSource.getTopRatedMovies()).thenAnswer(
            (_) async => const ApiResult.success(data: [tMovieModel]));

        // act
        final result = await repository.getTopRatedMovies();

        // assert
        verify(mockRemoteDataSource.getTopRatedMovies());
        expect(
          result,
          isA<Right<NetworkExceptions, List<Movie>>>(),
        );
      },
    );

    test(
      'should return server failure when the call to remote data source is unsuccessful',
      () async {
        // arrange
        when(mockRemoteDataSource.getTopRatedMovies()).thenAnswer((_) async =>
            const ApiResult.failure(
                error: NetworkExceptions.unexpectedError()));

        // act
        final result = await repository.getTopRatedMovies();

        // assert
        verify(mockRemoteDataSource.getTopRatedMovies());
        expect(result, const Left(NetworkExceptions.unexpectedError()));
      },
    );

    test(
      'should return connection failure when the device is not connected to internet',
      () async {
        // arrange
        when(mockRemoteDataSource.getTopRatedMovies()).thenThrow(
            const SocketException('Failed to connect to the network'));

        // act
        final result = await repository.getTopRatedMovies();

        // assert
        verify(mockRemoteDataSource.getTopRatedMovies());
        expect(result, const Left(NetworkExceptions.unexpectedError()));
      },
    );
  });

  group('getNowPlayingMovies', () {
    test(
      'should return movie list when the call to remote data source is successful',
      () async {
        // arrange
        when(mockRemoteDataSource.getNowPlayingMovies()).thenAnswer(
            (_) async => const ApiResult.success(data: [tMovieModel]));

        // act
        final result = await repository.getNowPlayingMovies();

        // assert
        verify(mockRemoteDataSource.getNowPlayingMovies());
        expect(
          result,
          isA<Right<NetworkExceptions, List<Movie>>>(),
        );
      },
    );

    test(
      'should return server failure when the call to remote data source is unsuccessful',
      () async {
        // arrange
        when(mockRemoteDataSource.getNowPlayingMovies()).thenAnswer((_) async =>
            const ApiResult.failure(
                error: NetworkExceptions.unexpectedError()));

        // act
        final result = await repository.getNowPlayingMovies();

        // assert
        verify(mockRemoteDataSource.getNowPlayingMovies());
        expect(result, const Left(NetworkExceptions.unexpectedError()));
      },
    );

    test(
      'should return connection failure when the device is not connected to internet',
      () async {
        // arrange
        when(mockRemoteDataSource.getNowPlayingMovies()).thenThrow(
            const SocketException('Failed to connect to the network'));

        // act
        final result = await repository.getNowPlayingMovies();

        // assert
        verify(mockRemoteDataSource.getNowPlayingMovies());
        expect(result, const Left(NetworkExceptions.unexpectedError()));
      },
    );
  });

  group('getDiscoverMovies', () {
    test(
      'should return movie list when the call to remote data source is successful',
      () async {
        // arrange
        when(mockRemoteDataSource.getDiscoverMovies()).thenAnswer(
            (_) async => const ApiResult.success(data: [tMovieModel]));

        // act
        final result = await repository.getDiscoverMovies();

        // assert
        verify(mockRemoteDataSource.getDiscoverMovies());
        expect(
          result,
          isA<Right<NetworkExceptions, List<Movie>>>(),
        );
      },
    );

    test(
      'should return server failure when the call to remote data source is unsuccessful',
      () async {
        // arrange
        when(mockRemoteDataSource.getDiscoverMovies()).thenAnswer((_) async =>
            const ApiResult.failure(
                error: NetworkExceptions.unexpectedError()));

        // act
        final result = await repository.getDiscoverMovies();

        // assert
        verify(mockRemoteDataSource.getDiscoverMovies());
        expect(result, const Left(NetworkExceptions.unexpectedError()));
      },
    );

    test(
      'should return connection failure when the device is not connected to internet',
      () async {
        // arrange
        when(mockRemoteDataSource.getDiscoverMovies()).thenThrow(
            const SocketException('Failed to connect to the network'));

        // act
        final result = await repository.getDiscoverMovies();

        // assert
        verify(mockRemoteDataSource.getDiscoverMovies());
        expect(result, const Left(NetworkExceptions.unexpectedError()));
      },
    );
  });

  group('getTrendingMovies', () {
    test(
      'should return movie list when the call to remote data source is successful',
      () async {
        // arrange
        when(mockRemoteDataSource.getTrendingMovies()).thenAnswer(
            (_) async => const ApiResult.success(data: [tMovieModel]));

        // act
        final result = await repository.getTrendingMovies();

        // assert
        verify(mockRemoteDataSource.getTrendingMovies());
        expect(
          result,
          isA<Right<NetworkExceptions, List<Movie>>>(),
        );
      },
    );

    test(
      'should return server failure when the call to remote data source is unsuccessful',
      () async {
        // arrange
        when(mockRemoteDataSource.getTrendingMovies()).thenAnswer((_) async =>
            const ApiResult.failure(
                error: NetworkExceptions.unexpectedError()));

        // act
        final result = await repository.getTrendingMovies();

        // assert
        verify(mockRemoteDataSource.getTrendingMovies());
        expect(result, const Left(NetworkExceptions.unexpectedError()));
      },
    );

    test(
      'should return connection failure when the device is not connected to internet',
      () async {
        // arrange
        when(mockRemoteDataSource.getTrendingMovies()).thenThrow(
            const SocketException('Failed to connect to the network'));

        // act
        final result = await repository.getTrendingMovies();

        // assert
        verify(mockRemoteDataSource.getTrendingMovies());
        expect(result, const Left(NetworkExceptions.unexpectedError()));
      },
    );
  });

  group('getUpcomingMovies', () {
    test(
      'should return movie list when the call to remote data source is successful',
      () async {
        // arrange
        when(mockRemoteDataSource.getUpcomingMovies()).thenAnswer(
            (_) async => const ApiResult.success(data: [tMovieModel]));

        // act
        final result = await repository.getUpcomingMovies();

        // assert
        verify(mockRemoteDataSource.getUpcomingMovies());
        expect(
          result,
          isA<Right<NetworkExceptions, List<Movie>>>(),
        );
      },
    );

    test(
      'should return server failure when the call to remote data source is unsuccessful',
      () async {
        // arrange
        when(mockRemoteDataSource.getUpcomingMovies()).thenAnswer((_) async =>
            const ApiResult.failure(
                error: NetworkExceptions.unexpectedError()));

        // act
        final result = await repository.getUpcomingMovies();

        // assert
        verify(mockRemoteDataSource.getUpcomingMovies());
        expect(result, const Left(NetworkExceptions.unexpectedError()));
      },
    );

    test(
      'should return connection failure when the device is not connected to internet',
      () async {
        // arrange
        when(mockRemoteDataSource.getUpcomingMovies()).thenThrow(
            const SocketException('Failed to connect to the network'));

        // act
        final result = await repository.getUpcomingMovies();

        // assert
        verify(mockRemoteDataSource.getUpcomingMovies());
        expect(result, const Left(NetworkExceptions.unexpectedError()));
      },
    );
  });

  group('getMovieRecommendations', () {
    test(
      'should return movie list when call to remote data source is successful',
      () async {
        // arrange
        when(mockRemoteDataSource.getMovieRecommendations(1)).thenAnswer(
            (_) async => const ApiResult.success(data: [tMovieModel]));

        // act
        final result = await repository.getMovieRecommendations(1);

        // assert
        verify(mockRemoteDataSource.getMovieRecommendations(1));
        expect(result, isA<Right<NetworkExceptions, List<Movie>>>());
      },
    );

    test(
      'should return server failure when call to remote data source is unsuccessful',
      () async {
        // arrange
        when(mockRemoteDataSource.getMovieRecommendations(1)).thenAnswer(
            (_) async => const ApiResult.failure(
                error: NetworkExceptions.unexpectedError()));

        // act
        final result = await repository.getMovieRecommendations(1);

        // assert
        verify(mockRemoteDataSource.getMovieRecommendations(1));
        expect(result, const Left(NetworkExceptions.unexpectedError()));
      },
    );

    test(
      'should return connection failure when device is not connected to the internet',
      () async {
        // arrange
        when(mockRemoteDataSource.getMovieRecommendations(1)).thenThrow(
            const SocketException('Failed to connect to the network'));

        // act
        final result = await repository.getMovieRecommendations(1);

        // assert
        verify(mockRemoteDataSource.getMovieRecommendations(1));
        expect(result, const Left(NetworkExceptions.unexpectedError()));
      },
    );
  });

  group('searchMovies', () {
    test(
      'should return movie list when call to remote data source is successful',
      () async {
        // arrange
        when(mockRemoteDataSource.searchMovies('spiderman')).thenAnswer(
            (_) async => const ApiResult.success(data: [tMovieModel]));

        // act
        final result = await repository.searchMovies('spiderman');

        // assert
        verify(mockRemoteDataSource.searchMovies('spiderman'));
        expect(result, isA<Right<NetworkExceptions, List<Movie>>>());
      },
    );

    test(
      'should return server failure when call to remote data source is unsuccessful',
      () async {
        // arrange
        when(mockRemoteDataSource.searchMovies('spiderman')).thenAnswer(
            (_) async => const ApiResult.failure(
                error: NetworkExceptions.unexpectedError()));

        // act
        final result = await repository.searchMovies('spiderman');

        // assert
        verify(mockRemoteDataSource.searchMovies('spiderman'));
        expect(result, const Left(NetworkExceptions.unexpectedError()));
      },
    );

    test(
      'should return connection failure when device is not connected to the internet',
      () async {
        // arrange
        when(mockRemoteDataSource.searchMovies('spiderman')).thenThrow(
            const SocketException('Failed to connect to the network'));

        // act
        final result = await repository.searchMovies('spiderman');

        // assert
        verify(mockRemoteDataSource.searchMovies('spiderman'));
        expect(result, const Left(NetworkExceptions.unexpectedError()));
      },
    );
  });

  group('getAiringTodayTvSeries', () {
    test(
      'should return tvSeries list when the call to remote data source is successful',
      () async {
        // arrange
        when(mockRemoteDataSource.getAiringTodayTvSeries()).thenAnswer(
            (_) async => const ApiResult.success(data: [tTvSeriesModel]));

        // act
        final result = await repository.getAiringTodayTvSeries();

        // assert
        verify(mockRemoteDataSource.getAiringTodayTvSeries());
        expect(
          result,
          isA<Right<NetworkExceptions, List<TvSeries>>>(),
        );
      },
    );

    test(
      'should return server failure when the call to remote data source is unsuccessful',
      () async {
        // arrange
        when(mockRemoteDataSource.getAiringTodayTvSeries()).thenAnswer(
            (_) async => const ApiResult.failure(
                error: NetworkExceptions.unexpectedError()));

        // act
        final result = await repository.getAiringTodayTvSeries();

        // assert
        verify(mockRemoteDataSource.getAiringTodayTvSeries());
        expect(result, const Left(NetworkExceptions.unexpectedError()));
      },
    );

    test(
      'should return connection failure when the device is not connected to internet',
      () async {
        // arrange
        when(mockRemoteDataSource.getAiringTodayTvSeries()).thenThrow(
            const SocketException('Failed to connect to the network'));

        // act
        final result = await repository.getAiringTodayTvSeries();

        // assert
        verify(mockRemoteDataSource.getAiringTodayTvSeries());
        expect(result, const Left(NetworkExceptions.unexpectedError()));
      },
    );
  });

  group('getPopularTvSeries', () {
    test(
      'should return tvSeries list when the call to remote data source is successful',
      () async {
        // arrange
        when(mockRemoteDataSource.getPopularTvSeries()).thenAnswer(
            (_) async => const ApiResult.success(data: [tTvSeriesModel]));

        // act
        final result = await repository.getPopularTvSeries();

        // assert
        verify(mockRemoteDataSource.getPopularTvSeries());
        expect(
          result,
          isA<Right<NetworkExceptions, List<TvSeries>>>(),
        );
      },
    );

    test(
      'should return server failure when the call to remote data source is unsuccessful',
      () async {
        // arrange
        when(mockRemoteDataSource.getPopularTvSeries()).thenAnswer((_) async =>
            const ApiResult.failure(
                error: NetworkExceptions.unexpectedError()));

        // act
        final result = await repository.getPopularTvSeries();

        // assert
        verify(mockRemoteDataSource.getPopularTvSeries());
        expect(result, const Left(NetworkExceptions.unexpectedError()));
      },
    );

    test(
      'should return connection failure when the device is not connected to internet',
      () async {
        // arrange
        when(mockRemoteDataSource.getPopularTvSeries()).thenThrow(
            const SocketException('Failed to connect to the network'));

        // act
        final result = await repository.getPopularTvSeries();

        // assert
        verify(mockRemoteDataSource.getPopularTvSeries());
        expect(result, const Left(NetworkExceptions.unexpectedError()));
      },
    );
  });

  group('getTopRatedTvSeries', () {
    test(
      'should return tvSeries list when the call to remote data source is successful',
      () async {
        // arrange
        when(mockRemoteDataSource.getTopRatedTvSeries()).thenAnswer(
            (_) async => const ApiResult.success(data: [tTvSeriesModel]));

        // act
        final result = await repository.getTopRatedTvSeries();

        // assert
        verify(mockRemoteDataSource.getTopRatedTvSeries());
        expect(
          result,
          isA<Right<NetworkExceptions, List<TvSeries>>>(),
        );
      },
    );

    test(
      'should return server failure when the call to remote data source is unsuccessful',
      () async {
        // arrange
        when(mockRemoteDataSource.getTopRatedTvSeries()).thenAnswer((_) async =>
            const ApiResult.failure(
                error: NetworkExceptions.unexpectedError()));

        // act
        final result = await repository.getTopRatedTvSeries();

        // assert
        verify(mockRemoteDataSource.getTopRatedTvSeries());
        expect(result, const Left(NetworkExceptions.unexpectedError()));
      },
    );

    test(
      'should return connection failure when the device is not connected to internet',
      () async {
        // arrange
        when(mockRemoteDataSource.getTopRatedTvSeries()).thenThrow(
            const SocketException('Failed to connect to the network'));

        // act
        final result = await repository.getTopRatedTvSeries();

        // assert
        verify(mockRemoteDataSource.getTopRatedTvSeries());
        expect(result, const Left(NetworkExceptions.unexpectedError()));
      },
    );
  });

  group('getDiscoverTvSeries', () {
    test(
      'should return tvSeries list when the call to remote data source is successful',
      () async {
        // arrange
        when(mockRemoteDataSource.getDiscoverTvSeries()).thenAnswer(
            (_) async => const ApiResult.success(data: [tTvSeriesModel]));

        // act
        final result = await repository.getDiscoverTvSeries();

        // assert
        verify(mockRemoteDataSource.getDiscoverTvSeries());
        expect(
          result,
          isA<Right<NetworkExceptions, List<TvSeries>>>(),
        );
      },
    );

    test(
      'should return server failure when the call to remote data source is unsuccessful',
      () async {
        // arrange
        when(mockRemoteDataSource.getDiscoverTvSeries()).thenAnswer((_) async =>
            const ApiResult.failure(
                error: NetworkExceptions.unexpectedError()));

        // act
        final result = await repository.getDiscoverTvSeries();

        // assert
        verify(mockRemoteDataSource.getDiscoverTvSeries());
        expect(result, const Left(NetworkExceptions.unexpectedError()));
      },
    );

    test(
      'should return connection failure when the device is not connected to internet',
      () async {
        // arrange
        when(mockRemoteDataSource.getDiscoverTvSeries()).thenThrow(
            const SocketException('Failed to connect to the network'));

        // act
        final result = await repository.getDiscoverTvSeries();

        // assert
        verify(mockRemoteDataSource.getDiscoverTvSeries());
        expect(result, const Left(NetworkExceptions.unexpectedError()));
      },
    );
  });

  group('getTrendingTvSeries', () {
    test(
      'should return tvSeries list when the call to remote data source is successful',
      () async {
        // arrange
        when(mockRemoteDataSource.getTrendingTvSeries()).thenAnswer(
            (_) async => const ApiResult.success(data: [tTvSeriesModel]));

        // act
        final result = await repository.getTrendingTvSeries();

        // assert
        verify(mockRemoteDataSource.getTrendingTvSeries());
        expect(
          result,
          isA<Right<NetworkExceptions, List<TvSeries>>>(),
        );
      },
    );

    test(
      'should return server failure when the call to remote data source is unsuccessful',
      () async {
        // arrange
        when(mockRemoteDataSource.getTrendingTvSeries()).thenAnswer((_) async =>
            const ApiResult.failure(
                error: NetworkExceptions.unexpectedError()));

        // act
        final result = await repository.getTrendingTvSeries();

        // assert
        verify(mockRemoteDataSource.getTrendingTvSeries());
        expect(result, const Left(NetworkExceptions.unexpectedError()));
      },
    );

    test(
      'should return connection failure when the device is not connected to internet',
      () async {
        // arrange
        when(mockRemoteDataSource.getTrendingTvSeries()).thenThrow(
            const SocketException('Failed to connect to the network'));

        // act
        final result = await repository.getTrendingTvSeries();

        // assert
        verify(mockRemoteDataSource.getTrendingTvSeries());
        expect(result, const Left(NetworkExceptions.unexpectedError()));
      },
    );
  });

  group('getOnTheAirTvSeries', () {
    test(
      'should return tvSeries list when the call to remote data source is successful',
      () async {
        // arrange
        when(mockRemoteDataSource.getOnTheAirTvSeries()).thenAnswer(
            (_) async => const ApiResult.success(data: [tTvSeriesModel]));

        // act
        final result = await repository.getOnTheAirTvSeries();

        // assert
        verify(mockRemoteDataSource.getOnTheAirTvSeries());
        expect(
          result,
          isA<Right<NetworkExceptions, List<TvSeries>>>(),
        );
      },
    );

    test(
      'should return server failure when the call to remote data source is unsuccessful',
      () async {
        // arrange
        when(mockRemoteDataSource.getOnTheAirTvSeries()).thenAnswer((_) async =>
            const ApiResult.failure(
                error: NetworkExceptions.unexpectedError()));

        // act
        final result = await repository.getOnTheAirTvSeries();

        // assert
        verify(mockRemoteDataSource.getOnTheAirTvSeries());
        expect(result, const Left(NetworkExceptions.unexpectedError()));
      },
    );

    test(
      'should return connection failure when the device is not connected to internet',
      () async {
        // arrange
        when(mockRemoteDataSource.getOnTheAirTvSeries()).thenThrow(
            const SocketException('Failed to connect to the network'));

        // act
        final result = await repository.getOnTheAirTvSeries();

        // assert
        verify(mockRemoteDataSource.getOnTheAirTvSeries());
        expect(result, const Left(NetworkExceptions.unexpectedError()));
      },
    );
  });

  group('getTvSeriesRecommendations', () {
    test(
      'should return tv series list when call to remote data source is successful',
      () async {
        // arrange
        when(mockRemoteDataSource.getTvSeriesRecommendations(1)).thenAnswer(
            (_) async => const ApiResult.success(data: [tTvSeriesModel]));

        // act
        final result = await repository.getTvSeriesRecommendations(1);

        // assert
        verify(mockRemoteDataSource.getTvSeriesRecommendations(1));
        expect(result, isA<Right<NetworkExceptions, List<TvSeries>>>());
      },
    );

    test(
      'should return server failure when call to remote data source is unsuccessful',
      () async {
        // arrange
        when(mockRemoteDataSource.getTvSeriesRecommendations(1)).thenAnswer(
            (_) async => const ApiResult.failure(
                error: NetworkExceptions.unexpectedError()));

        // act
        final result = await repository.getTvSeriesRecommendations(1);

        // assert
        verify(mockRemoteDataSource.getTvSeriesRecommendations(1));
        expect(result, const Left(NetworkExceptions.unexpectedError()));
      },
    );

    test(
      'should return connection failure when device is not connected to the internet',
      () async {
        // arrange
        when(mockRemoteDataSource.getTvSeriesRecommendations(1)).thenThrow(
            const SocketException('Failed to connect to the network'));

        // act
        final result = await repository.getTvSeriesRecommendations(1);

        // assert
        verify(mockRemoteDataSource.getTvSeriesRecommendations(1));
        expect(result, const Left(NetworkExceptions.unexpectedError()));
      },
    );
  });

  group('searchTvSeries', () {
    test(
      'should return tv series list when call to remote data source is successful',
      () async {
        // arrange
        when(mockRemoteDataSource.searchTvSeries('the office')).thenAnswer(
            (_) async => const ApiResult.success(data: [tTvSeriesModel]));

        // act
        final result = await repository.searchTvSeries('the office');

        // assert
        verify(mockRemoteDataSource.searchTvSeries('the office'));
        expect(result, isA<Right<NetworkExceptions, List<TvSeries>>>());
      },
    );

    test(
      'should return server failure when call to remote data source is unsuccessful',
      () async {
        // arrange
        when(mockRemoteDataSource.searchTvSeries('the office')).thenAnswer(
            (_) async => const ApiResult.failure(
                error: NetworkExceptions.unexpectedError()));

        // act
        final result = await repository.searchTvSeries('the office');

        // assert
        verify(mockRemoteDataSource.searchTvSeries('the office'));
        expect(result, const Left(NetworkExceptions.unexpectedError()));
      },
    );

    test(
      'should return connection failure when device is not connected to the internet',
      () async {
        // arrange
        when(mockRemoteDataSource.searchTvSeries('the office')).thenThrow(
            const SocketException('Failed to connect to the network'));

        // act
        final result = await repository.searchTvSeries('the office');

        // assert
        verify(mockRemoteDataSource.searchTvSeries('the office'));
        expect(result, const Left(NetworkExceptions.unexpectedError()));
      },
    );
  });
}
