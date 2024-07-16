import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/src/routes/circular_reveal_clipper.dart';
import 'package:khebra/core/utils/app_export.dart';
import 'package:khebra/features/order_service/cubit/order_service_cubit.dart';
import 'package:khebra/features/order_service/screens/widgets/custom_uploaded_image.dart';
import 'package:khebra/features/register/cubit/register_cubit.dart';

import 'custom_upload_decument.dart';

class DocumentsContainer extends StatelessWidget {
  const DocumentsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    OrderServiceCubit cubit = context.read<OrderServiceCubit>();

    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.borderColor)),
      child: Column(children: [
        Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            color: AppColors.addServiceContainer,
          ),
          child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width / 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "serviceImages".tr(),
                  style: getBoldStyle(color: AppColors.greyText, fontSize: 15),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width / 50),
          child: Wrap(
            direction: Axis.horizontal,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
                child: SizedBox(
                  width: 70.w,
                  height: 70.w,
                  child: DottedBorder(
                    dashPattern: [6, 4, 6, 4],
                    borderType: BorderType.RRect,
                    color: AppColors.borderColor,
                    radius: const Radius.circular(12),
                    padding: const EdgeInsets.all(6),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: GestureDetector(
                        onTap: () {
                          if (cubit.uploadedImage.length < 7) {
                            cubit.showImageSourceDialog(
                              context,
                            );
                          } else {
                            errorGetBar("لقد تعديت الحل د الأمسح");
                          }
                        },
                        child: CustomDocumentWidget(),
                      ),
                    ),
                  ),
                ),
              ),
              ...cubit.uploadedImage.map(
                (e) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
                  child: Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        // alignment: Alignment.topLeft,
                        children: [
                          SizedBox(
                            width: 70.w,
                            height: 70.w,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                border:
                                    Border.all(color: AppColors.borderColor),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              // padding: const EdgeInsets.all(6),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                                child: CustomUploadedImageWidget(img: e),
                              ),
                            ),
                          ),
                          PositionedDirectional(
                            top: -8,
                            end: -8,
                            child: GestureDetector(
                              onTap: () {
                                cubit.removeImage(e);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: AppColors.addServiceContainer,
                                    borderRadius: BorderRadius.circular(100)),
                                child: Icon(
                                  Icons.close,
                                  color: AppColors.red,
                                  size: 20.sp,
                                ),
                              ),
                            ),
                          ),
                          // IconButton(
                          //   onPressed: () {
                          //     //  cubit.removeImage(e);
                          //   },
                          //   icon:
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
