import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart' hide Banner;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:collection/collection.dart';

import '../../../../common/models/page_state/result_builder.dart';
import '../../../app/presentation/pages/empty_screen.dart';
import '../../../app/presentation/pages/error_screen.dart';
import '../../../app/presentation/pages/loading_screen.dart';
import '../bloc_home/home_bloc.dart';
import '../bloc_home/home_event.dart';
import '../bloc_home/home_state.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({
    super.key,
  });

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  final ValueNotifier<int> activeIndex = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    context.read<CartBloc>().add(GetAllSiderEvent(onSuccess: () {}));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return PageStateBuilder(
            init: const SizedBox.shrink(),
            success: (data) => Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                          height: 200.h,
                          onPageChanged: (index, reason) =>
                              activeIndex.value = index,
                          autoPlay: true,
                          scrollDirection: Axis.horizontal,
                          viewportFraction: 1),
                      items: data
                          .mapIndexed((index, e) => Padding(
                                padding: REdgeInsets.symmetric(horizontal: 0),
                                child: InkWell(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                          child: Container(
                                            height: 140,
                                            decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                            child: Image.network(
                                              "https://ofrlk.com/${e.image}",
                                              // "https://ofrlk.com/images/country-images/iraq.png",
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                      DotsIndicator(
                                        dotsCount: data.length,
                                        position: index,
                                        decorator: DotsDecorator(
                                            color: Colors
                                                .black87,
                                            activeColor: Color(0xffF22D00),
                                            size: const Size.square(4.0),
                                            activeSize: const Size(9.0, 4.0),
                                            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))

                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ],
                ),
            loading: const LoadingScreen(),
            error: (error) => ErrorScreen(
                  onRefresh: () {
                    context
                        .read<CartBloc>()
                        .add(GetAllSiderEvent(onSuccess: () {}));
                  },
                ),
            result: state.getAllSlider,
            empty: const EmptyScreen());
      },
    );
  }
}
