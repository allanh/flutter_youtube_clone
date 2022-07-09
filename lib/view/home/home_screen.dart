import 'package:flutter/material.dart';
import 'package:flutter_youtube_clone/view/home/tab/youtube_list_screen.dart';
import '../../../utils/screen_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF282828),
        actions: [
          SizedBox(
              width: SizeConfig.screenWidth - 200,
              child: Row(
                children: const [
                  SizedBox(
                    width: 35,
                    child: Image(
                        image: AssetImage("assets/images/youtube_logo.png")),
                  ),
                  Text(
                    "YouTube",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ],
              )),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            width: SizeConfig.screenWidth - 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.cast),
                Icon(Icons.notifications),
                Icon(Icons.search),
                SizedBox(
                  height: 30,
                  width: 30,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          YoutubeListScreen(),
          YoutubeListScreen(),
          YoutubeListScreen(),
          YoutubeListScreen(),
          YoutubeListScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: Color(0xFF282828)),
        height: 50,
        child: TabBar(
          tabs: const [
            Tab(child: Icon(Icons.home_outlined)),
            Tab(child: Icon(Icons.explore_outlined)),
            Tab(child: Icon(Icons.add_circle_outline, size: 40)),
            Tab(child: Icon(Icons.subscriptions_outlined)),
            Tab(child: Icon(Icons.video_library_outlined)),
          ],
          controller: _tabController,
          indicatorColor: Colors.transparent,
        ),
      ),
    );
  }
}
