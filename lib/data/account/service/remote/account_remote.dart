// Created by Manfred MOUKATE on 6/25/24, 3:50 PM
// Email moukatemanfred@gmail.com
// Copyright (c) 2024. All rights reserved.
// Last modified 6/25/24, 3:50 PM

import 'package:dio/dio.dart';

import '../../../../app/config/constant.dart';
import '../../../shared/service/remote/base_api_service.dart';
import '../../../shared/service/remote/endpoints.dart';
import '../../../shared/service/remote/network.dart';
import 'model/account_api_model.dart';
import 'model/motif_api_model.dart';
import 'model/paiement_api_model.dart';

class AccountRemote extends BaseApiService {
  AccountRemote();

  Future<Dio> _getDio() async {
    return Network.createHttpClient(
      baseUrl: Constants.apiBaseUrlDev,
      debugMode: true,
    );
  }

  Future<AccountApiResponse> getAccount({
    required int? token,
  }) async {
    try {
      final response = await (await _getDio()).put(Endpoints.account, data: {
        "token": token,
      });
      if (response.data['status'] == 1) {
        return AccountApiResponse.fromJson(response.data);
      } else {
        throw DioError(
            requestOptions: RequestOptions(path: ''),
            response: Response(
                requestOptions: RequestOptions(path: ''),
                statusCode: 201,
                data: response.data));
      }
    } catch (ex) {
      throw mapToError(ex);
    }
  }

  Future<MotifApiListResponse> getMotif() async {
    try {
      final response = await (await _getDio()).get(Endpoints.motif);
      if (response.data['status'] == 1) {
        return MotifApiListResponse.fromJson(response.data);
      } else {
        throw DioError(
            requestOptions: RequestOptions(path: ''),
            response: Response(
                requestOptions: RequestOptions(path: ''),
                statusCode: 201,
                data: response.data));
      }
    } catch (ex) {
      throw mapToError(ex);
    }
  }

  Future<MotifApiResponse> saveMotif({
    int? token,
    required String name,
  }) async {
    try {
      final response = await (await _getDio()).post(Endpoints.saveMotif, data: {
        'token': token,
        'name': name,
      });
      if (response.data['status'] == 1) {
        return MotifApiResponse.fromJson(response.data);
      } else {
        throw DioError(
            requestOptions: RequestOptions(path: ''),
            response: Response(
                requestOptions: RequestOptions(path: ''),
                statusCode: 201,
                data: response.data));
      }
    } catch (ex) {
      throw mapToError(ex);
    }
  }

  Future<PaiementApiResponse> createPaiement({
    int? token,
    required bool type,
    required String date,
    required int amount,
    required int motif,
    required int account,
  }) async {
    try {
      final response = await (await _getDio()).get(Endpoints.paiement, data: {
        'token': token,
        'date': date,
        'amount': amount,
        'motif': motif,
        'account': account,
        'type': type,
      });
      if (response.data['status'] == 1) {
        return PaiementApiResponse.fromJson(response.data);
      } else {
        throw DioError(
            requestOptions: RequestOptions(path: ''),
            response: Response(
                requestOptions: RequestOptions(path: ''),
                statusCode: 201,
                data: response.data));
      }
    } catch (ex) {
      throw mapToError(ex);
    }
  }

  Future<PaiementApiListResponse> getPaiement({
    required int? token,
  }) async {
    try {
      final response = await (await _getDio()).put(Endpoints.myPaiement, data: {
        "token": token,
      });
      if (response.data['status'] == 1) {
        return PaiementApiListResponse.fromJson(response.data);
      } else {
        throw DioError(
            requestOptions: RequestOptions(path: ''),
            response: Response(
                requestOptions: RequestOptions(path: ''),
                statusCode: 201,
                data: response.data));
      }
    } catch (ex) {
      throw mapToError(ex);
    }
  }
}
