part of '../../visitor_page.dart';

class _ReadyPageTablet extends StatelessWidget {
  final VisitorPageModel model;
  _ReadyPageTablet({required this.model});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
        child: Column(children: [
          Container(
            child: Center(
              child: Text("${model.state}"),
            ),
          ),
        ]),
      ),
    );
  }
}
