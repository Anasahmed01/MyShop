import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../utils/style/color/app_colors.dart';
import '../../../utils/style/waiting/waiting_reuse.dart';

class NotificationWaiting {
  static Widget waitingList({
    required BuildContext context,
  }) {
    return AnimationLimiter(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            delay: const Duration(milliseconds: 200),
            child: SlideAnimation(
              child: Card(
                elevation: 0,
                child: Stack(
                  children: [
                    Positioned(
                      right: 0,
                      top: 0,
                      child: WaitingReusable.textSkeleton(),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            WaitingReusable.imageSkeleton(
                              height: MediaQuery.sizeOf(context).width * 0.25,
                              width: MediaQuery.sizeOf(context).width * 0.25,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            Flexible(
                              child: ListTile(
                                title: Padding(
                                  padding: EdgeInsets.only(
                                      right: MediaQuery.sizeOf(context).width *
                                          0.2),
                                  child:
                                      WaitingReusable.textSkeleton(height: 20),
                                ),
                                subtitle: SizedBox(
                                  height: 80,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      WaitingReusable.textSkeleton(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.6,
                                      ),
                                      WaitingReusable.textSkeleton(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.5,
                                      ),
                                      WaitingReusable.textSkeleton(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.4,
                                      ),
                                      WaitingReusable.textSkeleton(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.3,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(color: AppColors.greyColor),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
