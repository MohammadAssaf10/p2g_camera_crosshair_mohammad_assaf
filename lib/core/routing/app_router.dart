import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/camera/presentation/bloc/camera_bloc.dart';
import '../../features/camera/presentation/bloc/camera_event.dart';
import '../../features/camera/presentation/camera_page.dart';
import '../../features/photo_details_page/presentation/bloc/photo_details_bloc.dart';
import '../../features/photo_details_page/presentation/bloc/photo_details_event.dart';
import '../../features/photo_details_page/presentation/photo_details_page.dart';
import 'router_transitions.dart';
import 'routes.dart';

class AppRouter {
  AppRouter._();

  static Route? generateRoute(RouteSettings settings) {
    // this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.cameraPage:
        return RouterTransitions.buildDefault(
          BlocProvider<CameraBloc>(
            create: (context) => CameraBloc()..add(InitializeCamera()),
            child: const CameraPage(),
          ),
        );
      case Routes.photoDetailsPage:
        return RouterTransitions.buildFade(
          (_, _, _) => BlocProvider<PhotoDetailsBloc>(
            create: (context) =>
                PhotoDetailsBloc()
                  ..add(SaveImage((b) => b..image = arguments as File)),
            child: const PhotoDetailsPage(),
          ),
        );
      default:
        return null;
    }
  }
}
