library visitor_page;

import 'package:flutter/material.dart';
import 'package:project/core/provider/view_model_provider.dart';
import 'package:project/page/visitor/visitor_page_model.dart';
import 'package:responsive_builder/responsive_builder.dart';

part 'parts/ready/ready_page_desktop.dart';
part 'parts/ready/ready_page_mobile.dart';
part 'parts/ready/ready_page_tablet.dart';

class VisitorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = VisitorPageModel();
    return ViewModelProvider<VisitorPageModel>.withConsumer(
      viewModel: model,
      builder: (context, model, child) {
        return ScreenTypeLayout(
          mobile: _ReadyPageMobile(
            model: model,
          ),
          desktop: _ReadyPageDesktop(
            model: model,
          ),
          tablet: _ReadyPageTablet(
            model: model,
          ),
        );
      },
      staticChild: null,
    );
  }
}
