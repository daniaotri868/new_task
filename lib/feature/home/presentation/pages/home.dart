import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:remy/core/utils/extensions/build_context.dart';
import 'package:remy/feature/app/domin/repositories/prefs_repository.dart';
import '../../../../common/models/page_state/result_builder.dart';
import '../../../../core/config/routing/router.dart';
import '../../../../core/config/theme/colors_app.dart';
import '../../../app/presentation/pages/empty_screen.dart';
import '../../../app/presentation/pages/error_screen.dart';
import '../../../app/presentation/pages/loading_screen.dart';
import '../../../app/presentation/widgets/app_drop_down.dart';
import '../../data/models/get_all_country_model.dart';
import '../bloc_home/home_bloc.dart';
import '../bloc_home/home_event.dart';
import '../bloc_home/home_state.dart';
import '../widget/banner.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {

@override
  void initState() {
  print("object");
    // TODO: implement initState
    super.initState();
    context.read<CartBloc>().add(
        GetAllCountryEvent(onSuccess: () {

        })
    );
    context.read<CartBloc>().add(
        GetAllCountryEvent(onSuccess: () {  })
    );
  context.read<CartBloc>().add(GetAllSiderEvent(onSuccess: () {}));
  }
int x=0;

@override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
        backgroundColor: Colors.white,
        body: Padding(
          padding: REdgeInsetsDirectional.only(start: 14,end: 12),
          child: Column(
            children: [
             67.verticalSpace,
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return PageStateBuilder(
                      init: const SizedBox.shrink(),
                      success: (data) =>
                          AppDropDownMenu<CountryModel>(
                            title: "",
                            items: data,
                            hint: "اختر",
                            onChange: (value) {
                              context.read<CartBloc>().add(
                                  GetAllCityEvent(params: "${value.id}",onSuccess: () {

                                  },)
                              );
                            },
                          ),
                      loading: const LoadingScreen(),
                      error: (error) =>  ErrorScreen(
                        onRefresh: () {
                          context.read<CartBloc>().add(
                              GetAllCountryEvent(onSuccess: () {  })
                          );
                        },
                      ),
                      result: state.getAllCountry,
                      empty: const EmptyScreen());
                },
              ),
              30.verticalSpace,
              const BannerSlider(),
              20.verticalSpace,
              SizedBox(
                height: 50,
                child: TextFormField(

                  decoration: InputDecoration(
                    hintText:"بحث" ,
                    prefixIcon: Icon(Icons.search,color: Color(0xffF22D00)),
                    disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xffEAEBEC)
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xffEAEBEC)
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xffEAEBEC)
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                        color: Color(0xffEAEBEC)
                      ),
                    )
                  ),
                ),
              ),
              30.verticalSpace,
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return PageStateBuilder(
                      init: const SizedBox.shrink(),
                      success: (data) =>
                          SizedBox(
                            height: 34.h,
                            child: ListView.separated(
                              separatorBuilder: (context, index) => 5.horizontalSpace,
                              scrollDirection: Axis.horizontal,
                              itemBuilder:(context, index) => InkWell(
                                onTap: () {
                                  setState(() {
                                    x=index;
                                  });
                                  context.read<CartBloc>().add(
                                      GetAllCategoryEvent(params: "${data[index].id}", onSuccess: () {  })
                                  );
                                },
                                child: Container(
                                  width:99.w ,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: x==index?Color(0xffF22D00):Colors.white
                                  ),
                                  child: Center(child: Text(data[index].name,style: TextStyle(
                                    color:  x==index?Colors.white:Colors.black
                                  ),)),
                                ),
                              ),
                              itemCount: data.length,
                            ),
                          ),
                      loading: const LoadingScreen(),
                      error: (error) =>  ErrorScreen(
                        onRefresh: () {
                          context.read<CartBloc>().add(
                              GetAllCountryEvent(onSuccess: () {  })
                          );
                        },
                      ),
                      result: state.getCity,
                      empty: const EmptyScreen());
                },
              ),
              30.verticalSpace,
              Expanded(
                flex: 2,
                child: BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    return PageStateBuilder(
                        init: const SizedBox.shrink(),
                        success: (data) =>
                           GridView.builder(
                             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 10.w),
                             itemBuilder: (context, index) => Padding(
                               padding: REdgeInsetsDirectional.only(start: 3),
                               child: Container(
                                 height: 199.h,
                                 width: 185.w,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(20),
                                   color: Colors.white
                                 ),
                                 child: Column(
                                   children: [
                                     Container(
                                       height: 140.h,
                                       width: 157.w,
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(10)
                                       ),
                                       child: ClipRRect(
                                           borderRadius: BorderRadius.circular(10),
                                           child: Image.network('https://ofrlk.com/${data[index].image}',fit: BoxFit.cover,)),
                                     ),
                                     14.verticalSpace,
                                     Text(data[index].name)

                                   ],
                                 ),
                               ),
                             ),
                             itemCount: data.length,
                           ),
                        loading: const LoadingScreen(),
                        error: (error) =>  ErrorScreen(
                          onRefresh: () {
                            context.read<CartBloc>().add(
                                GetAllCountryEvent(onSuccess: () {  })
                            );
                          },
                        ),
                        result: state.getAllcategory,
                        empty: const EmptyScreen());
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(30.r),
              topEnd: Radius.circular(30.r)),
          child: BottomNavigationBar(
            elevation: 2,
            selectedItemColor: context.colorScheme.primary,
            items: [
              BottomNavigationBarItem(
                icon: Row(
          children: [
            130.horizontalSpace,
            Column(
              children: [
                Icon(Icons.home_filled,color: Color(0xffF22D00),size: 20),
                8.verticalSpace,
                const Text("رئيسية",style: TextStyle(
                    color: Color(0xffF22D00),
                    fontSize: 10
                ),)
              ],
            ),
            ],
          ),
                label: '',
                activeIcon: Row(
                  children: [
                    130.horizontalSpace,
                    Column(
                      children: [
                       Icon(Icons.home_filled,color: Color(0xffF22D00),size: 20),
                        8.verticalSpace,
                        const Text("رئيسية",style: TextStyle(
                          color: Color(0xffF22D00),
                          fontSize: 10
                        ),)
                      ],
                    ),
                  ],
                ),
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Icon(Icons.card_travel,size: 20),
                          8.verticalSpace,
                          const Text("مركز بيع البطاقة",style: TextStyle(
                            fontSize: 10
                          ),)
                        ],
                      ),
                      20.horizontalSpace,
                    ],
                  ),
                ),
                label: '',
                activeIcon: Column(
                  children: [
                    Icon(Icons.card_travel,color: Color(0xffF22D00),size: 20),
                    8.verticalSpace,
                    const Text("مركز بيع البطاقة",style: TextStyle(
                        color: Color(0xffF22D00),
                      fontSize: 10
                    ),)
                  ],
                ),
              ),
            ],
          ),
        ),

    );
  }
}
