// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:khebra/core/widgets/custom_appbar.dart';
import 'package:khebra/features/home/cubit/home_cubit.dart';
import 'package:khebra/features/home/cubit/home_states.dart';
import 'package:khebra/features/home/screens/widgets/custom_rate_widget.dart';

import '../../../../core/utils/app_export.dart';

class AllRatesScreen extends StatefulWidget {
  const AllRatesScreen({Key? key}) : super(key: key);

  @override
  State<AllRatesScreen> createState() =>
      _AllRatesScreenState();
}

class _AllRatesScreenState extends State<AllRatesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocBuilder<HomeCubit, HomeStates>(builder: (context, state) {
      HomeCubit cubit = context.read<HomeCubit>();
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(title: "rates"),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, Routes.offerDetailsRoute);
                    },
                    child: CustomRateWidget(),
                  ),
                ),
              ),
              // Image.asset(
              //   width: double.infinity,
              //   AppImages.login,
              // )
            ],
          ),
        ),
      );
    }));
  }
}
