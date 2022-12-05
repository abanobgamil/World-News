import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_news/layout/cubit/cubit.dart';
import 'package:world_news/layout/cubit/states.dart';
import 'package:world_news/modules/search/search_screen.dart';
import 'package:world_news/shared/components/components.dart';

class BusinessScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Business",
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),

        ),
        actions: [
          IconButton(
            onPressed: () {
              navigateTo(context, SearchScreen());
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              AppCubit.get(context).changeAppMode();
            },
            icon: AppCubit.get(context).isDark
                ? Icon(
              Icons.light_mode,
            )
                : Icon(
              Icons.mode_night,
            ),
          ),
        ],
      ),
      body: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state)
        {
          var cubit = AppCubit.get(context);
          List businessList = cubit.business;

          return  RefreshIndicator(
              color: Colors.black,
              key:AppCubit.get(context).keyRefresh ,
              onRefresh: ()
              {
                businessList = [];
                return cubit.getBusiness();
              },
              child: articleBuilder(businessList)
          );
        },
      ),
    );
  }

}
