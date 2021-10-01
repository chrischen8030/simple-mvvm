part of '../../visitor_page.dart';

class _ReadyPageDesktop extends StatelessWidget {
  final VisitorPageModel model;
  _ReadyPageDesktop({required this.model});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
        child: Container(
          child: Center(
            child: Column(children: [
              Container(
                child: Text("${model.state}"),
              ),
              Container(
                child: Text("${model.title}"),
              ),
              Container(
                child: Text("type:${model.type}"),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
