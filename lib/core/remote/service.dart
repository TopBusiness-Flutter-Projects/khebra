// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print, unnecessary_brace_in_string_interps

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:khebra/core/models/all_products_model.dart';
import 'package:khebra/core/models/all_provider_model.dart';
import 'package:khebra/core/models/category_model.dart';
import 'package:khebra/core/models/defaul_model.dart';
import 'package:khebra/core/models/odoo_error_model.dart';
import 'package:khebra/core/models/user_data_model.dart';
import 'package:odoo_rpc/odoo_rpc.dart';

import '../api/base_api_consumer.dart';
import '../api/end_points.dart';
import '../error/exceptions.dart';
import '../error/failures.dart';
import '../models/login_model.dart';
import '../preferences/preferences.dart';

class ServiceApi {
  final BaseApiConsumer dio;
  ServiceApi(this.dio);

  Future<String> getSessionId(
      {required String phone,
      required String password,
      String? baseUrl,
      String? database}) async {
    try {
      final odoo = OdooClient(baseUrl ?? EndPoints.baseUrl);
      final odoResponse =
          await odoo.authenticate(database ?? EndPoints.db, phone, password);

      final sessionId = odoResponse.id;
      print("getSessionId = $sessionId");
      await Preferences.instance.setSessionId(sessionId);
      return sessionId;
    } on OdooException catch (e) {
      print("dddddddddddddd" + e.message);
      return "error";
      // return Future.error(ServerFailure(message: e.message));
    }
  }

