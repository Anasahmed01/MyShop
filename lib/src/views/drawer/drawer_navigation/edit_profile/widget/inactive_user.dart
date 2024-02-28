import 'package:flutter/material.dart';
import '../../../../../utils/style/waiting/waiting_reuse.dart';

Widget inactiveUser({required BuildContext context}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: WaitingReusable.textSkeleton(
              height: 25, width: MediaQuery.sizeOf(context).width * 0.4),
        ),
        const SizedBox(height: 25),
        Center(
          child: Stack(
            children: [
              WaitingReusable.iconSkeleton(
                height: MediaQuery.sizeOf(context).width * 0.35,
                width: MediaQuery.sizeOf(context).width * 0.35,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80),
                  ),
                  elevation: 5,
                  child: WaitingReusable.iconSkeleton(
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: WaitingReusable.textSkeleton(
              height: 20, width: MediaQuery.sizeOf(context).width * 0.3),
        ),
        const SizedBox(height: 25),
        WaitingReusable.textSkeleton(
            width: MediaQuery.sizeOf(context).width * 0.2),
        const SizedBox(height: 15),
        WaitingReusable.fieldSkeleton(width: MediaQuery.sizeOf(context).width),
        const SizedBox(height: 15),
        WaitingReusable.textSkeleton(
            width: MediaQuery.sizeOf(context).width * 0.2),
        const SizedBox(height: 15),
        WaitingReusable.fieldSkeleton(width: MediaQuery.sizeOf(context).width),
        const SizedBox(height: 15),
        WaitingReusable.textSkeleton(
            width: MediaQuery.sizeOf(context).width * 0.2),
        const SizedBox(height: 15),
        WaitingReusable.fieldSkeleton(width: MediaQuery.sizeOf(context).width),
        const SizedBox(height: 15),
        WaitingReusable.textSkeleton(
            width: MediaQuery.sizeOf(context).width * 0.2),
        const SizedBox(height: 15),
        WaitingReusable.fieldSkeleton(width: MediaQuery.sizeOf(context).width),
        const SizedBox(height: 15),
        WaitingReusable.textSkeleton(
            width: MediaQuery.sizeOf(context).width * 0.2),
        const SizedBox(height: 15),
        WaitingReusable.fieldSkeleton(width: MediaQuery.sizeOf(context).width),
        const SizedBox(height: 15),
        WaitingReusable.textSkeleton(
            width: MediaQuery.sizeOf(context).width * 0.2),
        const SizedBox(height: 15),
        WaitingReusable.fieldSkeleton(width: MediaQuery.sizeOf(context).width),
        const SizedBox(height: 35),
        Center(
          child: WaitingReusable.textSkeleton(
              borderRadius: BorderRadius.circular(30),
              height: 50,
              width: MediaQuery.sizeOf(context).width * 0.4),
        ),
        const SizedBox(height: 55),
      ],
    ),
  );
}
