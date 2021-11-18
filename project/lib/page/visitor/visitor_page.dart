library visitor_page;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:project/core/provider/view_model_provider.dart';
import 'package:project/page/visitor/visitor_page_model.dart';
import 'package:responsive_builder/responsive_builder.dart';

part 'parts/ready/ready_page_desktop.dart';
part 'parts/ready/ready_page_mobile.dart';
part 'parts/ready/ready_page_tablet.dart';
part 'parts/active/active_vote_page_tablet.dart';
part 'parts/active/active_vote_page_mobile.dart';
part 'parts/active/active_vote_page_desktop.dart';

class VisitorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = VisitorPageModel();
    return ViewModelProvider<VisitorPageModel>.withConsumer(
      viewModel: model,
      builder: (context, model, child) {
        return ScreenTypeLayout(
          mobile: _ActiveVotePageMobile(
            model: model,
          ),
          desktop: _ActiveVotePageDesktop(
            model: model,
          ),
          tablet: _ActiveVotePageTablet(
            model: model,
          ),
        );
      },
      staticChild: null,
    );
  }
}
