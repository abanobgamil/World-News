import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_news/layout/cubit/cubit.dart';
import 'package:world_news/layout/cubit/states.dart';
import 'package:world_news/shared/components/components.dart';

class GeneralNewsScreen extends StatelessWidget {
  const GeneralNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state)
      {
        var cubit = AppCubit.get(context);
        List generalList = cubit.general;

        return  RefreshIndicator(
            color: Colors.black,
            key:AppCubit.get(context).keyRefresh ,
            onRefresh: ()
            {
              generalList = [];
             return cubit.getGeneral();
            },
            child: articleBuilder(generalList)
        );
      },

    );
  }
}