part of '../../screen_page.dart';

class _ReadyPageMobile extends StatelessWidget{
  final VisitorPageModel model;
  _ReadyPageMobile({required this.model});
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