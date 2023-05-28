import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:famto_admin_app/model/error_model.dart';
import 'package:get_storage/get_storage.dart';

import 'api_exception.dart';
import 'package:http/http.dart' as http;

const String jsonContentType = 'application/json';
const String tenantName = 'credentialing';
String token = "";

class ApiManager {
  Future _getToken() async {
    // token = 'Bearer ${GetStorage().read(AppPreferences.accessToken)}';
    // print("token: " + token);
    token =
        'Bearer eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJxLTg3cml2a3BxcXRvbTZndG84NUFLeGlmeHlQMVFMMWVTMnFTS0RkY3dzIn0.eyJleHAiOjIxNDU3OTQ5MDcsImlhdCI6MTY2MTk1NDkwNywianRpIjoiMjEwOTIzMTEtOTFjMi00ZmVkLWEwMjctYjMzZmZmMTdhMGI0IiwiaXNzIjoiaHR0cHM6Ly9kZXYtaWRlbnRpdHkuc2ltcGxpZnlzYW5kYm94Lm5ldC9hdXRoL3JlYWxtcy9jcmVkZW50aWFsaW5nIiwiYXVkIjoiYWNjb3VudCIsInN1YiI6ImEwYTVjZjhjLTEwNzctNGM2Yy04OTRmLThjMTZlMGE5ZWIwZSIsInR5cCI6IkJlYXJlciIsImF6cCI6ImNyZWRlbnRpYWxpbmctc2VydmljZS1hY2NvdW50Iiwic2Vzc2lvbl9zdGF0ZSI6IjU0NTdlYmIyLTk4YTMtNGY4My1hZWYzLWRmZTJmZmFmMDZmZSIsImFjciI6IjEiLCJyZWFsbV9hY2Nlc3MiOnsicm9sZXMiOlsic3VwZXJfYWRtaW4iLCJkZWZhdWx0LXJvbGVzLWNyZWRlbnRpYWxpbmciLCJhZG1pbiJdfSwicmVzb3VyY2VfYWNjZXNzIjp7ImFjY291bnQiOnsicm9sZXMiOlsibWFuYWdlLWFjY291bnQiLCJtYW5hZ2UtYWNjb3VudC1saW5rcyIsInZpZXctcHJvZmlsZSJdfX0sInNjb3BlIjoib3BlbmlkIGVtYWlsIHByb2ZpbGUiLCJzaWQiOiI1NDU3ZWJiMi05OGEzLTRmODMtYWVmMy1kZmUyZmZhZjA2ZmUiLCJ0ZW5hbnRfaWQiOjEsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwibmFtZSI6IkNyZWRlbnRpYWxpbmcgU2VydmljZUFjY291bnQiLCJncm91cHMiOlsiL3NpbXBsaWZ5dm1zL1RydWVzdGFmZiJdLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJjcmVkZW50aWFsaW5nX3NlcnZpY2VfYWNjb3VudF91c2VyIiwiZ2l2ZW5fbmFtZSI6IkNyZWRlbnRpYWxpbmciLCJmYW1pbHlfbmFtZSI6IlNlcnZpY2VBY2NvdW50IiwiZW1haWwiOiJzaW1wbGlmeXZtc19zZXJ2aWNlX2FjY291bnRAc2ltcGxpZnl2bXMuY29tIn0.a8fYAMeyZz2rR7Ke7bIVsPXTcBGfMZZWnzScilxS9_W1pMkmmUtDAyzsl8UOlL1y0FSXOs97S6-fuxiNHVORXy3NgbkRd4bc3G5IKMFFWmnN5RcqTiVgYYuUcT0X-p61IuACtXrkNIwYS7sb5FJ36jnOfXJ7sfSWpaC2y0L7mv-QMjYDIKRa-uxjkP8PY0-dPE_fTQilrDC_vip7PWgHztJtWqA9TMQJfjY6RrfVC-tvVXwRdWyz2skFENewd_PeQGrWm-qVbdo67VocwAD86BDg5tlijPL8uDv7vfG9Rc3W_uIemyb7tqq4lcYfhA9IDJ_3docQB1jTg4nLYrNGsA';
  }

  // This method is used for call API for the `GET` method, need to pass API Url endpoint
  Future<dynamic> get(
    String url, {
    String contentType = jsonContentType,
    bool isTokenMandatory = false,
  }) async {
    print(url);
    await _getToken();

    try {
      // Declare the header for the request, if user not logged in then pass empty array as header or else pass the authentication token stored on login time
      Map<String, String> headers = {
        'Content-Type': contentType,
      };

      if (isTokenMandatory) {
        headers['Authorization'] = token;
      }

      print("Get url is ****************** $url");

      /*GetStorage().read(AppPreferencesHelper.pUser) == null
              ? {}
              : {
                  'Content-Type': 'application/json',
                  "session": LoginSuccessResponseModel.fromJson(
                          GetStorage().read(AppPreferencesHelper.pUser))
                      .session!,
                };*/

      // Make get method api call with header
      final response = await http.get(
        Uri.parse(url),
        headers: headers,
      );
      print("Success");

      // Get.printInfo(info: 'Response body of Get ${response.request!.url} ***********>> ${response.body}');

      var responsePayload = {"payload": json.decode(response.body)};

      // Handle response and errors
      // var responseJson =
      //     _returnResponse(json.decode(responsePayload.toString()));

      // print('Response Json ${responseJson.toString()}');
      print('Response Json ${responsePayload.toString}');
      print('Response Json ${responsePayload.runtimeType.toString()}');

      return responsePayload;
    } on SocketException {
      print("Failed");
      throw FetchDataException('No Internet connection');
    }
  }

