class AuthRepo {
  dynamic login({required String email, required String password}) async {
    final Map<String, dynamic> data = {"email": email, "password": password};
    return data;
  }
}
