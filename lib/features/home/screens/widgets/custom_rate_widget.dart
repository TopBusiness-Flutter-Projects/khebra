
import '../../../../core/utils/app_export.dart';

class CustomRateWidget extends StatelessWidget {
  const CustomRateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(1000),
                  child: CustomNetworkImage(
                    imageUrl: AppStrings.testNetworkImage,
                    height: 60.w,
                    width: 60.w,
                  ),
                ),
                SizedBox(width: 16.0.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              'محمد محمود',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: AppColors.secondPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            'منذ أسبوع',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                              color: AppColors.pink,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 16.0,
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'خدمة متميزة وجودة عالية وراحة في التعامل',
                style: TextStyle(
                  fontSize: 14.0,
                  color: AppColors.secondPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
