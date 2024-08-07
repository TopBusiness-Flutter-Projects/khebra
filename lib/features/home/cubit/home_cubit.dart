// ignore_for_file: use_build_context_synchronously

import 'package:khebra/core/models/all_products_model.dart';
import 'package:khebra/core/models/all_provider_model.dart';
import 'package:khebra/core/models/category_model.dart';
import 'package:khebra/core/remote/service.dart';
import 'package:khebra/core/utils/app_export.dart';

import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(this.api) : super(HomeInitialState());
  ServiceApi api;

  bool withPriceType = true;
  void changeServicesType(bool priceType) {
    withPriceType = priceType;
    emit(ChangeServicesTypeStates());
  }

  List<ProductModelData> selectedProducts = [];

  addProduct({required ProductModelData product}) {
    print(
        "____________________selectedProducts.isEmpty __________________________");
    // product.userOrderedQuantity++;
    product.userOrderedQuantity++;
    if (selectedProducts.isEmpty) {
      selectedProducts.add(product);
    } else {
      bool isExist = false;

      for (int i = 0; i < selectedProducts.length; i++) {
        if (selectedProducts[i].id == product.id) {
          isExist = true;
          emit(AddProductsState());
        } else {
          // isExist = false;
        }
      }
      if (!isExist) {
        selectedProducts.add(product);
      }
    }

    emit(AddProductsState());
    return;
    // } else {
  }

  removeProduct({required ProductModelData product}) {
    if (product.userOrderedQuantity >= 1) {
      product.userOrderedQuantity = product.userOrderedQuantity - 1;
      emit(RemoveProductsState());
    }
    if (product.userOrderedQuantity == 0) {
      selectedProducts.remove(product);
      emit(DeletProductsState());
    }
  }

  AllProductsModel productsOfCategoryModel = AllProductsModel();
  getAllProductsByCategory(int categoryId) async {
    emit(LoadingProductsOfCategoryInitial());
    final response = await api.getAllProductsByCategory(categoryId: categoryId);
    response.fold((l) {
      emit(ErrorProductsOfCategoryInitial());
    }, (r) {
      productsOfCategoryModel = r;
      emit(LoadedProductsOfCategoryInitial());
    });
  }

  AllCategoriesModel? categoriesModel;
  getAllCategories() async {
    emit(LoadingGetAllCategoriesState());
    // authModel = await Preferences.instance.getUserModel2();
    final response = await api.getAllCategories();
    response.fold((l) => emit(FailureGetAllCategoriesState()), (r) {
      emit(SuccessGetAllCategoriesState());
      categoriesModel = r;
    });
  }

  AllProductsModel productsModel = AllProductsModel();
  getAllProducts({
    int pageId = 1,
    bool isGetMore = false,
  }) async {
    isGetMore
        ? emit(Loading2AllProductsState())
        : emit(LoadingAllProductsState());
    // emit(LoadingAllProductsState());
    // authModel = await Preferences.instance.getUserModel2();
    final response = await api.getAllProducts(pageId);
    response.fold((l) => emit(AllProductsFailureState()), (r) {
      if (isGetMore) {
        productsModel = AllProductsModel(
          count: r.count,
          next: r.next,
          prev: r.prev,
          result: [...productsModel!.result!, ...r.result!],
        );
      } else {
        productsModel = r;
      }

      emit(AllProductsSuccessState());
    });
  }

  AllProductsModel? productsWithPriceModel;
  AllProductsModel? productsWithoutPriceModel;
  getAllProductsPrices({
    int pageId = 1,
    bool isGetMore = false,
    required bool isWithPrice,
  }) async {
    isGetMore
        ? emit(Loading2AllProductsState())
        : emit(LoadingAllProductsState());
    // emit(LoadingAllProductsState());
    // authModel = await Preferences.instance.getUserModel2();
    final response = await api.getAllProductsPrices(pageId, withPriceType);
    response.fold((l) => emit(AllProductsFailureState()), (r) {
      // if (isGetMore) {
      //   productsModel = AllProductsModel(
      //     count: r.count,
      //     next: r.next,
      //     prev: r.prev,
      //     result: [...productsModel!.result!, ...r.result!],
      //   );
      // } else {

      isWithPrice == true
          ? productsWithPriceModel = r
          : productsWithoutPriceModel = r;
      // }

      emit(AllProductsSuccessState());
    });
  }

  TextEditingController searchController = TextEditingController();
  AllProductsModel? searchedproductsModel;
  searchProducts({
    int pageId = 1,
    bool isGetMore = false,
    required String productName,
  }) async {
    isGetMore
        ? emit(Loading2AllProductsState())
        : emit(LoadingAllProductsState());

    final response = await api.searchProducts(pageId, productName);
    response.fold((l) => emit(AllProductsFailureState()), (r) {
      if (isGetMore) {
        productsModel = AllProductsModel(
          count: r.count,
          next: r.next,
          prev: r.prev,
          result: [...productsModel!.result!, ...r.result!],
        );
      } else {
        searchedproductsModel = r;
      }

      emit(AllProductsSuccessState());
    });
  }

  /// get technicians ///
  GetAllProviderModel getAllProviderModel = GetAllProviderModel();
  getProviders() async {
    emit(LoadingGetAllProvidersState());

    final response = await api.getProviders();
    response.fold((l) => emit(FailureGetAllProvidersState()), (r) {
     
      getAllProviderModel = r;
       emit(SuccessGetAllProvidersState());
    });
  }
}
