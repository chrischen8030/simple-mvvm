part of '../../screen_page.dart';

class _ActiveScreenPageDesktop extends StatelessWidget {
  final ScreenPageModel model;
  _ActiveScreenPageDesktop({required this.model});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
        child: Container(
          child: Center(
            child: SizedBox(
              width: 500,
              height: 500,
              child: LineChart(LineChartData(lineBarsData: [
                LineChartBarData(
                  spots: [
                    FlSpot(1, 2),
                    FlSpot(3, 2),
                  ],
                  barWidth: 20,
                  colors: [
                    Colors.orange,
                  ],
                )
              ])),
            ),
          ),
        ),
      ),
    );
  }
}
