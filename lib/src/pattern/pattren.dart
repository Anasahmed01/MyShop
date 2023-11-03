// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pattern_lock/pattern_lock.dart';
import 'package:shop/src/pattern/pattren_viewmodel.dart';
import 'package:stacked/stacked.dart';

class PatternView extends StatelessWidget {
  const PatternView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => PatternViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 200,
                  width: 300,
                  child: PatternLock(
                    // color of selected points.
                    selectedColor: Colors.red,
                    // radius of points.
                    pointRadius: 8,
                    // whether show user's input and highlight selected points.
                    showInput: true,
                    // count of points horizontally and vertically.
                    dimension: 3,
                    // padding of points area relative to distance between points.
                    relativePadding: 0.7,
                    // needed distance from input to point to select point.
                    selectThreshold: 25,
                    // whether fill points.
                    fillPoints: true,
                    // callback that called when user's input complete. Called if user selected one or more points.
                    onInputComplete: (List<int> input) {
                      print("pattern is $input");
                    },
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
