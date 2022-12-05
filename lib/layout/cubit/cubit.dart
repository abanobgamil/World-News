import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:world_news/layout/cubit/states.dart';
import 'package:world_news/modules/category/category_screen.dart';
import 'package:world_news/modules/general_news/general_news_screen.dart';
import 'package:world_news/shared/components/strings_app.dart';
import 'package:world_news/shared/network/local/cache_helper.dart';
import 'package:world_news/shared/network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super (AppInitialState());

  static AppCubit get(context)=> BlocProvider.of(context);

  bool isDark = false;

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeModeState());
    } else
    {
      isDark = !isDark;
       CacheHelper.putData(key:'isDark', value: isDark).then((value)
       {
         emit(AppChangeModeState());
       }
       );
    }
  }




  int currentIndex=0;

  final keyRefresh =GlobalKey<RefreshIndicatorState>();

  List<Widget> screens = [
    const GeneralNewsScreen(),
    const CategoryScreen(),
  ];



  List<BottomNavigationBarItem> bottomItem = [
    const BottomNavigationBarItem(
      icon: Icon(
        FontAwesomeIcons.newspaper,
      ),
      label: "General News"

  ),
    const BottomNavigationBarItem(
      icon: Icon(
        FontAwesomeIcons.layerGroup
      ),
      label: "Category"

  ),
  ];



  void changeBottomNavBar(int index)
  {
    currentIndex =index;
    if(index==0)
    {
      if(general.isEmpty)
      {
        getGeneral();
      }
    }

    emit(AppBottomNavState());
  }


  void changeDropdownButton(String country)
  {
    selectedItem=country;
    emit(AppDropdownButtonState());
  }


  String getTitleSource (article)
  {
    String title = '${article['source']['name']}';
    int length = title.length;

    for(int i=length-1 ;i>=0 ;i--)
    {
      if(title[i]=='.')
      {
        title = title.substring(0,i);
        break;
      }
    }
    return title;
  }


  List<dynamic> general =[];

  Future<void> getGeneral(
      // {String countryAbbreviation = 'eg',}
    )
  async {
    emit(AppGetGeneralLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':countryAbbreviation,
        'category':generalCategory,
        'apiKey':apiKey,
      }).then((value)
    {
      general = value.data['articles'];
      emit(AppGetGeneralSuccessState());
    }).catchError((error)
    {
      emit(AppGetGeneralErrorState(error.toString()));
    });
  }



  List<dynamic> business =[];

  Future<void> getBusiness(
      // {String countryAbbreviation = 'eg',}
      )
  async {
    emit(AppGetBusinessLoadingState());


        DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country':countryAbbreviation,
            'category':businessCategory,
            'apiKey':apiKey,
          },).then((value)
        {
          business = value.data['articles'];
          emit(AppGetBusinessSuccessState());
        }).catchError((error)
        {
          emit(AppGetBusinessErrorState(error.toString()));
        });
  }



  List<dynamic> sports =[];

  Future<void> getSports(
      // {String countryAbbreviation = 'eg',}
    )
  async {
    emit(AppGetSportsLoadingState());

      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':countryAbbreviation,
          'category':sportCategory,
          'apiKey':apiKey,
        },).then((value)
      {
        sports = value.data['articles'];
        emit(AppGetSportsSuccessState());
      }).catchError((error)
      {
        emit(AppGetSportsErrorState(error.toString()));
      });

  }


  List<dynamic> science =[];

  Future<void> getScience(
      // {String countryAbbreviation = 'eg',}
  )
  async {
    emit(AppGetScienceLoadingState());

      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':countryAbbreviation,
          'category':scienceCategory,
          'apiKey':apiKey,
        },).then((value)
      {
        science = value.data['articles'];
        emit(AppGetScienceSuccessState());
      }).catchError((error)
      {
        emit(AppGetScienceErrorState(error.toString()));
      });

  }


  List<dynamic> health =[];

  Future<void> getHealth(
      // {String countryAbbreviation = 'eg',}
      )
  async {
    emit(AppGetHealthLoadingState());


      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':countryAbbreviation,
          'category':healthCategory,
          'apiKey':apiKey,
        },).then((value)
      {
        health = value.data['articles'];
        emit(AppGetHealthSuccessState());
      }).catchError((error)
      {
        emit(AppGetHealthErrorState(error.toString()));
      });
  }


  List<dynamic> technology =[];

  Future<void> getTechnology(
      // {countryAbbreviation ,}
      )
  async {
    emit(AppGetTechnologyLoadingState());


      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':countryAbbreviation,
          'category':technologyCategory,
          'apiKey':apiKey,
        },).then((value)
      {
        technology = value.data['articles'];
        emit(AppGetTechnologySuccessState());
      }).catchError((error)
      {
        emit(AppGetTechnologyErrorState(error.toString()));
      });
  }

  List<dynamic> search =[];

  void getSearch(String value)
  {
    emit(AppGetSearchLoadingState());

    search=[];

    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q':'$value',
        'apiKey':'$apiKey',
      },).then((value)
    {
      search = value.data['articles'];
      emit(AppGetSearchSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(AppGetSearchErrorState(error.toString()));
    });
  }




  String selectedItem = 'Egypt';

  List<String> items = [
    argentina,
    australia,
    austria,
    belgium,
    brazil,
    canada,
    egypt,
    france,
    germany,
    greece,
    hongKong,
    india,
    indonesia,
    italy,
    japan,
    korea,
    malaysia,
    mexico,
    morocco,
    netherlands,
    newZealand,
    nigeria,
    norway,
    philippines,
    poland,
    portugal,
    romania,
    russianFederation,
    singapore,
    southAfrica,
    sweden,
    switzerland,
    taiwan,
    thailand,
    turkey,
    ukraine,
    unitedArabEmirates,
    unitedStates,
  ];



  Map<String,String> countryData = {
    egypt : egyptAbbr,
    unitedArabEmirates : unitedArabEmiratesAbbr,
    argentina : argentinaAbbr,
    austria : austriaAbbr,
    australia : australiaAbbr,
    belgium : belgiumAbbr ,
    brazil : brazilAbbr ,
    canada : canadaAbbr ,
    switzerland : switzerlandAbbr,
    germany : germanyAbbr,
    france :franceAbbr,
    greece : greeceAbbr,
    hongKong : hongKongAbbr,
    indonesia : indonesiaAbbr,
    india : indiaAbbr ,
    italy : italyAbbr,
    japan : japanAbbr,
    korea : koreaAbbr,
    morocco : moroccoAbbr,
    mexico : mexicoAbbr,
    malaysia : malaysiaAbbr,
    nigeria : nigeriaAbbr,
    netherlands : netherlandsAbbr,
    norway : norwayAbbr,
    newZealand : newZealandAbbr,
    philippines : philippinesAbbr,
    poland : polandAbbr,
    portugal : portugalAbbr,
    romania : romaniaAbbr,
    russianFederation : russianFederation,
    sweden : swedenAbbr,
    singapore : singaporeAbbr,
    thailand : thailandAbbr,
    turkey : turkeyAbbr,
    taiwan : taiwanAbbr,
    ukraine : ukraineAbbr,
    unitedStates : unitedStatesAbbr,
    southAfrica : southAfricaAbbr

  };
   String countryAbbreviation = 'eg' ;
}