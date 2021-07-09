import 'dart:io';

import 'package:camerawesome/models/capture_modes.dart';
import 'package:camerawesome/models/sensors.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_builder/mvvm_builder.dart';
import 'package:pal_demo_app/ui/pages/movie/movie_page.dart';
import 'package:pal_demo_app/ui/widgets/moviecard.dart';

import '../../../routes.dart';

class LibraryViewModel extends MVVMModel {}

abstract class LibraryView {}

class LibraryPresenter extends Presenter<LibraryViewModel, LibraryView> {
  LibraryPresenter(LibraryView viewInterface) : super(LibraryViewModel(), viewInterface);
}

class LibraryPage extends StatelessWidget implements LibraryView {
  ValueNotifier<Sensors> _sensor = ValueNotifier(Sensors.FRONT);
  ValueNotifier<Size> _photoSize = ValueNotifier(null);
  ValueNotifier<CaptureModes> _captureMode = ValueNotifier(CaptureModes.PHOTO);

  @override
  Widget build(BuildContext context) {
    return MVVMPage<LibraryPresenter, LibraryViewModel>(
      key: ValueKey("presenter"),
      presenter: LibraryPresenter(
        this,
      ),
      builder: (context, presenter, model) => ListView(
        children: [
          GestureDetector(
            onTap: () => pushMoviePage(),
            child: MovieCard(
              'assets/images/donnie-darko.jpg',
              200,
              title: 'Donnie darko',
              subtitle: 'classic',
              secondary: true,
            ),
          ),
          GestureDetector(
            onTap: () => pushMoviePage(),
            child: MovieCard(
              'assets/images/guardian.jpg',
              200,
              title: 'Guardians of the galaxy',
              subtitle: 'classic',
              secondary: true,
            ),
          ),
          GestureDetector(
            onTap: () => pushMoviePage(),
            child: MovieCard(
              'assets/images/bohemian.jpg',
              200,
              title: 'Bohemian rhapsody',
              subtitle: 'classic',
              secondary: true,
            ),
          ),
          GestureDetector(
            onTap: () => pushMoviePage(),
            child: MovieCard(
              'assets/images/batman.jpg',
              200,
              title: 'Batman begins',
              subtitle: 'classic',
              secondary: true,
            ),
          )
        ],
      ),
    );
  }

  // void pushMoviePage() => appPushNamed('/movie');

  void pushMoviePage() => appPush((context) => MoviePage(), "/movie");
}
