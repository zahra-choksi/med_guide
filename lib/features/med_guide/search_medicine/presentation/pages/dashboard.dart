import 'package:flutter/material.dart';
import '../widgets/appbar_widgets.dart';
import '../widgets/reusable_widgets.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: richText(),
        body: gradient(context)
    );
  }
}
