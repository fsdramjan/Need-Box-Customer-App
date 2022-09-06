// // ignore_for_file: unused_local_variable

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'package:needbox_customer/src/components/category/categoryComponent.dart';
// import 'package:needbox_customer/src/components/category/serviceCategoryComponent.dart';
// import 'package:needbox_customer/src/components/product/homeProductComponent.dart';
// import 'package:needbox_customer/src/pages/category/allCategoryPage.dart';

// class ProductAndCategorySlideComponent extends StatefulWidget {
//   @override
//   _ProductAndCategorySlideComponentState createState() =>
//       _ProductAndCategorySlideComponentState();
// }

// class _ProductAndCategorySlideComponentState
//     extends State<ProductAndCategorySlideComponent> {
// //   ScrollController _scrollController1 = ScrollController();
// //   ScrollController _scrollController2 = ScrollController();
// //   ScrollController _scrollController3 = ScrollController();

// //   @override
// //   void initState() {
// //     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
// // if(_scrollController1.positions.isNotEmpty){
// //         if (_scrollController1.hasClients) {
// //           double minScrollExtent1 = _scrollController1.position.minScrollExtent;
// //           double maxScrollExtent1 = _scrollController1.position.maxScrollExtent;
// //           double minScrollExtent2 = _scrollController2.position.minScrollExtent;
// //           double maxScrollExtent2 = _scrollController2.position.maxScrollExtent;
// //           double minScrollExtent3 = _scrollController3.position.minScrollExtent;
// //           double maxScrollExtent3 = _scrollController3.position.maxScrollExtent;

// //           //
// //           animateToMaxMin(maxScrollExtent1, minScrollExtent1, maxScrollExtent1,
// //               50, _scrollController1);
// //         }
// // }
// //     });
// //     super.initState();
// //   }

// //   animateToMaxMin(double max, double min, double direction, int seconds,
// //       ScrollController scrollController) {
// //     scrollController
// //         .animateTo(direction,
// //             duration: Duration(seconds: seconds), curve: Curves.linear)
// //         .then((value) {
// //       direction = direction == max ? min : max;
// //       animateToMaxMin(max, min, direction, seconds, scrollController);
// //     });
// //   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Column(
//         children: [
//           ServiceComponent(scrollController: _scrollController2),
//           GestureDetector(
//               onTap: () => Get.to(AllCategoryPage()),
//               child: CategoryComponent(scrollController: _scrollController1)),
//           HomeProductComponent(scrollController: _scrollController3),
//         ],
//       ),
//     );
//   }
// }
