import 'package:ecommerce_app_admin_panel/core/utils/constants/views.dart';
import 'package:ecommerce_app_admin_panel/features/brands/presentation/views/brands_view.dart';
import 'package:ecommerce_app_admin_panel/features/category/presentatation/views/category_view.dart';
import 'package:ecommerce_app_admin_panel/features/coupons/presentation/views/coupon_view.dart';
import 'package:ecommerce_app_admin_panel/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:ecommerce_app_admin_panel/features/orders/presentation/views/order_view.dart';
import 'package:ecommerce_app_admin_panel/features/posters/presentation/views/poster_view.dart';
import 'package:ecommerce_app_admin_panel/features/sub_category/presentation/views/sub_category_view.dart';
import 'package:ecommerce_app_admin_panel/features/variant_type/presentation/views/variant_type_view.dart';
import 'package:ecommerce_app_admin_panel/features/variants/presentation/views/variant_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_view_state.dart';

class MainViewCubit extends Cubit<MainViewState> {
  MainViewCubit()
      : super(
          const MainViewState(
            Dashboardview(),
          ),
        );

  void navigateToView(String viewName) {
    switch (viewName) {
      case dashboardView:
        emit(const MainViewState(Dashboardview()));
        break;
      case categoryView:
        emit(const MainViewState(CategoryView()));
        break;
      case brandView:
        emit(const MainViewState(BrandsView()));
        break;
      case couponView:
        emit(const MainViewState(CouponView()));
        break;
      case orderView:
        emit(const MainViewState(OrderView()));
        break;
      case subCategoryView:
        emit(const MainViewState(SubCategoryView()));
        break;
      case posterView:
        emit(const MainViewState(PosterView()));
        break;
      case variantView:
        emit(const MainViewState(VariantView()));
        break;
        case variantTypeView:
        emit(const MainViewState(VariantTypeView()));
        break;
      default:
        emit(const MainViewState(Dashboardview()));
        break;
    }
  }
}
