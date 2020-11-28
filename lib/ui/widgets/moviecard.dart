import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {

  final String imagePath, title, subtitle;
  final double height;
  final bool secondary;

  MovieCard(
    this.imagePath,
    this.height,
    {this.title, this.subtitle, this.secondary = false, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey(key),
      height: height,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Colors.blue,
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
          alignment: Alignment.topCenter
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF707275).withOpacity(.2),
            blurRadius: 6,
            spreadRadius: 1,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Visibility(
        visible: title != null,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: secondary ? 60 : 88,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
              color: Color(0xFF15212C).withOpacity(.8),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      title ?? "",
                      style: TextStyle(color: Colors.white, fontSize: secondary ? 14 : 32),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        subtitle ?? 'Lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum '
                          'lorem ipsum lorem ipsum lorem ipsum lorem ',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Theme.of(context).hintColor,
                          fontSize: secondary ? 8 : 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
