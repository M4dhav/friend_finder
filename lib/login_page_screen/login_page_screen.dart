import 'package:abhishek_s_application1/core/app_export.dart';
import 'package:abhishek_s_application1/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class LoginPageScreen extends StatelessWidget {
  const LoginPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 27.v),
                child: Column(children: [
                  SizedBox(
                      height: 423.v,
                      width: 336.h,
                      child: Stack(alignment: Alignment.topRight, children: [
                        Align(
                            alignment: Alignment.center,
                            child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 86.h),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      _buildEight(context),
                                      SizedBox(height: 9.v),
                                      _buildEight(context),
                                      SizedBox(height: 9.v),
                                      _buildEight(context)
                                    ]))),
                        CustomImageView(
                            imagePath: ImageConstant.imgRectangle5,
                            height: 76.adaptSize,
                            width: 76.adaptSize,
                            radius: BorderRadius.circular(38.h),
                            alignment: Alignment.topRight,
                            margin: EdgeInsets.only(right: 86.h)),
                        CustomImageView(
                            imagePath: ImageConstant.imgRectangle6,
                            height: 76.adaptSize,
                            width: 76.adaptSize,
                            radius: BorderRadius.circular(38.h),
                            alignment: Alignment.topRight),
                        CustomImageView(
                            imagePath: ImageConstant.imgRectangle7,
                            height: 76.adaptSize,
                            width: 76.adaptSize,
                            radius: BorderRadius.circular(38.h),
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 86.h)),
                        CustomImageView(
                            imagePath: ImageConstant.imgRectangle8,
                            height: 76.adaptSize,
                            width: 76.adaptSize,
                            radius: BorderRadius.circular(38.h),
                            alignment: Alignment.topLeft),
                        CustomImageView(
                            imagePath: ImageConstant.imgRectangle9,
                            height: 76.adaptSize,
                            width: 76.adaptSize,
                            radius: BorderRadius.circular(38.h),
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(top: 86.v)),
                        CustomImageView(
                            imagePath: ImageConstant.imgRectangle10,
                            height: 76.adaptSize,
                            width: 76.adaptSize,
                            radius: BorderRadius.circular(38.h),
                            alignment: Alignment.topRight,
                            margin: EdgeInsets.only(top: 86.v)),
                        CustomImageView(
                            imagePath: ImageConstant.imgRectangle11,
                            height: 76.adaptSize,
                            width: 76.adaptSize,
                            radius: BorderRadius.circular(38.h),
                            alignment: Alignment.bottomRight),
                        CustomImageView(
                            imagePath: ImageConstant.imgRectangle12,
                            height: 76.adaptSize,
                            width: 76.adaptSize,
                            radius: BorderRadius.circular(38.h),
                            alignment: Alignment.bottomLeft),
                        CustomImageView(
                            imagePath: ImageConstant.imgRectangle13,
                            height: 76.adaptSize,
                            width: 76.adaptSize,
                            radius: BorderRadius.circular(38.h),
                            alignment: Alignment.centerLeft),
                        CustomImageView(
                            imagePath: ImageConstant.imgRectangle14,
                            height: 76.adaptSize,
                            width: 76.adaptSize,
                            radius: BorderRadius.circular(38.h),
                            alignment: Alignment.centerRight),
                        CustomImageView(
                            imagePath: ImageConstant.imgRectangle15,
                            height: 76.adaptSize,
                            width: 76.adaptSize,
                            radius: BorderRadius.circular(38.h),
                            alignment: Alignment.bottomLeft,
                            margin: EdgeInsets.only(left: 86.h)),
                        CustomImageView(
                            imagePath: ImageConstant.imgRectangle16,
                            height: 76.adaptSize,
                            width: 76.adaptSize,
                            radius: BorderRadius.circular(38.h),
                            alignment: Alignment.bottomLeft,
                            margin: EdgeInsets.only(bottom: 86.v)),
                        CustomImageView(
                            imagePath: ImageConstant.imgRectangle17,
                            height: 76.adaptSize,
                            width: 76.adaptSize,
                            radius: BorderRadius.circular(38.h),
                            alignment: Alignment.bottomRight,
                            margin: EdgeInsets.only(bottom: 86.v)),
                        CustomImageView(
                            imagePath: ImageConstant.imgRectangle18,
                            height: 76.adaptSize,
                            width: 76.adaptSize,
                            radius: BorderRadius.circular(38.h),
                            alignment: Alignment.bottomRight,
                            margin: EdgeInsets.only(right: 86.h)),
                        Align(
                            alignment: Alignment.center,
                            child: Container(
                                height: 423.v,
                                width: 336.h,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment(0.5, 0),
                                        end: Alignment(0.5, 1),
                                        colors: [
                                      theme.colorScheme.primary.withOpacity(0),
                                      theme.colorScheme.primary.withOpacity(1)
                                    ]))))
                      ])),
                  SizedBox(height: 72.v),
                  CustomImageView(
                      imagePath: ImageConstant.imgUntitledDesign,
                      height: 100.adaptSize,
                      width: 100.adaptSize),
                  SizedBox(height: 7.v),
                  SizedBox(
                      width: 337.h,
                      child: Text("Find your friends.\nAnytime. Anywhere.",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.displaySmall))
                ])),
            bottomNavigationBar: _buildLoginWithOutlook(context)));
  }

  /// Section Widget
  Widget _buildLoginWithOutlook(BuildContext context) {
    return CustomOutlinedButton(
        text: "Login with Outlook",
        margin: EdgeInsets.only(left: 26.h, right: 28.h, bottom: 30.v),
        leftIcon: Container(
            margin: EdgeInsets.only(right: 20.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgMicrosoftOutlook,
                height: 30.adaptSize,
                width: 30.adaptSize)),
        onPressed: () {
          onTapLoginWithOutlook(context);
        });
  }

  /// Common widget
  Widget _buildEight(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      CustomImageView(
          imagePath: ImageConstant.imgRectangle1,
          height: 76.adaptSize,
          width: 76.adaptSize,
          radius: BorderRadius.circular(38.h)),
      CustomImageView(
          imagePath: ImageConstant.imgRectangle2,
          height: 76.adaptSize,
          width: 76.adaptSize,
          radius: BorderRadius.circular(38.h))
    ]);
  }

  /// Navigates to the homePageContainerScreen when the action is triggered.
  onTapLoginWithOutlook(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homePageContainerScreen);
  }
}
