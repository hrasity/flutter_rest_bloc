import 'package:rest_bloc/model/user_model.dart';
import 'package:rest_bloc/resource/api_provider.dart';

class ApiRepository {
  final ApiPprovider _apiPprovider = ApiPprovider();

  Future<List<UserModel>> fetchUserList() {
    return _apiPprovider.fetchYsersList();
  }
}

class NetworkError extends Error {}
