import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:fore_cash/view/authentication/splash_screen.dart';
import 'package:get/get.dart' as getX;
import 'package:get_storage/get_storage.dart';

//test
const String baseUri = "https://node.staging.rentechdigital.com:3001/";

const String somethingWrong = "Something went wrong!";
const String responseMessage = "No response data found!";
const String interNetMessage = "please check your internet connection and try again latter.";
const String connectionTimeOutMessage = "Ops.. Server not working or might be in maintenance. Please Try Again Later";
const String authenticationMessage = "The session has been expired. Please log in again.";
const String tryAgain = "Try again";

int serviceCallCount = 0;
final storage = GetStorage();

///Status Code with message type array or string
// 501 : sql related err
// 401: validation array
// 201 : string error
// 400 : string error
// 200: response, string/null
// 422: array
class Api {
  getX.RxBool isLoading = false.obs;
  call({
    required String url,
    Map<String, dynamic>? params,
    required Function success,
    Function? error,
    ErrorMessageType errorMessageType = ErrorMessageType.snackBarOnlyError,
    MethodType methodType = MethodType.post,
    bool? isHideLoader = true,
    bool isProgressShow = true,
    FormData? formValues,
  }) async {
    if (await checkInternet()) {
      if (isProgressShow) {
        showProgressDialog(isLoading: isProgressShow);
      }
      /*if (formValues != null) {
        Map<String, dynamic> tempMap = <String, dynamic>{};
        for (var element in formValues.fields) {
          tempMap[element.key] = element.value;
        }
        FormData reGenerateFormData = FormData.fromMap(tempMap);
        for (var element in formValues.files) {
          reGenerateFormData.files.add(MapEntry(element.key, element.value));
        }
        formValues = reGenerateFormData;
      }*/

      Map<String, dynamic> headerParameters;
      headerParameters = {
        "authorization": storage.read("loginToken") != null
            // ? "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMGY2MjJlYzVkYWNkMDE2OWE4NGI5ZiIsImlhdCI6MTY0NTU4OTI4NywiZXhwIjoxNjQ1NjI1Mjg3fQ.qv_A7-dBFTr5I5abeJKBzdzMd72FlL0E2me5dxR5D6o"
            ? "Bearer " + storage.read("loginToken")
            : "Bearer" + " eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMGY2MjJlYzVkYWNkMDE2OWE4NGI5ZiIsImlhdCI6MTY0NTUwMzIzOSwiZXhwIjoxNjQ1NTM5MjM5fQ.8wWY0HWTlCD0mLFyJAaBhgEqTCyzR9Lm2USWn5C07Aw",
        // : "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMDFmYTBjOWM2ZTkxMDNlMTVkM2Q3YSIsImlhdCI6MTY0NDY1NDU4NCwiZXhwIjoxNjQ0NjkwNTg0fQ.3E1N11Kz8ciOKz6uXUEUZLjt05OUBvRtt2FLOfNBI_I",
        // 'Authorization':
        //     'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMDFmYTBjOWM2ZTkxMDNlMTVkM2Q3YSIsImlhdCI6MTY0NDY1NDU4NCwiZXhwIjoxNjQ0NjkwNTg0fQ.3E1N11Kz8ciOKz6uXUEUZLjt05OUBvRtt2FLOfNBI_I',
        // "timeZoneOffset": DateTime.now().timeZoneOffset,
        // "deviceType": Platform.isAndroid
        //     ? "1"
        //     : Platform.isIOS
        //         ? "2"
        //         : "3",
      };
      // if (kIsWeb) {
      //   headerParameters['Access-Control-Allow-Origin'] = '*';
      // }
      String mainUrl = baseUri + url;

      try {
        print("headerParameters ==>");
        print(headerParameters);
        Response response;
        if (methodType == MethodType.get) {
          response = await Dio().get(mainUrl,
              queryParameters: params,
              options: Options(
                headers: headerParameters,
                responseType: ResponseType.plain,
              ));
        } else if (methodType == MethodType.put) {
          response = await Dio().put(mainUrl,
              data: params,
              options: Options(
                headers: headerParameters,
                responseType: ResponseType.plain,
              ));
        } else {
          response = await Dio().post(mainUrl,
              data: formValues ?? params,
              options: Options(
                headers: headerParameters,
                responseType: ResponseType.plain,
              ));
          // if (response.statusCode == 200) {
          //   return response;
          // }
        }
        if (handleResponse(response)) {
          if (kDebugMode) {
            print('LOGIN TOKEN ${storage.read("loginToken") ?? ""}');
            print(url);
            print(params);
            print(response.data);
            // print(response);
          }

          ///postman response Code guj
          Map<String, dynamic>? responseData;
          responseData = jsonDecode(response.data);
          if (isHideLoader!) {
            //
            hideProgressDialog();
          }
          if (responseData?["success"] ?? false) {
            //#region alert
            if (errorMessageType == ErrorMessageType.snackBarOnlySuccess || errorMessageType == ErrorMessageType.snackBarOnResponse) {
              getX.Get.snackbar("Error", responseData?["message"]);
            } else if (errorMessageType == ErrorMessageType.dialogOnlySuccess || errorMessageType == ErrorMessageType.dialogOnResponse) {
              await apiAlertDialog(message: responseData?["message"], buttonTitle: "Okay");
            }
            //#endregion alert
            // if ((responseData?.containsKey("data") ?? false) && (responseData?["data"].containsKey("token") ?? false) && (responseData?["data"]["token"].toString().isNotEmpty ?? false)) {
            //   storage.write("loginToken", responseData?["data"]["token"]);
            // }
            success(responseData);
          } else {
            //region 401 = Session Expired  Manage Authentication/Session Expire
            if (response.statusCode == 401 || response.statusCode == 403) {
              print(responseData?["success"]);
              print(responseData?["message"]);
              unauthorizedDialog(responseData?["message"]);
            } else {
              //#region alert
              if (errorMessageType == ErrorMessageType.snackBarOnlyError || errorMessageType == ErrorMessageType.snackBarOnResponse) {
                getX.Get.snackbar("Error", responseData?["message"]);
              } else if (errorMessageType == ErrorMessageType.dialogOnlyError || errorMessageType == ErrorMessageType.dialogOnResponse) {
                await apiAlertDialog(message: responseData?["message"], buttonTitle: "Okay");
              }
              if (error != null) {
                //#endregion alert
                error(responseData);
              }
            }
            //endregion
          }
          isLoading.value = false;
        } else {
          if (isHideLoader!) {
            hideProgressDialog();
          }
          showErrorMessage(
              message: responseMessage,
              isRecall: true,
              callBack: () {
                getX.Get.back();
                call(params: params, url: url, success: success, error: error, isProgressShow: isProgressShow, methodType: methodType, formValues: formValues, isHideLoader: isHideLoader);
              });
          if (error != null) {
            error(response.toString());
          }
          isLoading.value = false;
        }
        isLoading.value = false;
      } on DioError catch (dioError) {
        //#region dioError
        dioErrorCall(
            dioError: dioError,
            onCallBack: (String message, bool isRecallError) {
              showErrorMessage(
                  message: message,
                  isRecall: isRecallError,
                  callBack: () {
                    if (serviceCallCount < 3) {
                      serviceCallCount++;

                      if (isRecallError) {
                        getX.Get.back();
                        call(
                          params: params,
                          url: url,
                          success: success,
                          error: error,
                          isProgressShow: isProgressShow,
                          methodType: methodType,
                          formValues: formValues,
                          isHideLoader: isHideLoader,
                        );
                      } else {
                        getX.Get.back(); // For redirecting to back screen
                      }
                    } else {
                      getX.Get.back(); // For redirecting to back screen
                      // GeneralController.to.selectedTab.value = 0;
                      // getX.Get.offAll(() => DashboardTab());
                    }
                  });
            });
        isLoading.value = false;
        //#endregion dioError
      } catch (e) {
        //#region catch
        if (kDebugMode) {
          print(e);
        }
        hideProgressDialog();
        showErrorMessage(
            message: e.toString(),
            isRecall: true,
            callBack: () {
              getX.Get.back();
              call(params: params, url: url, success: success, error: error, isProgressShow: isProgressShow, methodType: methodType, formValues: formValues, isHideLoader: isHideLoader);
            });
        isLoading.value = false;
        //#endregion catch
      }
    } else {
      //#region No Internet
      showErrorMessage(
          message: interNetMessage,
          isRecall: true,
          callBack: () {
            getX.Get.back();
            call(params: params, url: url, success: success, error: error, isProgressShow: isProgressShow, methodType: methodType, formValues: formValues, isHideLoader: isHideLoader);
          });
      //#endregion No Internet
    }
  }
}

