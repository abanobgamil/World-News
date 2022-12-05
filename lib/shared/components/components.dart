import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';
import 'package:world_news/layout/cubit/cubit.dart';
import 'package:world_news/modules/web_view/web_view_screen.dart';

Widget articleBuilder(List list,{isSearch = false}) => list.isNotEmpty
    ? ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          if(list[index]['source']['name']=='Aljazeerh-alarabiya.com')
            {
              return const SizedBox();
            }
          return buildArticleItem(list[index], context) ;
        },
        separatorBuilder: (context, index) => myDivider(),
        itemCount: list.length,
      )
    : (isSearch ? Container()
    : ListView.separated(
      physics: NeverScrollableScrollPhysics() ,
      itemBuilder: (context, index) => buildArticleItemShimmer(context),
      separatorBuilder: (context, index) => myDivider(),
      itemCount: 5,
)
);

Widget buildArticleItemShimmer(context) =>  Padding(
  padding: const EdgeInsets.all(20.0),
  child: Column(
    children: [
      Row(
        children: [
          shimer(
            width: 100,
            height: 12,
            context: context
          ),
          const Spacer(),
          shimer(
            width: 115,
            height: 12,
            context: context
          ),
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        children: [
          Expanded(
            child:  shimer(
              height: 60,
              context: context
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      shimer(
        width: 300,
        height:200,
        context: context
      ),
      // const SizedBox(
      //   height: 5,
      // ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          shimer(
              height: 26,
              width: 25,
              context: context
          ),
        ],
      ),
    ],
  ),
);

Widget shimer({
  required double height,
   double ? width,
   required BuildContext context
})
{
  var baseColor = AppCubit.get(context).isDark ? Colors.grey[700]! : Colors.grey[300]!;
  var highlightColor= AppCubit.get(context).isDark ? Colors.grey[600]! : Colors.grey[200]!;

  return Shimmer.fromColors(
    baseColor:baseColor ,
    highlightColor:highlightColor ,
    child: Container(
      width: width,
      height: height,
      color: Colors.grey,
    ),
  );
}

Widget buildArticleItem(article, context) => InkWell(
      onTap: () {
        navigateTo(context, WebViewScreen(article['url']));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  // DateFormat.yMMMd().format(DateTime.parse('${article['publishedAt']}')),
                  Jiffy('${article['publishedAt']}').fromNow(),
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                Expanded(
                  child: Text(
                    AppCubit.get(context).getTitleSource(article),
                    style: TextStyle(
                      color: AppCubit.get(context).isDark ? Colors.white : Colors.black
                    ),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '${article['title']}',
                    style: GoogleFonts.tajawal(
                      textStyle: Theme.of(context).textTheme.bodyText1,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,

                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            Stack(
              children: [
                Container(
                  width: 300.0,
                  height: 200.0,
                  color: Colors.black12,
                ),
                getImage(article),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // InkWell(
                //   onTap: (){
                //     Share.share(
                //       article['url'],
                //     );
                //   },
                //   child: Icon(
                //     Icons.share,
                //     color: AppCubit.get(context).isDark ? Colors.white : Colors.black,
                //     size: 30,
                //   ),
                // ),
                IconButton(
                    onPressed: (){
                      Share.share(article['url']);
                    },
                    icon: Icon(
                        Icons.share,
                        size: 27 ,
                        color: AppCubit.get(context).isDark ? Colors.white : Colors.black,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                ),
              ],
            ),
          ],
        ),
      ),
    );

Widget getImage(dynamic article) {
  dynamic urlImage = article['urlToImage'];

  if (urlImage != null) {
    return Container(
      width: 300.0,
      height: 200.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        image: DecorationImage(
          image:CachedNetworkImageProvider(
                '${article['urlToImage']}',
          ) ,
          fit: BoxFit.cover,
        ),
      ),
    );
  } else {
    return Container(
      width: 300.0,
      height: 200.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        image: const DecorationImage(
          image: AssetImage('assets/images/image_not_found.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

Widget myDivider() => Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey[300],
    );

Widget buildCategory(
        {
        required String imageUrl,
        required String categoryName,
        required context,
        void Function()? onTap}) =>
        InkWell(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                // border: Border.all(
                //     color:AppCubit.get(context).isDark ? HexColor("373636") : Colors.white
                // ),
                color: AppCubit.get(context).isDark ? Colors.black26 : Colors.black12
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        categoryName,
                        style: Theme.of(context).textTheme.headline2,
                        textAlign: TextAlign.start,
                      ),
                      const Spacer(),
                      Image.asset(
                        imageUrl,
                        height: 60,
                        width: 60,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );

// InkWell(
// onTap: onTap,
// child: Container(
// width: double.infinity,
// height: 100,
// decoration: BoxDecoration(
// borderRadius: BorderRadiusDirectional.circular(15),
// border: Border.all(color: Colors.black),
// image: DecorationImage(
// image: AssetImage(
// imageUrl!,
// ),
// fit: BoxFit.cover,
// ),
// ),
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: Text(
// categoryName!,
// style: const TextStyle(
// fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
// textAlign: TextAlign.start,
// ),
// ),
// ),
// );
