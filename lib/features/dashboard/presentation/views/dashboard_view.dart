import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/dashboard/presentation/views/widget/dashboard_view_body.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});
  static const routeName = 'dashboardView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: DashboardViewBody());
  }
}
