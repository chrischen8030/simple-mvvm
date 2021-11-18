library visitor_page;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:project/core/provider/view_model_provider.dart';
import 'package:project/page/screen/screen_page_model.dart';
import 'package:project/page/visitor/visitor_page_model.dart';
import 'package:responsive_builder/responsive_builder.dart';

part 'parts/ready/ready_screen_page_desktop.dart';
part 'parts/ready/ready_screen_page_mobile.dart';
part 'parts/ready/ready_screen_page_tablet.dart';
part 'parts/active/active_screen_page_tablet.dart';
part 'parts/active/active_screen_page_mobile.dart';
part 'parts/active/active_screen_page_desktop.dart';

class ScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = ScreenPageModel();
    return ViewModelProvider<ScreenPageModel>.withConsumer(
      viewModel: model,
      builder: (context, model, child) {
        return ScreenTypeLayout(
          mobile: _ActiveScreenPageMobile(
            model: model,
          ),
          desktop: _ActiveScreenPageDesktop(
            model: model,
          ),
          tablet: _ActiveScreenPageTablet(
            model: model,
          ),
        );
      },
      staticChild: null,
    );
  }
}
