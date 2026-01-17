import 'package:flutter/material.dart';

import '../../../core/theming/colors_manager.dart';
import 'widgets/photo_details_app_bar.dart';
import 'widgets/photo_details_error.dart';
import 'widgets/photo_details_loader.dart';
import 'widgets/photo_view.dart';

class PhotoDetailsPage extends StatelessWidget {
  const PhotoDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorsManager.customBlack,
      appBar: PhotoDetailsAppBar(),
      body: Column(
        children: [
          Divider(color: ColorsManager.customGray, height: 20, thickness: 1),
          PhotoDetailsLoader(),
          PhotoDetailsError(),
          PhotoView(),
        ],
      ),
    );
  }
}