showErrorMessage({required String message, required bool isRecall, required Function callBack}) {
  serviceCallCount = 0;
  // serviceCallCount++;
  hideProgressDialog();
  apiAlertDialog(
      buttonTitle: serviceCallCount < 3 ? tryAgain : "Restart App",
      message: message,
      buttonCallBack: () {
        callBack();
      });
}

void showProgressDialog({bool isLoading = true}) {
  isLoading = true;
  getX.Get.dialog(
      WillPopScope(
        onWillPop: () => Future.value(false),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
      barrierColor: Colors.black12,
      barrierDismissible: false);
}

void hideProgressDialog({bool isLoading = true, bool isProgressShow = true, bool isHideLoader = true}) {
  isLoading = false;
  if ((isProgressShow || isHideLoader) && getX.Get.isDialogOpen!) {
    getX.Get.back();
  }
}

dioErrorCall({required DioError dioError, required Function onCallBack}) {
  switch (dioError.type) {
    case DioErrorType.other:
    case DioErrorType.connectTimeout:
      // onCallBack(connectionTimeOutMessage, false);
      onCallBack(dioError.message, true);
      break;
    case DioErrorType.response:
    case DioErrorType.cancel:
    case DioErrorType.receiveTimeout:
    case DioErrorType.sendTimeout:
    default:
      onCallBack(dioError.message, true);
      break;
  }
}

Future<bool> checkInternet() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}

