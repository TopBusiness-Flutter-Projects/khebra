// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khebra/config/routes/app_routes.dart';
import 'package:khebra/core/utils/app_strings.dart';
import 'package:khebra/core/widgets/custom_appbar.dart';
import 'package:khebra/core/widgets/network_image.dart';
import 'package:khebra/features/notifications/cubit/notifications_cubit.dart';
import 'package:khebra/features/notifications/cubit/notifications_states.dart';
import 'package:khebra/features/notifications/screens/widgets/notifications_container.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<NotificationsCubit, NotificationsStates>(
          builder: (context, state) {
        NotificationsCubit cubit = context.read<NotificationsCubit>();
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(title: "notifications"),
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        // Navigator.pushNamed(context, Routes.offerDetailsRoute);
                      },
                      child: CustomNotificationsContainer(),
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
      }),
    );
  }
}
