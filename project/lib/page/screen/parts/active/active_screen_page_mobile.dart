part of '../../screen_page.dart';

class _ActiveScreenPageMobile extends StatelessWidget {
  final ScreenPageModel model;
  _ActiveScreenPageMobile({required this.model});
  @override
  Widget build(BuildContext context) {
    print("=======:");
    // model.choiceRankList.forEach((element) {print('${element.value}:${element.voteTotal}');});
    // print(model.choiceRankList);
    final rankList = model.choiceRankList;
    final minY = 0 - rankList.length -1;
    double index = 0.0;
    final spots = rankList.map<LineChartBarData>((e) {
      index += 1.0;
      return LineChartBarData(
        spots: [
          FlSpot(0, 0-index),
          FlSpot(e.totalPercent - 0.0,  0-index),
        ],
        barWidth: 40,
        colors: [
          Colors.orange,
        ],
      );
    }).toList();
    return Scaffold(
      body: Container(
        color: Colors.green,
        child: Container(
          child: Center(
            child: SizedBox(
              width: 500,
              height: double.infinity,
              child: LineChart(
                LineChartData(
                  maxY: 0.0,
                  minY: minY + 0.0,
                  minX: 0,
                  maxX: 100,
                  lineBarsData: spots,
                  titlesData: FlTitlesData(
                    show: true,
                    topTitles: SideTitles(showTitles: false),
                    rightTitles: SideTitles(showTitles: false),
                    bottomTitles: SideTitles(
                        textDirection: TextDirection.ltr,
                        showTitles: true,
                        getTitles: (value) {
                          // print(value);
                          return '${value}';
                        },
                        margin: 20,
                        reservedSize: 50,
                        interval: 10),
                    leftTitles: SideTitles(
                        textDirection: TextDirection.ltr,
                        showTitles: true,
                        getTitles: (value) {
                          if(0-value>0.0&&0-value<=(rankList.length as double)){
                            final index = (0 - value - 1).round();
                            // print('===========:index${index}');
                            return rankList[index].value;
                          }
                          return '';
                        },
                        margin: 20,
                        reservedSize: 100,
                        interval: 1),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
