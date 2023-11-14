import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/data_models/pay_product_model.dart';
import '../../../../models/navigate_models/product_nav_model.dart';
import '../../../../routes/app_route.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/widgets/app_button.dart';
import '../../../../utils/widgets/app_text.dart';
import '../controller/product_details_controller.dart';

class ProductDetails extends StatefulWidget {
  final ProductNavModel product;

  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final controller = Get.put(ProductDetailsController());

  @override
  void initState() {
    super.initState();
    controller.initialize(widget.product);
  }

  @override
  void dispose() {
    Get.delete<ProductDetailsController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text("Product Details"),
        ),
        body: Obx(
          () => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
            child: Stack(
              children: [
                controller.loading.value
                    ? const Positioned(
                        left: 0,
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: CupertinoActivityIndicator(
                          radius: 15,
                        ))
                    : const SizedBox(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: AppColors.deepBlue, width: 2)),
                                child: Hero(
                                  tag: widget.product.image,
                                  child: CachedNetworkImage(
                                    imageUrl: widget.product.image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  AppText(
                                    text: controller.product.value.pname,
                                    fontColor: Colors.black,
                                    weight: FontWeight.bold,
                                    size: 16,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  AppText(
                                    text:
                                        "Rs. ${controller.product.value.price}.00",
                                    fontColor: AppColors.deepBlue,
                                    weight: FontWeight.bold,
                                    size: 18,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  AppText(
                                    text: controller.product.value.quantity > 0
                                        ? "In Stock"
                                        : "Out of Stock",
                                    fontColor:
                                        controller.product.value.quantity > 0
                                            ? Colors.teal
                                            : Colors.red,
                                    weight: FontWeight.bold,
                                    size: 14,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const AppText(
                                    text: "Delivery Available",
                                    fontColor: Colors.black,
                                    weight: FontWeight.bold,
                                    size: 13,
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: AppColors.mainBlue)),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  foregroundColor: controller.isCart.value
                                      ? AppColors.white
                                      : null,
                                  backgroundColor: controller.isCart.value
                                      ? AppColors.mainBlue
                                      : null,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap),
                              onPressed: () {
                                controller.addCart(context);
                              },
                              child: const Text("Add to Cart"),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 1,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: AppColors.mainBlue)),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  foregroundColor: controller.isWatch.value
                                      ? AppColors.white
                                      : null,
                                  backgroundColor: controller.isWatch.value
                                      ? AppColors.mainBlue
                                      : null,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap),
                              onPressed: () {
                                controller.addWatchlist(context);
                              },
                              child: const Text("Add to Watchlist"),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 1,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: AppColors.mainBlue)),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap),
                              onPressed: () {
                                controller.report(context);
                              },
                              child: const Text("Report"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const AppText(
                      text: "Product Description",
                      fontColor: Colors.black,
                      align: TextAlign.center,
                      weight: FontWeight.bold,
                      size: 16,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    AppText(
                      text: controller.product.value.description,
                      fontColor: Colors.black,
                      size: 13,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Spacer(),
                    AppButton(
                        bgColor: controller.product.value.quantity > 0
                            ? AppColors.mainBlue
                            : Colors.grey,
                        title: "Buy Now",
                        onTapped: () {
                          if (controller.product.value.quantity > 0) {
                            final model = PayProductModel(
                                productId: widget.product.productId,
                                pname: controller.product.value.pname,
                                qty: 1,
                                price: controller.product.value.price,
                                image: controller.product.value.image);
                            Navigator.pushNamed(
                                context, AppRoute.paymentDetails,
                                arguments: [model]);
                          }
                        })
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
