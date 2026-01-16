import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/camera/presentation/bloc/camera_bloc.dart';
import '../../features/camera/presentation/bloc/camera_event.dart';
import '../../features/camera/presentation/camera_page.dart';
import 'routes.dart';

class AppRouter {
  AppRouter._();

  static Route? generateRoute(RouteSettings settings) {
    // this arguments to be passed in any screen like this ( arguments as ClassName )
    // final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.cameraPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<CameraBloc>(
            create: (context) => CameraBloc()..add(InitializeCamera()),
            child: const CameraPage(),
          ),
        );
      default:
        return null;
    }
  }
}
