import '../../../../core/utils/app_export.dart';

class CustomProviderWidget extends StatelessWidget {
  const CustomProviderWidget({
    super.key,
    this.onTap,
    required this.name,
    this.image,
  });

  final void Function()? onTap;
  final String name;

  final dynamic image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
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
                  borderRadius: BorderRadius.circular(12),
                  child: DecodedImage(
                    context: context,
                    base64String: image,
                    width: 100.w,
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
                              name,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: AppColors.secondPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              'منذ أسبوع',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0,
                                color: AppColors.pink,
                              ),
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
            // Padding(
            //   padding: const EdgeInsets.all(5.0),
            //   child: Text(
            //     'خدمة متميزة وجودة عالية وراحة في التعامل',
            //     style: TextStyle(
            //       fontSize: 14.0,
            //       color: AppColors.secondPrimary,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
