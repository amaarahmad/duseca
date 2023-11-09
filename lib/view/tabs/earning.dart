import 'package:duseca_task/const/widgets/chart_widget.dart';
import 'package:flutter/material.dart';
class EarningTab extends StatelessWidget {
  const EarningTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ChartWidget(title: 'Your earnings',);
  }
}
