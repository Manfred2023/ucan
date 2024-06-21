import 'package:dio/dio.dart';

import '../../../../app/config/constant.dart';
import '../../../shared/service/remote/endpoints.dart';
import '../../../shared/service/remote/network.dart';
import 'model/auth_api_model.dart';
import 'model/contact_api_model.dart';

class AuthenticateRemote {
  AuthenticateRemote();

  Future<Dio> _getDio() async {
    return Network.createHttpClient(
      baseUrl: Constants.apiBaseUrlDev,
      debugMode: true,
    );
  }

  Future<ContactApiResponse> createContact({
    int? token,
    String? firstname,
    required String lastname,
    required String mobile,
    required bool gender,
    required String email,
    required String city,
    required String? location,
  }) async {
    try {
      final response =
          await (await _getDio()).post(Endpoints.createContact, data: {
        "token": token,
        "firstname": firstname,
        "lastname": lastname,
        "mobile": mobile,
        "gender": gender,
        "email": email,
        "city": city,
        "location": location,
      });
      if (response.data['status'] == 1) {
        return ContactApiResponse.fromJson(response.data);
      } else {
        throw DioError(
            requestOptions: RequestOptions(path: ''),
            response: Response(
                requestOptions: RequestOptions(path: ''),
                statusCode: 201,
                data: response.data));
      }
    } catch (ex) {
      throw Exception(ex);
    }
  }

  Future<AuthApiResponse> createUser({
    int? token,
    required int pin,
    required int code,
    required int contact,
  }) async {
    try {
      final response =
          await (await _getDio()).post(Endpoints.createUser, data: {
        "token": token,
        "pin": pin,
        "code": code,
        "contact": contact,
      });
      if (response.data['status'] == 1) {
        return AuthApiResponse.fromJson(response.data);
      } else {
        throw DioError(
            requestOptions: RequestOptions(path: ''),
            response: Response(
                requestOptions: RequestOptions(path: ''),
                statusCode: 201,
                data: response.data));
      }
    } catch (ex) {
      throw Exception(ex);
    }
  }
}