import 'package:flutter/material.dart';

import 'waiting_reuse.dart';

class WaitingList {
  static Widget favCard({required BuildContext context}) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.24,
                child: Column(
                  children: [
                    WaitingReusable.imageSkeleton(
                      borderRadius: BorderRadius.circular(10),
                      height: 25,
                      width: MediaQuery.sizeOf(context).width,
                    ),
                    const SizedBox(height: 10),
                    WaitingReusable.imageSkeleton(
                      borderRadius: BorderRadius.circular(10),
                      height: 120,
                      width: MediaQuery.sizeOf(context).width,
                    ),
                    const SizedBox(height: 10),
                    WaitingReusable.imageSkeleton(
                      borderRadius: BorderRadius.circular(30),
                      height: 30,
                      width: MediaQuery.sizeOf(context).width,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                flex: 10,
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      WaitingReusable.textSkeleton(
                        height: 20,
                        width: MediaQuery.sizeOf(context).width,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          WaitingReusable.textSkeleton(
                            height: 10,
                            width: MediaQuery.sizeOf(context).width * 0.12,
                          ),
                          WaitingReusable.textSkeleton(
                            height: 10,
                            width: MediaQuery.sizeOf(context).width * 0.3,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      WaitingReusable.textSkeleton(
                        height: 40,
                        width: MediaQuery.sizeOf(context).width,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          WaitingReusable.textSkeleton(
                            height: 10,
                            width: MediaQuery.sizeOf(context).width * 0.1,
                          ),
                          const SizedBox(width: 10),
                          WaitingReusable.textSkeleton(
                            height: 30,
                            width: MediaQuery.sizeOf(context).width * 0.3,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                children: [
                  WaitingReusable.imageSkeleton(
                      height: 120,
                      width: 40,
                      borderRadius: BorderRadius.circular(30))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  static Widget noImageCards({required BuildContext context}) {
    return Card(
      elevation: 5,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 25, left: 10, right: 10, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WaitingReusable.textSkeleton(
                    width: MediaQuery.sizeOf(context).width * 0.35, height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: WaitingReusable.imageSkeleton(height: 35, width: 35),
                ),
              ],
            ),
            const SizedBox(height: 15),
            WaitingReusable.textSkeleton(
                width: MediaQuery.sizeOf(context).width * 0.5),
            const SizedBox(height: 15),
            Row(
              children: [
                WaitingReusable.iconSkeleton(height: 30, width: 30),
                const SizedBox(width: 10),
                WaitingReusable.textSkeleton(
                    width: MediaQuery.sizeOf(context).width * 0.32),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.black.withOpacity(0.04),
                ),
                const SizedBox(width: 10),
                WaitingReusable.textSkeleton(
                    width: MediaQuery.sizeOf(context).width * 0.4),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
