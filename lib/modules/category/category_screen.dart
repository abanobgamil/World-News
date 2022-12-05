import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:world_news/layout/cubit/cubit.dart';
import 'package:world_news/layout/cubit/states.dart';
import 'package:world_news/modules/business/business_screen.dart';
import 'package:world_news/modules/health/health_screen.dart';
import 'package:world_news/modules/science/science_screen.dart';
import 'package:world_news/modules/sports/sports_screen.dart';
import 'package:world_news/modules/technology/technology_screen.dart';
import 'package:world_news/shared/components/components.dart';
import 'package:world_news/shared/components/strings_app.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                     Text(
                      "Country",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: AppCubit.get(context).isDark ? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                            value: cubit.selectedItem,
                            items: cubit.items.map((country) {
                              return DropdownMenuItem(
                                value: country,
                                child: Text(country),
                            );
                            }).toList(),
                            onChanged: (String ? country){
                              cubit.countryAbbreviation = cubit.countryData[country]!;
                             cubit.changeDropdownButton(country!);
                             // cubit.getGeneral(countryAbbreviation: cubit.countryAbbreviation);
                             // cubit.getBusiness(countryAbbreviation: cubit.countryAbbreviation);
                             // cubit.getSports(countryAbbreviation: cubit.countryAbbreviation);
                             // cubit.getHealth(countryAbbreviation: cubit.countryAbbreviation);
                             // cubit.getScience(countryAbbreviation: cubit.countryAbbreviation);
                             // cubit.getTechnology(countryAbbreviation: cubit.countryAbbreviation);
                              cubit.general=[];
                              cubit.business=[];
                              cubit.sports=[];
                              cubit.health=[];
                              cubit.technology=[];
                              cubit.science=[];
                        },
                          alignment: AlignmentDirectional.topStart,
                          style:  TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: AppCubit.get(context).isDark ? Colors.white : Colors.black,
                          ),
                          buttonPadding: const EdgeInsets.only(left: 14,right: 8),
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            // border: Border.all(
                            //   color: AppCubit.get(context).isDark ? HexColor("373636") :Colors.white,
                            // ),
                            color: AppCubit.get(context).isDark ? Colors.black26 : Colors.black12
                          ),
                          dropdownElevation: 8,
                          dropdownMaxHeight: 300,
                          itemHeight: 35,
                          itemPadding: const EdgeInsets.only(left: 10, right: 10),
                          scrollbarAlwaysShow: true,
                          scrollbarThickness: 6,
                          scrollbarRadius: const Radius.circular(40),
                          offset: const Offset(0,-4),
                          dropdownDecoration: BoxDecoration(
                            color: AppCubit.get(context).isDark ? HexColor("#373636") : Colors.white,
                          ),
                          selectedItemHighlightColor: AppCubit.get(context).isDark ? Colors.black26 : Colors.black12,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                buildCategory(
                  categoryName: 'Business',
                  imageUrl: AppCubit.get(context).isDark ? 'assets/images/business_light.png' : businessImage,
                  context: context,
                  onTap: () {
                    if(cubit.business.isEmpty)
                    {
                      cubit.getBusiness();
                    }
                     navigateTo(context, BusinessScreen());
                  }
                ),
                const SizedBox(
                  height: 10,
                ),
                buildCategory(
                  categoryName: 'Sports',
                  imageUrl: AppCubit.get(context).isDark ? 'assets/images/sports_light.png' :sportImage,
                    context: context,
                    onTap: () {
                    if(cubit.sports.isEmpty)
                      {
                        cubit.getSports();
                      }
                      navigateTo(context, SportsScreen());
                    }
                ),
                const SizedBox(
                  height: 10,
                ),
                buildCategory(
                  categoryName: 'Technology',
                  imageUrl:AppCubit.get(context).isDark ? 'assets/images/technology_light.png' : technologyImage,
                    context: context,
                    onTap: () {
                    if(cubit.technology.isEmpty)
                    {
                      cubit.getTechnology();
                    }
                      navigateTo(context, TechnologyScreen());
                    }
                ),
                const SizedBox(
                  height: 10,
                ),
                buildCategory(
                  categoryName: 'Science',
                  imageUrl:AppCubit.get(context).isDark ? 'assets/images/science_light.png' : scienceImage,
                    context: context,
                    onTap: () {
                    if(cubit.science.isEmpty)
                    {
                      cubit.getScience();
                    }
                      navigateTo(context, ScienceScreen());
                    }
                ),
                const SizedBox(
                  height: 10,
                ),
                buildCategory(
                  categoryName: 'Health',
                  imageUrl: AppCubit.get(context).isDark ? 'assets/images/health_light.png' :healthImage,
                    context: context,
                    onTap: () {
                    if(cubit.health.isEmpty)
                    {
                      cubit.getHealth();
                    }
                      navigateTo(context, HealthScreen());
                    }
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
