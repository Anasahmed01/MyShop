import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:shop/src/views/home/slider/slider_viewmodel.dart';
import 'package:shop/src/views/home/slider/slider_widget.dart';
import 'package:stacked/stacked.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SliderViewModel(),
      onViewModelReady: (viewModel) async {
        await viewModel.getSlider();
      },
      builder: (context, viewModel, child) {
        return Visibility(
          child: viewModel.isLoading == true
              ? waitingSlider(context: context, viewModel: viewModel)
              : Column(
                  children: [
                    SizedBox(
                      height: 170,
                      // MediaQuery.sizeOf(context).height * 0.2,
                      width: double.infinity,
                      child: Swiper(
                        itemWidth: MediaQuery.sizeOf(context).width * 0.75,
                        layout: SwiperLayout.STACK,
                        itemCount: viewModel.sliderImg.length,
                        autoplayDisableOnInteraction: true,
                        controller: viewModel.controller,
                        autoplay: true,
                        scrollDirection: Axis.horizontal,
                        axisDirection: AxisDirection.right,
                        itemBuilder: (context, index) {
                          final urlImage = viewModel.sliderImg[index];
                          return buildImage(
                              urlImage: urlImage,
                              index: index,
                              context: context);
                        },
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          color: viewModel.button1Color,
                          onPressed: () {
                            viewModel.selectButton1();
                            viewModel.previous();
                          },
                          icon: const Icon(
                            Icons.arrow_circle_left_sharp,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            viewModel.next();
                            viewModel.selectButton2();
                          },
                          color: viewModel.button2Color,
                          icon: const Icon(
                            Icons.arrow_circle_right_sharp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        );
      },
    );
  }
}
