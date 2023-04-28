import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppLoader extends StatelessWidget {
  final Color? iconColor;

  const AppLoader({
    Key? key,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SpinKitFadingCircle(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                    color: iconColor ?? Theme.of(context).iconTheme.color,
                    borderRadius: BorderRadius.circular(25)),
              );
            },
          )),
    );
  }
}
