import 'package:flutter/material.dart';

import '../../../../utils/style/waiting/waiting_reuse.dart';

class WaitingCards {
  static Widget cartCard({required BuildContext context}) {
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
                      height: 30,
                      width: MediaQuery.sizeOf(context).width,
                    ),
                    const SizedBox(height: 10),
                    WaitingReusable.imageSkeleton(
                      borderRadius: BorderRadius.circular(10),
                      height: 120,
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
                        height: 30,
                        width: MediaQuery.sizeOf(context).width * 0.5,
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

  static Widget pastOrdersCard({required BuildContext context}) {
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
}
