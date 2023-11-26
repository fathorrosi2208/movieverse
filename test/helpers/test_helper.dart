import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:movieverse/data/datasources/database/firebase_helper.dart';
import 'package:movieverse/data/datasources/localDataSource/shared_preference_helper.dart';
import 'package:movieverse/data/datasources/remoteDataSource/remote_data_source.dart';
import 'package:movieverse/domain/repositories/firebase_repository.dart';
import 'package:movieverse/domain/repositories/repository.dart';
import 'package:movieverse/domain/repositories/shared_preference_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateMocks([
  FirebaseHelper,
  SharedPreferenceHelper,
  SharedPreferences,
  RemoteDataSource,
  FirebaseRepository,
  Repository,
  SharedPreferenceRepository
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient),
],)
void main() {}