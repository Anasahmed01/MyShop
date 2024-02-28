import 'package:flutter/material.dart';
import '../../../utils/style/color/app_colors.dart';
import '../../../utils/style/waiting/waiting_reuse.dart';

Widget waitingProductData({
  required BuildContext context,
  void Function()? onBackTap,
}) {
  return Container(
    height: double.infinity,
    width: double.infinity,
    color: AppColors.whiteColor,
    child: Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
        leading: InkWell(
          onTap: onBackTap,
          child: const Icon(Icons.arrow_back_ios_rounded),
        ),
        // actions: [],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: AppColors.lightGreyColor,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Positioned(
                    right: 0,
                    height: MediaQuery.sizeOf(context).height * 0.4,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          WaitingReusable.iconSkeleton(
                              height: 40,
                              width: 40,
                              color: AppColors.greyColor.withOpacity(0.6)),
                          WaitingReusable.iconSkeleton(
                              height: 40,
                              width: 40,
                              color: AppColors.greyColor.withOpacity(0.6)),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: WaitingReusable.imageSkeleton(
                      height: MediaQuery.sizeOf(context).height * 0.4,
                      width: MediaQuery.sizeOf(context).width * 0.7,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2),
                                child: WaitingReusable.textSkeleton(
                                  height: 20,
                                  width: MediaQuery.sizeOf(context).width * 0.5,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2),
                                child: WaitingReusable.textSkeleton(
                                  height: 20,
                                  width: MediaQuery.sizeOf(context).width,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2),
                                child: WaitingReusable.textSkeleton(
                                  height: 20,
                                  width: MediaQuery.sizeOf(context).width * 0.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        WaitingReusable.textSkeleton(height: 35, width: 100),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: 65,
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            WaitingReusable.textSkeleton(height: 15),
                            const SizedBox(height: 10),
                            Flexible(
                              child: Row(
                                children: [
                                  Container(
                                    width: 2,
                                    color: Colors.grey,
                                  ),
                                  Flexible(
                                    child: SizedBox(
                                      width: MediaQuery.sizeOf(context).width,
                                      child: ListView.separated(
                                        itemCount: 10,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return WaitingReusable.iconSkeleton(
                                              height: 40, width: 40);
                                        },
                                        separatorBuilder: (_, index) {
                                          return const SizedBox(width: 10);
                                        },
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 2,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height * 0.15,
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            WaitingReusable.textSkeleton(height: 15, width: 70),
                            const SizedBox(height: 10),
                            Flexible(
                              child: Row(
                                children: [
                                  Container(
                                    width: 2,
                                    color: Colors.grey,
                                  ),
                                  Flexible(
                                    child: SizedBox(
                                      width: MediaQuery.sizeOf(context).width,
                                      child: ListView.separated(
                                        itemCount: 10,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return WaitingReusable.imageSkeleton(
                                            width: 80,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          );
                                        },
                                        separatorBuilder: (_, index) {
                                          return const SizedBox(width: 10);
                                        },
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 2,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: WaitingReusable.textSkeleton(
                          height: 40, width: double.infinity),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
