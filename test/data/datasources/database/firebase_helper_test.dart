import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movieverse/data/datasources/database/firebase_helper.dart';
import 'package:firebase_core/firebase_core.dart';

late Future<FirebaseApp> app;

void setupFirebaseEmulators() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  const firebaseOptions = FirebaseOptions(
    appId: '1:155490193690:android:9ae82fcd1805f8bcf51ca3',
    apiKey: 'AIzaSyDNLhvG9X86Kk4g-wDDQWxF1YiElSOpPds',
    projectId: 'movieverse-19233',
    messagingSenderId: '155490193690',
  );

  app = Firebase.initializeApp(name: 'movieverse', options: firebaseOptions);

  FirebaseAuth.instanceFor(app: await app).useAuthEmulator('localhost', 9099);
  FirebaseFirestore.instanceFor(app: await app)
      .useFirestoreEmulator('localhost', 8080);

  FirebaseAuth.instanceFor(app: await app);
}

void main() {
  group('FirebaseHelperImpl tests', () {
    // setupFirebaseEmulators();
    TestWidgetsFlutterBinding.ensureInitialized();
    late MockFirebaseAuth mockAuth;
    late FakeFirebaseFirestore fakeFirestore;
    late FirebaseHelperImpl firebaseHelper;

    setUp(() async {
      Firebase.initializeApp();
      mockAuth = MockFirebaseAuth();
      fakeFirestore = FakeFirebaseFirestore();
      firebaseHelper = FirebaseHelperImpl();
    });

    test('logoutUser should sign out the user', () async {
      await firebaseHelper.logoutUser();

      // Verify that signOut was called
      verify(mockAuth.signOut()).called(1);
    });

    test('getCurrentUser should return true if the user is logged in',
        () async {
      // Simulate a user being logged in
      mockAuth.signInWithEmailAndPassword(
          email: 'test@example.com', password: 'password');

      final result = await firebaseHelper.getCurrentUser();
      expect(result, true);
    });

    // Write similar tests for other methods in FirebaseHelperImpl

    test('addToWatchlist should add an item to the watchlist', () async {
      final result = await firebaseHelper.addToWatchlist(
        '1',
        'Movie Name',
        'poster_path.jpg',
        '2023-01-01',
        true,
      );

      expect(result, 'Added To Watchlist');

      // Verify that the item was added to Firestore
      final watchlist = await fakeFirestore.collection('watchlist').get();
      expect(watchlist.docs.length, 1);
    });

    test('getWatchlist should return a list of watchlist items', () async {
      // Add a watchlist item to Firestore for testing
      await fakeFirestore.collection('watchlist').add({
        'id': '1',
        'name': 'Movie Name',
        'posterPath': 'poster_path.jpg',
        'release': '2023-01-01',
        'isMovie': true,
      });

      final watchlist = await firebaseHelper.getWatchlist();
      expect(watchlist.length, 1);
      expect(watchlist[0].name, 'Movie Name');
    });

    // Add more tests for other methods as needed
  });
}
