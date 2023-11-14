import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'cards.dart';

class Waiting {
  static Widget waitingCart() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return AnimationLimiter(
          child: AnimationConfiguration.staggeredList(
            delay: const Duration(milliseconds: 200),
            position: index,
            child: SlideAnimation(
              child: WaitingCards.cartCard(context: context),
            ),
          ),
        );
      },
    );
  }

  static Widget waitingPastOrder() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return AnimationLimiter(
          child: AnimationConfiguration.staggeredList(
            delay: const Duration(milliseconds: 200),
            position: index,
            child: SlideAnimation(
              child: WaitingCards.pastOrdersCard(context: context),
            ),
          ),
        );
      },
    );
  }
}
