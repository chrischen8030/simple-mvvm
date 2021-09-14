import 'package:flutter/material.dart';
import 'package:project/components/cells/beauty_cell.dart';
import 'package:project/core/models/firebase_models/event.dart';
import 'package:project/core/provider/current_event_provider.dart';
import 'package:project/core/util/firebase_auth_util.dart';
import 'package:project/core/util/firebase_firestoroe_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CurrentEventProvider().eid = "JqE97PbndNInysqdHjgL";
    return Scaffold(
        body: FutureBuilder(
            future: FirebaseAuthUtil().signInWithEmailAndPassword(
                email: "chenai@bravesoft.co.jp", password: "password"),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return FutureBuilder<List<Event>?>(
                    future: FirebaseFirestoreUtil().getCurrentUserEvents(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Container(
                          child: Center(
                            child: Text("has error"),
                          ),
                        );
                      }
                      if (snapshot.hasData) {
                        final titlesWidgets = snapshot.data!.map((e) {
                          return BeautyCell(
                            title: e.title,
                            subTitle: "イベント詳細へ >",
                            subTitleClick: () {
                              print("subtitle click");
                            },
                          );
                        }).toList();
                        return SingleChildScrollView(
                          child: Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: titlesWidgets,
                              ),
                            ),
                          ),
                        );
                      }
                      return Container();
                    });
              }
              return Container(
                child: Center(
                  child: Text("is loading ......."),
                ),
              );
            }));
  }
}
