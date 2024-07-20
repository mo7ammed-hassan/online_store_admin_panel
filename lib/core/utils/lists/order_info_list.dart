import 'package:ecommerce_app_admin_panel/core/utils/models/order_info_model.dart';

const List<OrderInfoModel> orderList = [
  OrderInfoModel(
    svgSrc: "assets/icons/delivery1.svg",
    title: "All Orders",
    totalOrder: 2,
  ),
  OrderInfoModel(
    svgSrc: "assets/icons/delivery5.svg",
    title: "Pending Orders",
    totalOrder: 1,
  ),
  OrderInfoModel(
    svgSrc: "assets/icons/delivery6.svg",
    title: "Processed Orders",
    totalOrder: 5,
  ),
  OrderInfoModel(
    svgSrc: "assets/icons/delivery2.svg",
    title: "Cancelled Orders",
    totalOrder: 2,
  ),
  OrderInfoModel(
    svgSrc: "assets/icons/delivery4.svg",
    title: "Shipped Orders",
    totalOrder: 0,
  ),
  OrderInfoModel(
    svgSrc: "assets/icons/delivery3.svg",
    title: "Delivered Orders",
    totalOrder: 3,
  ),
];
