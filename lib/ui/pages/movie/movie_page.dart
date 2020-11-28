import 'package:flutter/material.dart';
import 'package:mvvm_builder/mvvm_builder.dart';

class MoviePageViewModel extends MVVMModel {

  final Color bgColor = Color(0xFF111820);
  final Color textColor = Color(0xFFDFDFD5);

}

abstract class MoviePageView {

}

class MoviePagePresenter extends Presenter<MoviePageViewModel, MoviePageView> {

  MoviePagePresenter(MoviePageView viewInterface)
    : super(MoviePageViewModel(), viewInterface);

}


class MoviePage extends StatelessWidget implements MoviePageView {


  @override
  Widget build(BuildContext context) {
    return MVVMPage<MoviePagePresenter, MoviePageViewModel>(
      presenter: MoviePagePresenter(this),
      builder: (context, presenter, model) => _buildPage(model, context.buildContext),
    );
  }

  _buildPage(MoviePageViewModel model, BuildContext context) =>
    Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: _buildBackground(
        model,
        child: FractionallySizedBox(
          heightFactor: 3/5,
          alignment: Alignment.bottomCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Available Now",
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1,
                  color: model.textColor.withOpacity(0.8),
                  fontSize: 16
                ),
              ),
              Text(
                "Watch Joker",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 32, 0, 0),
                child: Text(
                  "Synopsis",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    height: 1,
                    fontWeight: FontWeight.bold,
                    color: model.textColor.withOpacity(1),
                    fontSize: 16
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Text(
                  "Lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum ",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    height: 1,
                    fontWeight: FontWeight.w300,
                    color: model.textColor.withOpacity(1),
                    fontSize: 16
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text:'Director ', style: TextStyle(fontWeight: FontWeight.w500, color: Theme.of(context).accentColor)),
                      TextSpan(text:'Todd Mojette ', style: TextStyle(fontWeight: FontWeight.w300, color: model.textColor))
                    ]
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 4, 16, 16),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text:'Writer : ', style: TextStyle(fontWeight: FontWeight.w500, color: Theme.of(context).accentColor)),
                      TextSpan(text:'Mi Molette : ', style: TextStyle(fontWeight: FontWeight.w300, color: model.textColor))
                    ]
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );

  _buildBackground(MoviePageViewModel model, {Widget child}) =>
    LayoutBuilder(
      builder: (ctx, constraints) => Container(
        height: constraints.maxHeight,
        width: constraints.maxWidth,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/joker.jpg'),
            fit: BoxFit.cover,
            alignment: Alignment.center
          ),
        ),
        child: Container(
          child: child,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                model.bgColor.withOpacity(0.2),
                model.bgColor.withOpacity(0.8),
                model.bgColor.withOpacity(1)
              ],
              stops: [
                0.0,
                0.5,
                1
              ],
            ),
          ),
        ),
      ),
    );

}


