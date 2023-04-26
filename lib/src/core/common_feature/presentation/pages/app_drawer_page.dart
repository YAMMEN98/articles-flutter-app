import 'package:flutter/material.dart';

class AppDrawerPage extends StatefulWidget {
  const AppDrawerPage({Key? key}) : super(key: key);

  @override
  State<AppDrawerPage> createState() => _AppDrawerPageState();
}

class _AppDrawerPageState extends State<AppDrawerPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      // width: 600,
      child: Center(
        child: Text("This Is Drawer!"),
      ),
    );
  }
}
