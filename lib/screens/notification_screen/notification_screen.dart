import 'package:flutter/material.dart';
import 'package:pocket_clinic/widgets/app_widgets.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppWidgets.titleBar(),
      body: AppWidgets.datanotfoundtext(title: 'Notification'),);
  }
}