unauthorizedDialog(message) async {
  if (!getX.Get.isDialogOpen!) {
    getX.Get.dialog(
      WillPopScope(
        onWillPop: () {
          return Future.value(false);
        },
        child: CupertinoAlertDialog(
          title: Text(appName),
          content: Text(message ?? authenticationMessage),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: const Text("Okay"),
              onPressed: () {
                //restart the application
                storage.erase();
                getX.Get.offAll(const SplashScreen());
              },
            ),
          ],
        ),
      ),
      barrierDismissible: false,
      transitionCurve: Curves.easeInCubic,
      transitionDuration: const Duration(milliseconds: 400),
    );
  }
}

bool handleResponse(Response response) {
  try {
    if (isNotEmptyString(response.toString())) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}

isNotEmptyString(str) {
  return str != null && str.toString().isNotEmpty;
}

apiAlertDialog({required String message, String? buttonTitle, Function? buttonCallBack, bool isShowGoBack = true}) async {
  if (!getX.Get.isDialogOpen!) {
    await getX.Get.dialog(
      WillPopScope(
        onWillPop: () {
          return isShowGoBack ? Future.value(true) : Future.value(false);
        },
        child: CupertinoAlertDialog(
          title: Text(appName),
          content: Text(message),
          actions: isShowGoBack
              ? [
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    child: Text(isNotEmptyString(buttonTitle) ? buttonTitle! : "Try again"),
                    onPressed: () {
                      if (buttonCallBack != null) {
                        buttonCallBack();
                      } else {
                        getX.Get.back();
                      }
                    },
                  ),
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    child: const Text("Go Back"),
                    onPressed: () {
                      getX.Get.back();
                      getX.Get.back();
                    },
                  )
                ]
              : [
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    child: Text(isNotEmptyString(buttonTitle) ? buttonTitle! : "Try again"),
                    onPressed: () {
                      if (buttonCallBack != null) {
                        buttonCallBack();
                      } else {
                        getX.Get.back();
                      }
                    },
                  ),
                ],
        ),
      ),
      barrierDismissible: false,
      transitionCurve: Curves.easeInCubic,
      transitionDuration: const Duration(milliseconds: 400),
    );
  }
}

enum MethodType { get, post, put }

enum ErrorMessageType { snackBarOnlyError, snackBarOnlySuccess, snackBarOnResponse, dialogOnlyError, dialogOnlySuccess, dialogOnResponse, none }
