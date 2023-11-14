// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../../reusable_widgets/text/text.dart';
import '../../../../../utils/style/color/app_colors.dart';

Widget contentContainer() {
  return ListView(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    children: [
      SizedBox(
        height: 20,
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.primaryColor,
        ),
        child: Column(
          children: [
            CustomText.customSizedText(
                text:
                    '1.  Network Issues: There might be a problem with your network connection, or the remote server may be temporarily unavailable.',
                color: AppColors.whiteColor,
                minFontSize: 16,
                maxLine: 10,
                size: 16),
            SizedBox(
              height: 20,
            ),
            CustomText.customSizedText(
                text:
                    '2. Firewall or Security Software: A firewall or security software on your personal mobile device or on the network might be blocking the connection.',
                color: AppColors.whiteColor,
                minFontSize: 16,
                maxLine: 10,
                size: 16),
            SizedBox(
              height: 20,
            ),
            CustomText.customSizedText(
                text:
                    '3.  Incorrect IP or Port: Ensure that you are using the correct IP address and port to connect to the remote server.',
                color: AppColors.whiteColor,
                minFontSize: 16,
                maxLine: 10,
                size: 16),
            SizedBox(
              height: 20,
            ),
            CustomText.customSizedText(
                text:
                    '4.  Remote Server Issues: The server you are trying to connect to may be down, experiencing high load, or configured to refuse incoming connections.',
                color: AppColors.whiteColor,
                minFontSize: 16,
                maxLine: 10,
                size: 16),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.seconderyColor,
        ),
        child: CustomText.customSizedText(
            text: 'To resolve this issue, you can try the following steps:',
            color: AppColors.primaryColor,
            minFontSize: 16,
            maxLine: 10,
            size: 16),
      ),
      SizedBox(
        height: 20,
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.primaryColor,
        ),
        child: Column(
          children: [
            CustomText.customSizedText(
                text:
                    '1.  Check your network connection: Make sure your mobile device is connected to the internet and that there are no issues with your data or Wi-Fi connection.',
                color: AppColors.whiteColor,
                minFontSize: 16,
                maxLine: 10,
                size: 16),
            SizedBox(
              height: 20,
            ),
            CustomText.customSizedText(
                text:
                    '2.  Check the server status: Verify that the remote server you are trying to connect to is up and running. You can try accessing it through a web browser to confirm its availability.',
                color: AppColors.whiteColor,
                minFontSize: 16,
                maxLine: 10,
                size: 16),
            SizedBox(
              height: 20,
            ),
            CustomText.customSizedText(
                text:
                    "3.  Disable firewalls or security software: If you have firewall or security software on your mobile device, temporarily disable it to see if it's the cause of the issue. Be sure to enable it again once you've identified the problem.",
                color: AppColors.whiteColor,
                minFontSize: 16,
                maxLine: 10,
                size: 16),
            SizedBox(
              height: 20,
            ),
            CustomText.customSizedText(
                text:
                    '4.  Verify the IP and port: Double-check that you are using the correct IP address and port number in your Java application to connect to the server.',
                color: AppColors.whiteColor,
                minFontSize: 16,
                maxLine: 10,
                size: 16),
            SizedBox(
              height: 20,
            ),
            CustomText.customSizedText(
                text:
                    '5.  Verify the IP and port: Double-check that you are using the correct IP address and port number in your Java application to connect to the server.',
                color: AppColors.whiteColor,
                minFontSize: 16,
                maxLine: 10,
                size: 16),
            SizedBox(
              height: 20,
            ),
            CustomText.customSizedText(
                text:
                    '6.  Check for any proxy settings: If you are behind a proxy server, ensure that your Java application is configured to use the correct proxy settings.',
                color: AppColors.whiteColor,
                minFontSize: 16,
                maxLine: 10,
                size: 16),
            SizedBox(
              height: 20,
            ),
            CustomText.customSizedText(
                text:
                    '7.  Test with a different server or resource: To rule out server-specific issues, try connecting to a different server or resource to see if the problem is isolated to a particular server.',
                color: AppColors.whiteColor,
                minFontSize: 16,
                maxLine: 10,
                size: 16),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      SizedBox(
        height: 30,
      ),
    ],
  );
}
