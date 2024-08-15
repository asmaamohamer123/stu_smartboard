import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:photo_view/photo_view.dart';
// import 'package:photo_view/photo_view_gallery.dart';
import 'package:smartboard/core/resources/app_colors.dart';
import 'package:smartboard/screens/class/class_screen.dart';
import 'package:photo_view/photo_view.dart';
import 'package:smartboard/screens/login/new_login.dart';
import '../../core/constantd.dart';
import 'widgets/custom_card_news.dart';
import 'widgets/custom_class_item.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreens extends StatefulWidget {
    HomeScreens({super.key});

final _auth = FirebaseAuth.instance;

  late User signedinuser ;

  @override

  void initState()
  {
    //super.initState();
   getcurrentuser();
  }
   void getcurrentuser()
   {
     try{
       final user =_auth.currentUser;
    if(user != null)
     {
        signedinuser = user ;
        print(signedinuser.email);
     }
    }
    catch(e){
      print(e);
    }
  }


  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  Stream<QuerySnapshot<Map<String, dynamic>>>? newsCollection;
  Stream<QuerySnapshot<Map<String, dynamic>>>? materialsCollection;
  @override
  void initState() {
    newsCollection = FirebaseFirestore.instance.collection('news').snapshots();
    materialsCollection =
        FirebaseFirestore.instance.collection('materials').snapshots();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final List<NewsFeed> newsItem = [
    //   NewsFeed(
    //       pathImage: "assets/images/news1.jpg",
    //       text:
    //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "),
    //   NewsFeed(
    //       pathImage: "assets/images/news2.jpg",
    //       text:
    //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has"),
    //   NewsFeed(
    //       pathImage: "assets/images/news3.jpg",
    //       text:
    //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has")
    // ];
    // final List<String> className = [
    //   "fundamental of programming",
    //   "Object-oriented programming ",
    //   "Data Structures",
    //   "Algorithmes",
    //   "DataBase Administration",
    //   "Big Data",
    // ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "FCI",
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
            showLogoutDialog(context);
            },
          ),
        ],

        backgroundColor: AppColors.backGroundColorLightMode,
      ),
      body: CustomScrollView(
        slivers: [
          StreamBuilder<QuerySnapshot>(
              stream: newsCollection,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List news = snapshot.data!.docs;

                  return SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: SizedBox(
                        height: MediaQuery.sizeOf(context).height * .25,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: news.length,
                            itemBuilder: (context, index) {
                              return CustomCardNews(
                                path: news[index]['pathImage'],
                                text: news[index]['description'],
                              );
                            }),
                      ),
                    ),
                  );
                } else {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: SizedBox(
                        height: MediaQuery.sizeOf(context).height * .25,
                        child: Text(
                          "No Data",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: AppColors.colorGray),
                        ),
                      ),
                    ),
                  );
                }
              }),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "Materials",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: StreamBuilder<QuerySnapshot>(
                stream: materialsCollection,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List materials = snapshot.data!.docs[0]["materials"];

                    return AnimationLimiter(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(10),
                        itemCount: materials.length,
                        itemBuilder: (BuildContext context, int index) {
                          return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 800),
                              child: CustomClassItem(
                                  className: materials[index],
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return ClassPage(
                                        className: materials[index],
                                      );
                                    }));
                                  }));
                        },
                      ),
                    );
                  } else {
                    return Center(
                      child: SizedBox(
                        height: MediaQuery.sizeOf(context).height * .5,
                        child: Text(
                          "No Data",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: AppColors.colorGray),
                        ),
                      ),
                    );
                  }
                }),
          ),
          SliverToBoxAdapter(
            child: StreamBuilder<QuerySnapshot>(
                stream: materialsCollection,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    String scheduleImage =
                        snapshot.data!.docs[0]["scheduleImage"];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "Schedule",
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return Container(
                                    height:
                                        MediaQuery.of(context).size.height * .9,
                                    color: AppColors.backGroundColorLightMode,
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: IconButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            icon: const Icon(
                                              Icons.arrow_back,
                                              color:
                                                  AppColors.primaryColorLight,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: PhotoView(
                                            backgroundDecoration:
                                                const BoxDecoration(
                                              color: AppColors
                                                  .backGroundColorLightMode,
                                            ),
                                            imageProvider:
                                                NetworkImage(scheduleImage),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Image(
                              width: MediaQuery.of(context).size.width * 0.9,
                              image:
                                  const AssetImage("assets/images/image1.jpg"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    );
                  } else {
                    return Center(
                      child: SizedBox(
                        height: MediaQuery.sizeOf(context).height * .5,
                        child: Text(
                          "No Data",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: AppColors.colorGray),
                        ),
                      ),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('تسجيل خروج'),
        content: Text(' هل أنت متأكد أنك تريد تسجيل الخروج؟'),
        //Are you sure you want to logout?
        actions: [
          TextButton(
            child: Text('الغاء'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
          TextButton(
            child: Text('تسجيل خروج'),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pop(context);
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
