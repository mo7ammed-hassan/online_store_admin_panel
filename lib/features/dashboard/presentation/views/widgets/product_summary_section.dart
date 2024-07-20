import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/core/utils/models/product_summary_info.dart';
import 'package:ecommerce_app_admin_panel/features/dashboard/presentation/views/widgets/product_summary_card.dart';
import 'package:flutter/material.dart';

class ProductSummarySection extends StatelessWidget {
  const ProductSummarySection({super.key});

  static List<ProductSummeryInfo> productSummeryItems = [
    ProductSummeryInfo(
      title: "All Product",
      svgSrc: "assets/icons/Product.svg",
      color: primaryColor,
    ),
    ProductSummeryInfo(
      title: "Out of Stock",
      svgSrc: "assets/icons/Product2.svg",
      color: const Color(0xFFEA3829),
    ),
    ProductSummeryInfo(
      title: "Limited Stock",
      svgSrc: "assets/icons/Product3.svg",
      color: const Color(0xFFECBE23),
    ),
    ProductSummeryInfo(
      title: "Other Stock",
      svgSrc: "assets/icons/Product4.svg",
      color: const Color(0xFF47e228),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: productSummeryItems.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: defaultPadding,
            mainAxisSpacing: defaultPadding,
            childAspectRatio: size.width < 1400 ? 1.1 : 1.4,
          ),
          itemBuilder: (context, index) => ProductSummeryCard(
            info: productSummeryItems[index],
            onTap: (productType) {
              // handle product type click here
            },
          ),
        ),
      ],
    );
  }
}