  // This method is used for call API for the `POST` method, need to pass API Url endpoint
  Future<dynamic> post(
    String url,
    var parameters, {
    String contentType = jsonContentType,
    bool isTokenMandatory = true,
  }) async {
    await _getToken();

    try {
      // Declare the header for the request, if user not loged in then pass empty array as header
      Map<String, String> headers = {
        'Content-Type': contentType,
        'tenantName': tenantName,
      };

      if (isTokenMandatory) {
        headers['Authorization'] = token;
      }

      /*GetStorage().read(AppPreferencesHelper.pUser) == null
              ? {}
              : {
                  'Content-Type': 'application/json',
                  "session": LoginSuccessResponseModel.fromJson(
                          GetStorage().read(AppPreferencesHelper.pUser))
                      .session!,
                };*/

      // Make the post method api call with header and given parameter
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(parameters),
      );

      // Get.printInfo(info: 'Response body of Post ${response.request!.url} ***********>> ${response.body}');
      log('Response body -> ${response.body}');

      // Handle response and errors
      // Map<dynamic, dynamic> responseJson = _returnResponse(response);

      var responseJson = _returnResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  // This method is used for call API for the `PUT` method, need to pass API Url endpoint
  Future<dynamic> put(
    String url,
    var parameters, {
    String contentType = jsonContentType,
    bool isTokenMandatory = true,
  }) async {
    await _getToken();

    try {
      // Declare the header for the request, if user not logged in then pass empty array as header or else pass the authentication token stored on login time
      Map<String, String> headers = {
        'Content-Type': contentType,
        'tenantName': tenantName,
      };

      if (isTokenMandatory) {
        headers['Authorization'] = token;
      }
      /*GetStorage().read(AppPreferencesHelper.pUser) == null
              ? {'Content-Type': 'application/json'}
              : {
                  'Content-Type': 'application/json',
                  "session": LoginSuccessResponseModel.fromJson(
                          GetStorage().read(AppPreferencesHelper.pUser))
                      .session!
                };*/

      // Make the post method api call with header and given parameter
      final response = await http.put(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(parameters),
      );

      // Get.printInfo(info: 'Response body of Put ${response.request!.url} ***********>> ${response.body}');
      print(
          'Response body of Put ${response.request!.url} -> ${response.body}');

      // Handle response and errors
      // Map<dynamic, dynamic> responseJson = _returnResponse(response);
      var responseJson = _returnResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  // This method is used for call API for the `DELETE` method, need to pass API Url endpoint
  Future<dynamic> delete(
    String url,
    var parameters, {
    String contentType = jsonContentType,
    bool isTokenMandatory = true,
  }) async {
    await _getToken();

    try {
      // Declare the header for the request, if user not logged in then pass empty array as header or else pass the authentication token stored on login time
      Map<String, String> headers = {
        'Content-Type': contentType,
        'tenantName': tenantName,
      };

      if (isTokenMandatory) {
        headers['Authorization'] = token;
      }
      /*GetStorage().read(AppPreferencesHelper.pUser) == null
              ? {}
              : {
                  "session": LoginSuccessResponseModel.fromJson(
                          GetStorage().read(AppPreferencesHelper.pUser))
                      .session!
                };*/

      // Make the post method api call with header and given parameter
      final response = await http.delete(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(parameters),
      );

      // Get.printInfo(info: 'Response body of Delete ${response.request!.url} ***********>> ${response.body}');
      log('Response body of Delete ${response.request!.url} ***********>> ${response.body}');

      /// Handle response and errors
      // Map<dynamic, dynamic> responseJson = _returnResponse(response);
      var responseJson = _returnResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);
        log("Response Json ${response.statusCode} -> ${responseJson.toString()}");

        if (responseJson['status'] == false) {
          throw BadRequestException(
            'Err:${response.statusCode} ${responseJson['message']}',
            responseJson,
          );
        }
        return responseJson;
      case 201:
        var responseJson = json.decode(response.body);
        log("Response Json ${response.statusCode} -> ${responseJson.toString()}");

        if (responseJson['status'] == false) {
          throw BadRequestException(
            'Err:${response.statusCode} ${responseJson['message']}',
            responseJson,
          );
        }
        return responseJson;
      case 400:
        ErrorModel errorModel = ErrorModel.fromJson(json.decode(response.body));
        log("ErrorModel ${response.statusCode} -> ${errorModel.message}");
        throw BadRequestException(
          'Err:${response.statusCode} ${errorModel.message}',
          errorModel.toJson(),
        );
      case 401:
      case 403:
      case 404:
        ErrorModel errorModel = ErrorModel.fromJson(json.decode(response.body));
        log("ErrorModel ${response.statusCode} -> ${errorModel.message}");

        GetStorage().erase();
        // Get.offAllNamed(Routes.onboardRoute);
        // context.go(Routes.dashboardRoute);

        throw UnauthorisedException(
          'Err:${response.statusCode} ${errorModel.message}',
          errorModel.toJson(),
        );
      case 500: //TODO
        ErrorModel errorModel = ErrorModel.fromJson(json.decode(response.body));
        log("ErrorModel ${response.statusCode} -> ${errorModel.message}");
        var decodedJson = json.decode(response.body);
        String error = decodedJson["message"];
        throw FetchDataException(
          'Err:${response.statusCode} $error',
          errorModel.toJson(),
        );
      default:
        ErrorModel errorModel = ErrorModel.fromJson(json.decode(response.body));
        log("ErrorModel ${response.statusCode} -> ${errorModel.message}");
        throw FetchDataException(
          'Err:${response.statusCode} ${errorModel.message}',
          errorModel.toJson(),
        );
    }
  }
}
