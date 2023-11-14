import 'package:flutter/material.dart';
import 'waiting_reuse.dart';

class WaitingBlock {
  static Widget homeCard({required BuildContext context}) {
    return Card(
      child: Container(
        color: Colors.black.withOpacity(0.004),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: WaitingReusable.imageSkeleton(height: 60, width: 60),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 25),
                child: WaitingReusable.textSkeleton(
                  height: 10,
                  width: MediaQuery.sizeOf(context).width * 0.3,
                )),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: WaitingReusable.textSkeleton(
                    width: MediaQuery.sizeOf(context).width * 0.4)),
          ],
        ),
      ),
    );
  }

  static Widget catCard({required BuildContext context}) {
    return Card(
      child: Container(
        color: Colors.black.withOpacity(0.004),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            WaitingReusable.iconSkeleton(
              height: MediaQuery.sizeOf(context).width * 0.2,
              width: MediaQuery.sizeOf(context).width * 0.2,
              color: Colors.grey.withOpacity(0.5),
            ),
            WaitingReusable.textSkeleton(
              height: 10,
              width: MediaQuery.sizeOf(context).width * 0.2,
              color: Colors.grey.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }
}
