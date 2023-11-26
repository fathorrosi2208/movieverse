import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movieverse/data/repositories/shared_preference_repository_impl.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  group('SharedPreferenceRepositoryImpl', () {
    // Arrange: Create an instance of the mock SharedPreferenceHelper
    late MockSharedPreferenceHelper mockSharedPreferenceHelper;
    late SharedPreferenceRepositoryImpl repository;

    setUp(() {
      mockSharedPreferenceHelper = MockSharedPreferenceHelper();
      repository = SharedPreferenceRepositoryImpl(
          sharedPreferenceHelper: mockSharedPreferenceHelper);
    });

    test('save onboarding complete', () async {
      // Arrange: Set up the initial conditions

      // Act: Perform the action to be tested
      await repository.saveOnboardingComplete();

      // Assert: Check if the expected method was called on the mock
      verify(mockSharedPreferenceHelper.saveOnboardingComplete()).called(1);
    });

    test('get onboarding complete', () async {
      // Arrange: Set up the initial conditions
      when(mockSharedPreferenceHelper.getOnboardingComplete())
          .thenAnswer((_) => Future.value(true));

      // Act: Perform the action to be tested
      final onboardingComplete = await repository.getOnboardingComplete();

      // Assert: Check if the actual result matches the expected result
      expect(onboardingComplete, true);
    });

    test('get email', () async {
      // Arrange: Set up the initial conditions
      when(mockSharedPreferenceHelper.getEmail())
          .thenAnswer((_) => Future.value('test@example.com'));

      // Act: Perform the action to be tested
      final email = await repository.getEmail();

      // Assert: Check if the actual result matches the expected result
      expect(email, 'test@example.com');
    });

    test('get password', () async {
      // Arrange: Set up the initial conditions
      when(mockSharedPreferenceHelper.getPassword())
          .thenAnswer((_) => Future.value('test_password'));

      // Act: Perform the action to be tested
      final password = await repository.getPassword();

      // Assert: Check if the actual result matches the expected result
      expect(password, 'test_password');
    });

    test('save credentials', () async {
      // Arrange: Set up the initial conditions
      const testEmail = 'test@example.com';
      const testPassword = 'test_password';

      // Act: Perform the action to be tested
      await repository.saveCredentials(testEmail, testPassword);

      // Assert: Check if the expected methods were called on the mock
      verify(mockSharedPreferenceHelper.setEmail(testEmail)).called(1);
      verify(mockSharedPreferenceHelper.setPassword(testPassword)).called(1);
    });
  });
}
