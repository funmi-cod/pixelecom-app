import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixelecomapp/src/core/common/components/custom_image_view.dart';
import 'package:pixelecomapp/src/core/utils/constant/app_colors.dart';
import 'package:pixelecomapp/src/core/utils/constant/image_constant.dart';
import 'package:pixelecomapp/src/core/utils/helpers/styles.dart';
import 'package:pixelecomapp/src/features/home/bloc/home_bloc/home_cubit.dart';
import 'package:pixelecomapp/src/features/home/data/model/product_model.dart';

class MyCollectionScreen extends StatefulWidget {
  const MyCollectionScreen({super.key});

  @override
  State<MyCollectionScreen> createState() => _MyCollectionScreenState();
}

class _MyCollectionScreenState extends State<MyCollectionScreen> {
  var selectedIndex = 1;

  List<Product>? _products;

  late HomeCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<HomeCubit>(context).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black200,
      appBar: AppBar(
        toolbarHeight: 50,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,

        title: Styles.semiBold("My Collection", fontSize: 32.sp),
        actions: [
          GestureDetector(
            onTap: () {},
            child: CustomImageView(
              imagePath: ImageConstant.notification,
              height: 34.h,
              width: 34.w,
            ),
          ),
          SizedBox(width: 10.w),
        ],
      ),
      body: buildBodyContent(),
      bottomNavigationBar: SizedBox(
        height: 80.h,
        child: BottomNavigationBar(
          selectedItemColor: AppColors.white,
          showUnselectedLabels: true,
          unselectedLabelStyle: TextStyle(color: AppColors.grey300),
          currentIndex: selectedIndex,
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: AppColors.black300,
              icon: CustomImageView(
                imagePath: ImageConstant.scanIcon,
                height: 24.h,
                width: 24.w,
              ),

              label: "Scan",
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.black300,
              icon: CustomImageView(
                imagePath: ImageConstant.squareFourIcon,
                height: 24.h,
                width: 24.w,
              ),
              label: "Collection",
            ),
            BottomNavigationBarItem(
              icon: CustomImageView(
                imagePath: ImageConstant.bottleIcon,
                height: 24.h,
                width: 24.w,
              ),
              label: "Shop",
            ),
            BottomNavigationBarItem(
              icon: CustomImageView(
                imagePath: ImageConstant.gearSix,
                height: 24.h,
                width: 24.w,
              ),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }

  dynamic buildMyCollection(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeSuccess) _products = _cubit.productsList;
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: double.infinity,
                  child: GridView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.6,
                    ),
                    itemCount: _products?.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.all(0),
                    itemBuilder: (context, index) {
                      var product = _products?[index];
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          color: AppColors.black100,
                          padding: EdgeInsets.all(10.r),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20.h),
                              Center(
                                child: CustomImageView(
                                  imagePath: "assets/images/wine-cask.png",
                                  height: 130.h,
                                  width: 35.w,
                                ),
                              ),
                              SizedBox(height: 25.h),
                              Styles.semiBold(
                                product?.name ?? '',
                                fontSize: 22.sp,
                              ),
                              Styles.semiBold(
                                product?.caskNumber ?? '',
                                fontSize: 22.sp,
                              ),
                              Styles.regular(
                                "(${product?.productSold ?? ''}/${product?.totalProduct ?? ''})",
                                fontSize: 12.sp,
                                color: AppColors.grey,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        );
      },
    );
  }

  Widget buildScanScreen(context) {
    return SizedBox();
  }

  Widget buildShopScreen(context) {
    return SizedBox();
  }

  Widget buildSettings(context) {
    return SizedBox();
  }

  Widget buildBodyContent() {
    switch (selectedIndex) {
      case 0:
        return buildScanScreen(context);
      case 1:
        return buildMyCollection(context);
      case 2:
        return buildShopScreen(context);
      case 3:
        return buildSettings(context);
      default:
        return buildMyCollection(context);
    }
  }
}
