part of '../../screen_page.dart';

class _ActiveScreenPageTablet extends StatelessWidget {
    final ScreenPageModel model;
  _ActiveScreenPageTablet({required this.model});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
        child: Container(
          child: Center(
          ),
        ),
      ),
    );
  }
}
