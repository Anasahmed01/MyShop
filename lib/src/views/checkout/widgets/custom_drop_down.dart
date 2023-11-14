import 'package:flutter/material.dart';
import '../../../reusable_widgets/text/text.dart';
import '../checkout_viewmodel.dart';

Widget dropDown({required CheckOutViewModel viewModel}) {
  return Flexible(
    child: DropdownButton(
        isExpanded: true,
        underline: Container(color: Colors.transparent),
        alignment: Alignment.center,
        value: viewModel.selecteditem,
        isDense: true,
        borderRadius: BorderRadius.circular(10),
        items: viewModel.address
            .map(
              (e) => DropdownMenuItem<String>(
                alignment: Alignment.centerLeft,
                value: e,
                child: CustomText.customSizedText(
                  text: e,
                  size: 14,
                  maxFontSize: 14,
                  minFontSize: 14,
                  maxLine: 2,
                  textAlign: TextAlign.left,
                ),
              ),
            )
            .toList(),
        onChanged: (addressData) {}),
  );
}