  Future<Either<ServerFailure, AuthModel>> login(
      String phoneOrMail, String password) async {
    String sessionIddd =
        await getSessionId(phone: phoneOrMail, password: password);
    if (sessionIddd == 'error') {
      return Left(ServerFailure(message: "server_error".tr()));
    } else {
      try {
        final response = await dio.post(
          EndPoints.auth,
          options: Options(
            headers: {"Cookie": "frontend_lang=en_US;session_id=$sessionIddd"},
          ),
          body: {
            "params": {
              'login': phoneOrMail,
              "password": password,
              "db": EndPoints.db
            },
          },
        );
        return Right(AuthModel.fromJson(response));
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    }
  }

  Future<Either<ServerFailure, DefaultModel>> register(
      {required String phoneOrMail,
      required String name,
      required String password}) async {
    String sessionIddd = await getSessionId(phone: "admin", password: "admin");
    if (sessionIddd == 'error') {
      return Left(ServerFailure(message: "server_error".tr()));
    } else {
      try {
        final response = await dio.post(
          EndPoints.register,
          options: Options(
            headers: {"Cookie": "frontend_lang=en_US;session_id=$sessionIddd"},
          ),
          body: {
            "params": {
              "data": {
                "name": name,
                "login": phoneOrMail,
                "password": password,
                "sel_groups_1_9_10": 1,
                "user_type": "client"
              }
            },
          },
        );
        return Right(DefaultModel.fromJson(response));
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    }
  }

  Future<Either<Failure, DefaultModel>> updatePartner({
    required int userId,
    required String image,
    required String address,
    required String mobile,
  }) async {
    String? sessionId = await Preferences.instance.getSessionId();
    try {
      final response = await dio.put(EndPoints.updatePartner,
          options: Options(
            headers: {"Cookie": "session_id=$sessionId"},
          ),
          body: {
            "params": {
              "filter": [
                [
                  "user_ids",
                  "=",
                  [userId]
                ]
              ],
              "data": {
                "image_medium": "", //base_64
                "mobile": "$mobile",
                "street": address
              }
            }
          });
      return Right(DefaultModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
  Future<Either<Failure, DefaultModel>> updateProfile({
    
    required String image,
    //required String address,
    required String mobile,
  }) async {
    String? sessionId = await Preferences.instance.getSessionId();
    String userId = await Preferences.instance.getUserId() ?? "1";
    try {
      final response = await dio.put(EndPoints.updatePartner,
          options: Options(
            headers: {"Cookie": "session_id=3ffb870cac23ecc333fe57c3248dc7c8ebbcad47"},
          ),
          body: {
            "params": {
              "filter": [
                [
                  "user_ids",
                  "=",
                  [userId]
                ]
              ],
              "data": {
                "image_medium": image, //base_64
                "mobile": "$mobile"
               
              }
            }
          });
      return Right(DefaultModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

//// Home

/////////////////////////////////////////
  Future<Either<Failure, AllCategoriesModel>> getAllCategories() async {
    try {
      String? sessionId = await Preferences.instance.getSessionId();
      final response = await dio.get(
        EndPoints.allCategoriesUrl,
        options: Options(
          headers: {"Cookie": "frontend_lang=en_US;session_id=$sessionId"},
        ),
      );

      return Right(AllCategoriesModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, AllProductsModel>> getAllProducts(int page) async {
    try {
      // String? sessionId = '135b0fdbcf1b433641f448914ed5015d84a5c903';
      String? sessionId = await Preferences.instance.getSessionId();

      final response = await dio.get(
        EndPoints.allProducts +
            '?filter=[["is_service_app","=","true"]]&query={id,categ_id,name,list_price,image_1920}&page_size=10&limit=10&page=$page',
        options: Options(
          headers: {"Cookie": "frontend_lang=en_US;session_id=$sessionId"},
        ),
      );
      print("lllllllllllll" + response.toString());
      return Right(AllProductsModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, AllProductsModel>> getAllProductsPrices(
      int page, bool isWithPrice) async {
    try {
      String priceMark = "=";
      if (isWithPrice) {
        priceMark = "!=";
      }
      String? sessionId = await Preferences.instance.getSessionId();
      final response = await dio.get(
        EndPoints.allProducts +
            '?filter=[["is_service_app","=","true"],["list_price", "$priceMark","0.0"]]&query={id,categ_id,name,list_price,image_1920}&page_size=10&limit=10&page=$page',
        options: Options(
          headers: {"Cookie": "frontend_lang=en_US;session_id=$sessionId"},
        ),
      );
      print("lllllllllllll" + response.toString());
      return Right(AllProductsModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, AllProductsModel>> searchProducts(
      int page, String name) async {
    try {
      // String? sessionId = '135b0fdbcf1b433641f448914ed5015d84a5c903';
      String? sessionId = await Preferences.instance.getSessionId();

      final response = await dio.get(
        EndPoints.allProducts +
            '?filter=[["is_service_app","=","true"],["name", "=like", "%$name%"]]&query={id,categ_id,name,list_price,image_1920}&page_size=10&limit=10&page=$page',
        options: Options(
          headers: {"Cookie": "frontend_lang=en_US;session_id=$sessionId"},
        ),
      );
      print("lllllllllllll" + response.toString());
      return Right(AllProductsModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, AllProductsModel>> getAllProductsByCategory(
      {required int categoryId}) async {
    try {
      String? sessionId = await Preferences.instance.getSessionId();
      final response = await dio.get(
        EndPoints.allCategoryProducts,
        queryParameters: {
          'filter': '[["categ_id", "=", [$categoryId]]]',
          'query': '{id,categ_id,name,list_price,image_1920}'
        },
        options: Options(
          headers: {"Cookie": "frontend_lang=en_US;session_id=$sessionId"},
        ),
      );

      return Right(AllProductsModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, GetAllProviderModel>> getProviders(
     // int page, int pageSize
      ) async {
    try {
     

      String? sessionId = await Preferences.instance.getSessionId();
      final response = await dio.get(
        EndPoints.getProviders,
         //+'&page_size=$pageSize&page=$page',
        options: Options(
          headers: {"Cookie": "frontend_lang=en_US;session_id=$sessionId"},
        ),
      );
      return Right(GetAllProviderModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  // Future<Either<Failure, AuthModel>> postLoginAsAdmin2(
  //     String phoneOrMail, String password) async {
  //   try {
  //     final response = await dio.post(
  //       EndPoints.auth,
  //       body: {
  //         "params": {
  //           'login': phoneOrMail,
  //           "password": password,
  //           "db": EndPoints.db
  //         },
  //       },
  //     );
  //     String sessionId =
  //         await getSessionId(phone: phoneOrMail, password: password);
  //     //String sessionId = await getSessionId(phone: "api", password: "api");
  //     await Preferences.instance.setSessionId(sessionId);
  //     await Preferences.instance.setUser2(AuthModel.fromJson(response));
  //     await Preferences.instance.isAdmin(true);
  //     return Right(AuthModel.fromJson(response));
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }

//   Future<Either<Failure, GetCompanyDataModel>> getCompanyData() async {
//     AuthModel authModel = await Preferences.instance.getUser();
//     try {
//       String? sessionId = await Preferences.instance.getSessionId();
//       final response = await dio.get(
//         EndPoints.companyData +
//             'query={id, name,street,currency_id,country_code,account_sale_tax_id,vat,company_registry,logo}&filter=[["id","=","${authModel.result!.userCompanies!.currentCompany!}"]]',
//         options: Options(
//           headers: {"Cookie": "frontend_lang=en_US;session_id=$sessionId"},
//         ),
//       );

//       return Right(GetCompanyDataModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   Future<Either<Failure, GetTaxesModel>> getTaxes(int taxId) async {
//     try {
//       String? sessionId = await Preferences.instance.getSessionId();
//       final response = await dio.get(
//         EndPoints.getTaxes + 'filter=[["id", "=", $taxId]]',
//         options: Options(
//           headers: {"Cookie": "frontend_lang=en_US;session_id=$sessionId"},
//         ),
//       );

//       return Right(GetTaxesModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   Future<Either<Failure, GetCurrencyNameModel>> getCurrencyName(
//       int companyId) async {
//     try {
//       String? sessionId = await Preferences.instance.getSessionId();
//       final response = await dio.get(
//         EndPoints.currencyName +
//             'query={id, name}&filter=[["id","=","$companyId"]]',
//         options: Options(
//           headers: {"Cookie": "frontend_lang=en_US;session_id=$sessionId"},
//         ),
//       );

//       return Right(GetCurrencyNameModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   Future<Either<Failure, AllProductsModel>> getAllProductsByCategory(
//       {required int categoryId}) async {
//     try {
//       String? sessionId = await Preferences.instance.getSessionId();
//       final response = await dio.get(
//         EndPoints.allCategoryProducts,
//         queryParameters: {
//           'filter': '[["categ_id", "=", [$categoryId]]]',
//           'query':
//               '{id,name,qty_available,list_price,taxes_id,currency_id,uom_name,uom_id,categ_id,image_1920}'
//         },
//         options: Options(
//           headers: {"Cookie": "frontend_lang=en_US;session_id=$sessionId"},
//         ),
//       );

//       return Right(AllProductsModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   Future<Either<Failure, GetAllPartnersReportsModel>> getAllPartnersForReport(
//       int page, int pageSize) async {
//     try {
//       AuthModel authModel = await Preferences.instance.getUser();
//       print("lllllllllll${authModel.result!.userSettings!.id}");

//       String? sessionId = await Preferences.instance.getSessionId();
//       final response = await dio.get(
//         EndPoints.getAllPartners +
//             'page_size=$pageSize&page=$page&filter=[["user_id", "=",${authModel.result!.userContext!.uid}]]',
//         options: Options(
//           headers: {"Cookie": "frontend_lang=en_US;session_id=$sessionId"},
//         ),
//       );
//       return Right(GetAllPartnersReportsModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

  Future<Either<Failure, GetUserDataModel>> getUserData() async {
    try {
      String userId = await Preferences.instance.getUserId() ?? "1";
      print("lllllllllll${userId}");

      String? sessionId = await Preferences.instance.getSessionId();
      final response = await dio.get(
        EndPoints.getUserData + '&filter=[["id", "=","${userId}"]]',
        options: Options(
          headers: {"Cookie": "frontend_lang=en_US;session_id=$sessionId"},
        ),
      );
      return Right(GetUserDataModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
// //vhmcvmbvm
// //   Future<Either<Failure, AuthModel>> postLoginAsAdmin2(
// //       String phoneOrMail, String password) async {
// //     try {
// //       final response = await dio.post(
// //         EndPoints.loginUrl,
// //         body: {
// //           "params": {
// //             'login': phoneOrMail,
// //             "password": password,
// //             "db": "kreezmart.com"
// //           },
// //         },
// //       );
// //       String sessionId = await getSessionId(phone: "api", password: "api");

//   Future<Either<Failure, AuthModel>> authWithDB({
//     required String phoneOrMail,
//     required String password,
//     required String db,
//     required String name,
//     required String odooLink,
//   }) async {
//     try {
//       String? sessionId = await getSessionId(
//           phone: phoneOrMail,
//           password: password,
//           baseUrl: odooLink,
//           database: db);

//       EndPoints.baseUrl = odooLink;
//       EndPoints.db = db;
//       final response = await dio.post(
//         odooLink + "/auth/",
//         options: Options(
//           headers: {"Cookie": "frontend_lang=en_US;session_id=$sessionId"},
//         ),
//         body: {
//           "params": {'login': phoneOrMail, "password": password, "db": db},
//         },
//       );
//       // String sessionId =
//       //     await getSessionId(phone: phoneOrMail, password: password);
//       // await Preferences.instance.setSessionId(sessionId);

//       //  await Preferences.instance.isAdmin(true);
//       //  print(response.toString());
//       return Right(AuthModel.fromJson(response));
//     } on ServerException {
//       print('ddddddddddd');
//       return Left(ServerFailure());
//     }
//   }

//   Future<Either<Failure, AuthModel>> authWithSession(
//       String phoneOrMail, String password, String db) async {
//     try {
//       final response = await dio.post(
//         EndPoints.authWithSession,
//         body: {
//           "jsonrpc": "2.0",
//           "params": {
//             "is_system": false,
//             'login': phoneOrMail,
//             "password": password,
//             "db": db
//           },
//         },
//       );
//       // String sessionId =
//       //     await getSessionId(phone: phoneOrMail, password: password);
//       // await Preferences.instance.setSessionId(sessionId);

//       //  await Preferences.instance.isAdmin(true);
//       //  print(response.toString());
//       return Right(AuthModel.fromJson(response));
//     } on ServerException {
//       print('ddddddddddd');
//       return Left(ServerFailure());
//     }
//   }

// /////////////////////////////////////////////////////
//   Future<Either<Failure, AuthModel>> postLoginAsTrueUser2(
//       String phoneOrMail, String password) async {
//     try {
//       //todo may be only session id
//       String? sessionId = await Preferences.instance.getSessionIdTrueUser();
//       final response = await dio.post(
//         EndPoints.auth,
//         options: Options(
//           headers: {"Cookie": "session_id=$sessionId"},
//         ),
//         body: {
//           "params": {
//             'login': phoneOrMail,
//             "password": password,
//             "db": EndPoints.db
//           },
//         },
//       );
//       String? sessionId2 =
//           await getSessionId(phone: phoneOrMail, password: password);
//       await Preferences.instance.setSessionIdTruUser(sessionId2);
//       await Preferences.instance.setUser2(AuthModel.fromJson(response));
//       await Preferences.instance.isAdmin(false); //todo-->
//       return Right(AuthModel.fromJson(response));
//     } on ServerException {
//       print('ddddddddddd');
//       return Left(ServerFailure());
//     }
//   }

//   int? partnerId;

  // Future<Either<Failure, DefaultModel>> createSaleOrder(
  //     int partnerId, String? wareHouseId) async {
  //   String? sessionId = await Preferences.instance.getSessionId();
  //   AuthModel authModel = await Preferences.instance.getUser();
  //   print("*****************************************************");
  //   print("session id  = $sessionId");
  //   print("partner id  = ${authModel.result!.partnerId!}");
  //   try {
  //     final response = await dio
  //         .post(EndPoints.saleOrder,
  //             options: Options(
  //               headers: {"Cookie": "session_id=$sessionId"},
  //             ),
  //             body: wareHouseId != ""
  //                 ? {
  //                     "params": {
  //                       "data": {
  //                         "partner_id": partnerId,
  //                         "user_id": authModel.result!.userContext!.uid,
  //                         "state": "sale",
  //                         "type_name": "Sales Order",
  //                         "warehouse_id": wareHouseId
  //                       }
  //                     }
  //                   }
  //                 : {
  //                     "params": {
  //                       "data": {
  //                         "partner_id": partnerId,
  //                         "user_id": authModel.result!.userContext!.uid,
  //                         "state": "sale",
  //                         "type_name": "Sales Order"
  //                       }
  //                     }
  //                   })
  //         .onError((error, stackTrace) {
  //       print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
  //       print(error.toString());
  //     });
  //     var r = response;
  //     print("_____________________________________________________");
  //     print(response);
  //     // Preferences.instance.setSaleOrder(AuthModel.fromJson(response).result);
  //     return Right(DefaultModel.fromJson(response));
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }

  // Future<Either<Failure, DefaultModel>> createSaleOrderLines(
  //     {required orderId,
  //     required int productId,
  //     price,
  //     required productQuantity}) async {
  //   String? sessionId = await Preferences.instance.getSessionId();
  //   try {
  //     final response = await dio.post(EndPoints.saleOrderLine,
  //         options: Options(
  //           headers: {"Cookie": "session_id=$sessionId"},
  //         ),
  //         body: {
  //           "params": {
  //             "data": {
  //               "order_id": orderId,
  //               "product_id": productId,
  //               "state": "sale",
  //               "price_unit": price,
  //               "product_uom_qty": productQuantity
  //             }
  //           }
  //         });
  //     return Right(DefaultModel.fromJson(response));
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }

  // Future<Either<Failure, DefaultModel>> createPayment(
  //     {required partnerId, required journalId, required amount}) async {
  //   String? sessionId = await Preferences.instance.getSessionId();
  //   try {
  //     final response = await dio.post(EndPoints.createPayment,
  //         options: Options(
  //           headers: {"Cookie": "session_id=$sessionId"},
  //         ),
  //         body: {
  //           "params": {
  //             "data": {
  //               "partner_id": partnerId,
  //               "payment_type": "inbound",
  //               "partner_type": "customer",
  //               "journal_id": journalId,
  //               "amount": amount
  //             }
  //           }
  //         });
  //     return Right(DefaultModel.fromJson(response));
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }

  // Future<Either<Failure, DefaultModel>> confirmPayment(
  //     {required paymentId}) async {
  //   String? sessionId = await Preferences.instance.getSessionId();
  //   try {
  //     final response =
  //         await dio.post(EndPoints.confirmPayment + '$paymentId/action_post/',
  //             options: Options(
  //               headers: {"Cookie": "session_id=$sessionId"},
  //             ),
  //             body: {});
  //     return Right(DefaultModel.fromJson(response));
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }

  // Future<Either<Failure, DefaultModel>> createInvoice({
  //   required partnerId,
  // }) async {
  //   String? sessionId = await Preferences.instance.getSessionId();
  //   AuthModel authModel = await Preferences.instance.getUser();
  //   try {
  //     final response = await dio.post(EndPoints.createInvoice,
  //         options: Options(
  //           headers: {"Cookie": "session_id=$sessionId"},
  //         ),
  //         body: {
  //           "params": {
  //             "data": {
  //               "partner_id": partnerId,
  //               "invoice_user_id": authModel.result!.userContext!.uid,
  //               "move_type": "out_invoice"
  //             }
  //           }
  //         });
  //     return Right(DefaultModel.fromJson(response));
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }

  // Future<Either<Failure, DefaultModel>> invoiceLine(
  //     {required moveId, required productId, required quantity}) async {
  //   String? sessionId = await Preferences.instance.getSessionId();
  //   try {
  //     final response = await dio.post(EndPoints.invoiceLine,
  //         options: Options(
  //           headers: {"Cookie": "session_id=$sessionId"},
  //         ),
  //         body: {
  //           "params": {
  //             "data": {
  //               "move_id": moveId,
  //               "product_id": productId,
  //               "quantity": quantity
  //             }
  //           }
  //         });
  //     return Right(DefaultModel.fromJson(response));
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }

  // Future<Either<Failure, DefaultModel>> createPartner(
  //     {required String name,
  //     required String mobile,
  //     required String street}) async {
  //   String? sessionId = await Preferences.instance.getSessionId();
  //   AuthModel authModel = await Preferences.instance.getUser();
  //   final companyId = authModel.result!.userCompanies!.currentCompany;
  //   try {
  //     final response = await dio.post(EndPoints.addPartner,
  //         options: Options(
  //           headers: {"Cookie": "session_id=$sessionId"},
  //         ),
  //         body: {
  //           "params": {
  //             "data": {
  //               "name": name,
  //               "mobile": mobile,
  //               "company_id": companyId,
  //               "street": street,
  //               "user_id": authModel.result!.userContext!.uid
  //             }
  //             // "data": {
  //             //   "name": name,
  //             //   "mobile": mobile,
  //             //   "company_id": 1,
  //             //   "street": street,
  //             // }
  //           }
  //         });
  //     return Right(DefaultModel.fromJson(response));
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }

  // Future<Either<Failure, DefaultModel>> addNewLead(
  //     {required String name,
  //     required String mobile,
  //     required String description,
  //     required int partnerId,
  //     required String street}) async {
  //   AuthModel authModel = await Preferences.instance.getUser();
  //   final companyId = authModel.result!.userCompanies!.currentCompany;
  //   String? sessionId = await Preferences.instance.getSessionId();
  //   try {
  //     final response = await dio.post(EndPoints.newLead,
  //         options: Options(
  //           headers: {"Cookie": "session_id=$sessionId"},
  //         ),
  //         body: {
  //           "params": {
  //             "data": {
  //               "name": name,
  //               "partner_id": partnerId,
  //               "phone": mobile,
  //               "street": street,
  //               "expected_revenue": 0,
  //               "description": description,
  //               "company_id": companyId,
  //               "user_id": authModel.result!.userContext!.uid
  //             }
  //           }
  //         });
  //     return Right(DefaultModel.fromJson(response));
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }

  // Future<Either<Failure, GetAllLeadsModel>> getAllLeads() async {
  //   AuthModel authModel = await Preferences.instance.getUser();
  //   String? sessionId = await Preferences.instance.getSessionId();
  //   try {
  //     final response = await dio.get(
  //       EndPoints.newLead +
  //           '?query={name,create_date, description,street,phone}&filter=[["user_id", "=",${authModel.result!.userContext!.uid}]]',
  //       options: Options(
  //         headers: {"Cookie": "session_id=$sessionId"},
  //       ),
  //     );
  //     return Right(GetAllLeadsModel.fromJson(response));
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }

  // ///////// orders
  // Future<Either<Failure, GetOrdersModel>> getOrders() async {
  //   AuthModel authModel = await Preferences.instance.getUser();
  //   String? sessionId = await Preferences.instance.getSessionId();
  //   try {
  //     final response = await dio.get(
  //       EndPoints.saleOrder +
  //           '?query={id,partner_id,display_name,state,write_date,amount_total}&filter=[["user_id", "=",${authModel.result!.userContext!.uid}]]',
  //       // '?query={id,partner_id,display_name,state,write_date,amount_total}&filter=[["user_id", "=",1]]',
  //       options: Options(
  //         headers: {"Cookie": "session_id=$sessionId"},
  //       ),
  //     );
  //     return Right(GetOrdersModel.fromJson(response));
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }

  // Future<Either<Failure, WareHouseModelResponse>> getWareHouses() async {
  //   AuthModel authModel = await Preferences.instance.getUser();
  //   String? sessionId = await Preferences.instance.getSessionId();
  //   try {
  //     final response = await dio.get(
  //       EndPoints.wareHouse +
  //           '?query={id,name,user_id}&filter=[["user_id", "=",${authModel.result!.userContext!.uid}]]',
  //       // '?query={id,partner_id,display_name,state,write_date,amount_total}&filter=[["user_id", "=",1]]',
  //       options: Options(
  //         headers: {"Cookie": "session_id=$sessionId"},
  //       ),
  //     );
  //     return Right(WareHouseModelResponse.fromJson(response));
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }

  // Future<Either<Failure, GetOrderDetailsModel>> getOrderDetails(
  //     int orderId) async {
  //   String? sessionId = await Preferences.instance.getSessionId();
  //   try {
  //     final response = await dio.get(
  //       EndPoints.saleOrderLine +
  //           '?query={state,name,product_uom_qty,price_tax,price_total,price_subtotal,display_name,create_date,order_id,order_partner_id}&filter=[["order_id", "=", $orderId]]',
  //       options: Options(
  //         headers: {"Cookie": "session_id=$sessionId"},
  //       ),
  //     );
  //     return Right(GetOrderDetailsModel.fromJson(response));
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }

  // Future<Either<Failure, GetPartnerLatLongModel>> getPartnerLatLong(
  //     int partnerId) async {
  //   String? sessionId = await Preferences.instance.getSessionId();
  //   try {
  //     final response = await dio.get(
  //       EndPoints.addPartner +
  //           '?query={ name,partner_latitude,partner_longitude}&filter=[["id","=","$partnerId"]]',
  //       options: Options(
  //         headers: {"Cookie": "session_id=$sessionId"},
  //       ),
  //     );
  //     return Right(GetPartnerLatLongModel.fromJson(response));
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }

  // Future<Either<Failure, GetPartnerDetailsModel>> getPartnerDetails(
  //     int partnerId) async {
  //   String? sessionId = await Preferences.instance.getSessionId();
  //   try {
  //     final response = await dio.get(
  //       EndPoints.addPartner +
  //           '$partnerId?query={name,user_id,total_overdue,total_due,sale_order_ids}',
  //       options: Options(
  //         headers: {"Cookie": "session_id=$sessionId"},
  //       ),
  //     );
  //     return Right(GetPartnerDetailsModel.fromJson(response));
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }

  // Future<Either<Failure, GetSaleOrderForPartnerModel>> getAllSaleOrderForMan(
  //     int partnerId) async {
  //   String? sessionId = await Preferences.instance.getSessionId();
  //   try {
  //     final response = await dio.get(
  //       EndPoints.saleOrder +
  //           '?filter=[["partner_id", "=",$partnerId]]&query={id,display_name,state,write_date,amount_total}',
  //       options: Options(
  //         headers: {"Cookie": "session_id=$sessionId"},
  //       ),
  //     );
  //     return Right(GetSaleOrderForPartnerModel.fromJson(response));
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }

  // Future<Either<Failure, GetManOrderDetailsModel>> getAllSaleOrderForManDetails(
  //     int orderId) async {
  //   String? sessionId = await Preferences.instance.getSessionId();
  //   try {
  //     final response = await dio.get(
  //       EndPoints.saleOrderLine +
  //           '?filter=[["order_id", "=",$orderId]]&query={id,name,display_name,product_id,product_uom_qty,order_id,price_tax,price_total,price_subtotal,price_unit,tax_id}',
  //       options: Options(
  //         headers: {"Cookie": "session_id=$sessionId"},
  //       ),
  //     );
  //     return Right(GetManOrderDetailsModel.fromJson(response));
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }

  // Future<Either<Failure, GetPaymentWithIdModel>> getPaymentWithId(
  //     int paymentId) async {
  //   String? sessionId = await Preferences.instance.getSessionId();
  //   try {
  //     final response = await dio.get(
  //       EndPoints.createPayment +
  //           '?filter=[["id", "=",$paymentId]]&query={name,journal_id}',
  //       options: Options(
  //         headers: {"Cookie": "session_id=$sessionId"},
  //       ),
  //     );
  //     return Right(GetPaymentWithIdModel.fromJson(response));
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }

  // Future<Either<Failure, GetLocationModel>> getfromLocations() async {
  //   // AuthModel authModel = await Preferences.instance.getUser();
  //   String? sessionId = await Preferences.instance.getSessionId();
  //   try {
  //     final response = await dio.get(
  //       EndPoints.fromLocation,
  //       options: Options(
  //         headers: {"Cookie": "session_id=$sessionId"},
  //       ),
  //     );
  //     return Right(GetLocationModel.fromJson(response));
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }

  // Future<Either<Failure, GetLocationModel>> getToLocations() async {
  //   // AuthModel authModel = await Preferences.instance.getUser();
  //   String? sessionId = await Preferences.instance.getSessionId();
  //   try {
  //     final response = await dio.get(
  //       EndPoints.toLocation,
  //       options: Options(
  //         headers: {"Cookie": "session_id=$sessionId"},
  //       ),
  //     );
  //     return Right(GetLocationModel.fromJson(response));
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }

  // Future<Either<Failure, DefaultModel>> createPicking({
  //   required int fromLocationId,
  //   required int toLocationId,
  // }) async {
  //   //  AuthModel authModel = await Preferences.instance.getUser();
  //   String? sessionId = await Preferences.instance.getSessionId();
  //   try {
  //     final response = await dio.post(EndPoints.createPicking,
  //         options: Options(
  //           headers: {"Cookie": "session_id=$sessionId"},
  //         ),
  //         body: {
  //           "params": {
  //             "data": {
  //               "picking_type_id": 5,
  //               "location_id": fromLocationId,
  //               "location_dest_id": toLocationId
  //             }
  //           }
  //         });
  //     return Right(DefaultModel.fromJson(response));
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }

  // Future<Either<Failure, DefaultModel>> createStockMove({
  //   required int fromLocationId,
  //   required int toLocationId,
  //   required int productId,
  //   required int qty,
  //   required int pickingId,
  //   required String name,
  // }) async {
  //   //  AuthModel authModel = await Preferences.instance.getUser();
  //   String? sessionId = await Preferences.instance.getSessionId();
  //   try {
  //     final response = await dio.post(EndPoints.createStokeMove,
  //         options: Options(
  //           headers: {"Cookie": "session_id=$sessionId"},
  //         ),
  //         body: {
  //           "params": {
  //             "data": {
  //               "name": name,
  //               "location_id": fromLocationId,
  //               "location_dest_id": toLocationId,
  //               "product_id": productId,
  //               "product_uom_qty": qty,
  //               "picking_id": pickingId
  //             }
  //           }
  //         });
  //     return Right(DefaultModel.fromJson(response));
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }

  // Future<Either<Failure, GetAllOrdersModel>> getAllSaleOrderForPartner(
  //     int page, int pageSize) async {
  //   try {
  //     String? sessionId = await Preferences.instance.getSessionId();
  //     AuthModel authModel = await Preferences.instance.getUser();
  //     final userId = authModel.result!.userContext!.uid;
  //     final response = await dio.get(
  //       EndPoints.saleOrder +
  //           '?filter=[["user_id", "=",$userId],["state", "!=","cancel"]]&query={id,partner_id,display_name,state,write_date,amount_total,amount_untaxed}&page_size=$pageSize&page=$page',
  //       options: Options(
  //         headers: {"Cookie": "session_id=$sessionId"},
  //       ),
  //       // queryParameters: {
  //       //   "query":"{id,display_name,state,write_date,amount_total}",
  //       //
  //       // }
  //     );
  //     return Right(GetAllOrdersModel.fromJson(response));
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }

  // Future<Either<Failure, GetAllJournalsModel>> getAllJournals() async {
  //   try {
  //     String? sessionId = await Preferences.instance.getSessionId();
  //     AuthModel authModel = await Preferences.instance.getUser();
  //     final userId = authModel.result!.userContext!.uid;
  //     // final companyId = authModel.result!.userCompanies!.currentCompany;
  //     final response = await dio.get(
  //       EndPoints.getAllJournals +
  //           '&filter=[["payment_sequence", "=","true"],["user_id", "=", [$userId]]]',
  //       options: Options(
  //         headers: {"Cookie": "session_id=$sessionId"},
  //       ),
  //     );
  //     return Right(GetAllJournalsModel.fromJson(response));
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }
  // Future<Either<Failure, GetAllJournalsModel>> getJournalById(int journalId) async {
  //   try {
  //     String? sessionId = await Preferences.instance.getSessionId();

  //     final response = await dio.get(
  //       EndPoints.getAllJournals +
  //           '&filter=[["id", "=", [$journalId]]]',
  //       options: Options(
  //         headers: {"Cookie": "session_id=$sessionId"},
  //       ),
  //     );
  //     return Right(GetAllJournalsModel.fromJson(response));
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }

// //////////////  مدفوعات العملاء

//   Future<Either<Failure, DefaultModel>> createPaymentMethod(
//       {required partnerId,
//       required journalId,
//       required amount,
//       required String ref,
//       required String date}) async {
//     String? sessionId = await Preferences.instance.getSessionId();
//     try {
//       final response = await dio.post(EndPoints.createPayment,
//           options: Options(
//             headers: {"Cookie": "session_id=$sessionId"},
//           ),
//           body: {
//             "params": {
//               "data": {
//                 "partner_id": partnerId,
//                 "payment_type": "inbound",
//                 "partner_type": "customer",
//                 "journal_id": journalId,
//                 "amount": amount,
//                 "ref": ref,
//                 "date": date
//               }
//             }
//           });
//       return Right(DefaultModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   Future<Either<Failure, GetPaymentByIdModel>> getPaymentById(
//       {required int paymentId}) async {
//     try {
//       String? sessionId = await Preferences.instance.getSessionId();

//       final response = await dio.get(
//         EndPoints.createPayment +
//             '?query={move_id,name,display_name,sequence_prefix}&filter=[["id", "=",$paymentId]]',
//         options: Options(
//           headers: {"Cookie": "session_id=$sessionId"},
//         ),
//       );
//       return Right(GetPaymentByIdModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   Future<Either<Failure, UpdatePaymentStateModel>> updatePaymentState(
//       {required int moveId}) async {
//     String? sessionId = await Preferences.instance.getSessionId();
//     try {
//       final response = await dio.put(EndPoints.createInvoice,
//           options: Options(
//             headers: {"Cookie": "session_id=$sessionId"},
//           ),
//           body: {
//             "params": {
//               "filter": [
//                 ["id", "=", moveId]
//               ],
//               "data": {"payment_state": "paid"}
//             }
//           });
//       return Right(UpdatePaymentStateModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   Future<Either<Failure, UpdatePaymentStateModel>> updatePaymentOrderState(
//       {required int moveId,
//       required int paymentId,
//       required String paymentReference}) async {
//     String? sessionId = await Preferences.instance.getSessionId();
//     try {
//       final response = await dio.put(EndPoints.createInvoice,
//           options: Options(
//             headers: {"Cookie": "session_id=$sessionId"},
//           ),
//           body: {
//             "params": {
//               "filter": [
//                 ["id", "=", moveId]
//               ],
//               "data": {
//                 "payment_state": "paid",
//                 "payment_id": paymentId,
//                 "payment_reference": paymentReference
//               },
//             }
//           });
//       return Right(UpdatePaymentStateModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   Future<Either<Failure, DefaultModel>> orderRelation({
//     required int orderId,
//   }) async {
//     String? sessionId = await Preferences.instance.getSessionId();
//     try {
//       final response = await dio
//           .post(EndPoints.objectSaleOrder + '$orderId/_create_invoices/',
//               options: Options(
//                 headers: {"Cookie": "session_id=$sessionId"},
//               ),
//               body: {});
//       return Right(DefaultModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   Future<Either<Failure, DefaultModel>> confirmInvoice({
//     required String accountMoveNumber,
//     required partnerId,
//   }) async {
//     String? sessionId = await Preferences.instance.getSessionId();
//     AuthModel authModel = await Preferences.instance.getUser();
//     try {
//       final response = await dio
//           .post(EndPoints.objectAccountMove + '$accountMoveNumber/action_post/',
//               options: Options(
//                 headers: {"Cookie": "session_id=$sessionId"},
//               ),
//               body: {
//             "params": {
//               "data": {
//                 "partner_id": partnerId,
//                 "invoice_user_id": authModel.result!.userContext!.uid,
//                 "move_type": "out_invoice"
//               }
//             }
//           });
//       return Right(DefaultModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   Future<Either<Failure, InvoiceDetailsModel>> getInvoiceDetails({
//     required String accountMoveNumber,
//   }) async {
//     String? sessionId = await Preferences.instance.getSessionId();
//     try {
//       final response = await dio.get(
//         EndPoints.createInvoice +
//             '$accountMoveNumber/?query={id, name, partner_id,invoice_partner_display_name, invoice_date, state, amount_untaxed,amount_tax,amount_total,amount_residual, invoice_line_ids,payment_reference,payment_id}',
//         options: Options(
//           headers: {"Cookie": "session_id=$sessionId"},
//         ),
//       );
//       return Right(InvoiceDetailsModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

//   Future<Either<Failure, OrderInvoiceDetailsModel>> getOrderInvoiceDetails({
//     required String orderName,
//   }) async {
//     String? sessionId = await Preferences.instance.getSessionId();
//     try {
//       final response = await dio.get(
//         EndPoints.createInvoice +
//             '?filter=[["invoice_origin", "=", "$orderName"]]&query={id, name,invoice_date, payment_state,payment_id,payment_reference}',
//         options: Options(
//           headers: {"Cookie": "session_id=$sessionId"},
//         ),
//       );
//       return Right(OrderInvoiceDetailsModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
}
