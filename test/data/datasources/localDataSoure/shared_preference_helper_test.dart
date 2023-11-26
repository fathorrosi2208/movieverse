import 'package:flutter_test/flutter_test.dart';
import 'package:movieverse/data/datasources/localDataSource/shared_preference_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('SharedPreferenceHelperImpl', () {
    // Mock SharedPreferences for testing
    SharedPreferences.setMockInitialValues({});
    final sharedPreferenceHelper = SharedPreferenceHelperImpl();

    test('set and get email', () async {
      // Arrange: Set up the initial conditions
      const initialEmail = 'test@example.com';

      // Act: Perform the action to be tested
      await sharedPreferenceHelper.setEmail(initialEmail);
      final retrievedEmail = await sharedPreferenceHelper.getEmail();

      // Assert: Check if the expected result matches the actual result
      expect(retrievedEmail, initialEmail);
    });

    test('set and get password', () async {
      // Arrange: Set up the initial conditions
      const initialPassword = 'test_password';

      // Act: Perform the action to be tested
      await sharedPreferenceHelper.setPassword(initialPassword);
      final retrievedPassword = await sharedPreferenceHelper.getPassword();

      // Assert: Check if the expected result matches the actual result
      expect(retrievedPassword, initialPassword);
    });

    test('set and get onboarding complete', () async {
      // Arrange: Set up the initial conditions

      // Act: Perform the action to be tested
      await sharedPreferenceHelper.saveOnboardingComplete();
      final onboardingComplete =
          await sharedPreferenceHelper.getOnboardingComplete();

      // Assert: Check if the expected result matches the actual result
      expect(onboardingComplete, true);
    });
  });
}
