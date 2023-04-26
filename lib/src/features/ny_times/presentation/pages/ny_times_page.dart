import 'package:ny_times_app/src/core/common_feature/presentation/pages/background_page.dart';
import 'package:flutter/material.dart';

class NyTimesPage extends StatefulWidget {
  const NyTimesPage({Key? key}) : super(key: key);

  @override
  State<NyTimesPage> createState() => _NyTimesPageState();
}

class _NyTimesPageState extends State<NyTimesPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
      child: Center(
        child: Text("NyTimesPage"),
      ),
    );
  }
}
