import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvvm_builder/mvvm_builder.dart';
import 'package:pal_demo_app/ui/widgets/moviecard.dart';

import '../../../routes.dart';
import 'home_model.dart';
import 'home_presenter.dart';

abstract class HomeView {
  void pushMoviePage(final BuildContext context);
}

class HomePage extends StatelessWidget implements HomeView {
  HomePage({Key key});

  @override
  Widget build(BuildContext context) {
    return MVVMPage<HomePresenter, HomeModel>(
      presenter: HomePresenter(this),
      builder: (context, presenter, model) => SingleChildScrollView(
        child: SafeArea(
          child: this._buildPage(
            context.buildContext,
            presenter,
            model,
          ),
        ),
      ),
    );
  }

  Widget _buildPage(
    final BuildContext context,
    final HomePresenter presenter,
    final HomeModel model,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // _buildTrending(context, 'assets/images/joker.jpg'),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: GestureDetector(
            onTap: () => pushMoviePage(context),
            child: MovieCard(
              'assets/images/joker.jpg',
              340,
              key: ValueKey('joker1'),
              title: "Joker",
              subtitle: "The beginning of the crazyest clown ever",
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(16, 32, 0, 12),
          child: Text(
            'Get a look here',
            key: ValueKey('getalook'),
            style: TextStyle(color: Theme.of(context).hintColor, fontSize: 16, fontWeight: FontWeight.normal),
          ),
        ),
        _createFirstList(context),
        Padding(
          padding: EdgeInsets.fromLTRB(16, 32, 0, 12),
          child: Text(
            'Your friends love',
            key: ValueKey('getalook2'),
            style: TextStyle(color: Theme.of(context).hintColor, fontSize: 16, fontWeight: FontWeight.normal),
          ),
        ),
        _createSecondList(context),
        Container(
          height: 100,
        ),
      ],
    );
  }

  SizedBox _createFirstList(BuildContext context) {
    return SizedBox(
      height: 200,
      // width: MediaQuery.of(context).size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 8, 16),
            child: GestureDetector(
              onTap: () => pushMoviePage(context),
              child: MovieCard(
                'assets/images/donnie-darko.jpg',
                200,
                key: ValueKey("donnie"),
                title: 'Donnie darko',
                subtitle: 'classic',
                secondary: true,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 16, 16),
            child: MovieCard(
              'assets/images/truman-show.jpg',
              200,
              title: 'The truman show',
              subtitle: 'classic',
              secondary: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 16, 16),
            child: MovieCard(
              'assets/images/batman.jpg',
              200,
              title: 'Batman begins',
              subtitle: 'classic',
              secondary: true,
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _createSecondList(BuildContext context) {
    return SizedBox(
      height: 200,
      // width: MediaQuery.of(context).size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 8, 16),
            child: GestureDetector(
              onTap: () => pushMoviePage(context),
              child: MovieCard(
                'assets/images/bohemian.jpg',
                200,
                title: 'Bohemian rhapsody',
                subtitle: 'classic',
                secondary: true,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 16, 16),
            child: MovieCard(
              'assets/images/guardian.jpg',
              200,
              title: 'Guardians of the galaxy',
              subtitle: 'classic',
              secondary: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 16, 16),
            child: MovieCard(
              'assets/images/guardian2.jpg',
              200,
              title: 'Guardians of the galaxy 2',
              subtitle: 'classic',
              secondary: true,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void pushMoviePage(BuildContext context) => appPushNamed('/movie');
}
