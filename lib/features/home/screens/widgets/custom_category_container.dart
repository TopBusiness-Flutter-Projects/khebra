import 'package:khebra/core/models/all_products_model.dart';
import 'package:khebra/core/utils/app_export.dart';
import 'package:khebra/features/home/cubit/home_cubit.dart';

import '../servicies_of_category_screen.dart';

class CustomCategoriesContainer extends StatelessWidget {
  const CustomCategoriesContainer({
    super.key,
    required this.mainText,
    this.containerOnTap,
    this.image,
    required this.categoryId,
  });

  final void Function()? containerOnTap;

  final String mainText;
  final dynamic image;
  final int categoryId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<HomeCubit>().productsOfCategoryModel = AllProductsModel();
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ServicesOfCategoryScreen(
                categoryId: categoryId,
                categoryName: mainText,
              ),
            ));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 5,
              offset: Offset(0, 2), // Shadow position
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DecodedImage(
                context: context,
                base64String: image,
                height: 50.h,
                width: 50.h,
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                mainText,
                textAlign: TextAlign.center,
                style: getRegularStyle(
                    fontHeight: 1,
                    color: AppColors.secondPrimary,
                    fontSize: 16.sp),
              )
            ],
          ),
        ),
      ),
    );
  }
}
