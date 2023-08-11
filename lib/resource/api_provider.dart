import 'package:dio/dio.dart';
import 'package:rest_bloc/model/user_model.dart';

class ApiPprovider {
  Dio dio = Dio();

  String _url = "https://jsonplaceholder.typicode.com/todos";

  Future<List<UserModel>> fetchYsersList() async {
    try {
      Response response = await dio.get(_url);
      List<dynamic> value = response.data;
      return value.map((e) => UserModel.fromJson(e)).toList();
    } catch (e) {
      if (e.toString().contains("SocketException")) {
        return [UserModel.withError("Check your internet connection please")];
      }
      return [UserModel.withError(e.toString())];
    }
  }
}
