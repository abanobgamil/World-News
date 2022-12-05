import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_news/layout/cubit/cubit.dart';
import 'package:world_news/layout/cubit/states.dart';
import 'package:world_news/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        var searchList =AppCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(
            title: TextFormField(
                controller: searchController,
                keyboardType: TextInputType.text,
                onChanged: (value)
                {
                  AppCubit.get(context).getSearch(value);
                },

                validator: (String ? value)
                {
                  if(value!.isEmpty)
                  {
                    return "Search Must Not Be Empty";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: AppCubit.get(context).isDark ? Colors.white54 : Colors.grey,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none
                ),
                style: TextStyle(
                  color: AppCubit.get(context).isDark ? Colors.white : Colors.black,
                ),
                 autofocus: true,
            ),
            titleSpacing:0,
            elevation:0.5,
          ),
          body: Column(
            children:
            [
              Expanded(
                  child: articleBuilder(
                    searchList,
                    isSearch: true,
                  )
              ),
            ],
          ),

        );
      },
    );
  }
}
