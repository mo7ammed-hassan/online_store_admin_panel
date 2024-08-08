import 'package:ecommerce_app_admin_panel/core/utils/constants/views.dart';
import 'package:ecommerce_app_admin_panel/features/main/presentation/views/manager/cubits/main_view_cubit/main_view_cubit.dart';
import 'package:ecommerce_app_admin_panel/features/main/presentation/views/widgets/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo.png"),
          ),
          DrawerItem(
            title: "Dashboard",
            svgSrc: "assets/icons/menu_dashboard.svg",
            press: () {
              BlocProvider.of<MainViewCubit>(context)
                  .navigateToView(dashboardView);
            },
          ),
          DrawerItem(
            title: "Category",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () {
              BlocProvider.of<MainViewCubit>(context)
                  .navigateToView(categoryView);
            },
          ),
          DrawerItem(
            title: "Sub Category",
            svgSrc: "assets/icons/menu_task.svg",
            press: () {
              BlocProvider.of<MainViewCubit>(context)
                  .navigateToView(subCategoryView);
            },
          ),
          DrawerItem(
            title: "Brands",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {
              BlocProvider.of<MainViewCubit>(context).navigateToView(brandView);
            },
          ),
          DrawerItem(
            title: "Variant Type",
            svgSrc: "assets/icons/menu_store.svg",
            press: () {
              BlocProvider.of<MainViewCubit>(context)
                  .navigateToView(variantTypeView);
            },
          ),
          DrawerItem(
            title: "Variants",
            svgSrc: "assets/icons/menu_notification.svg",
            press: () {
              BlocProvider.of<MainViewCubit>(context)
                  .navigateToView(variantView);
            },
          ),
          DrawerItem(
            title: "Orders",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () {
              BlocProvider.of<MainViewCubit>(context).navigateToView(orderView);
            },
          ),
          DrawerItem(
            title: "Coupons",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {
              BlocProvider.of<MainViewCubit>(context)
                  .navigateToView(couponView);
            },
          ),
          DrawerItem(
            title: "Posters",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {
              BlocProvider.of<MainViewCubit>(context)
                  .navigateToView(posterView);
            },
          ),
          DrawerItem(
            title: "Notifications",
            svgSrc: "assets/icons/menu_notification.svg",
            press: () {
              BlocProvider.of<MainViewCubit>(context)
                  .navigateToView(notificationView);
            },
          ),
        ],
      ),
    );
  }
}
