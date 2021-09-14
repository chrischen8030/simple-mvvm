library visitor_page;

import 'package:flutter/material.dart';
import 'package:project/core/provider/current_event_provider.dart';
import 'package:project/core/provider/view_model_provider.dart';
import 'package:project/page/visitor/visitor_page_model.dart';
import 'package:provider/provider.dart';

part 'parts/ready/ready_page_desktop.dart';
part 'parts/ready/ready_page_mobile.dart';
part 'parts/ready/ready_page_tablet.dart';

class VisitorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = VisitorPageModel();
    return ViewModelProvider.withConsumer(
      viewModel: model,
      builder: (context, model, child) {
        return Container();
      },
      staticChild: null,
    );
  }
}
          // child: Text('${context.watch<CurrentEventProvider>().currentQuestion?.status ?? "何もないです！"}'),
