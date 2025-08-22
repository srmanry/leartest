class AuthService {
  /// Fake signup API
  Future<bool> signUp(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    // এখানে তোমার real API call করবে
    // Example Dio:
    // final response = await Dio().post('https://api.example.com/signup', data: {...});
    // return response.statusCode == 200;

    return true; // success হলে true
    // return false; // fail হলে false
  }
}
