import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/remote/response/status.dart';
import '../../../models/videosList/video_models.dart';
import '../../../view_model/home/video_list_view_model.dart';
import '../../widget/my_error_widget.dart';
import '../../widget/loading_widget.dart';
import '../../widget/home/video_tiles.dart';

class YoutubeListScreen extends StatefulWidget {
  const YoutubeListScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _YoutubeListScreenState();
}

class _YoutubeListScreenState extends State<YoutubeListScreen>
    with SingleTickerProviderStateMixin {
  final VideoListViewModel viewModel = VideoListViewModel();
  int activeIndex = 0;

  @override
  void initState() {
    viewModel.fetchMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<VideoListViewModel>(
      create: (BuildContext context) => viewModel,
      child: Consumer<VideoListViewModel>(builder: (context, viewModel, _) {
        switch (viewModel.videos.status) {
          case Status.loading:
            return const LoadingWidget();
          case Status.error:
            return MyErrorWidget(msg: viewModel.videos.message ?? "NA");
          case Status.completed:
            debugPrint('videos: ${viewModel.videos.data?.videos?.length}');
            return _buildBody(viewModel.videos.data?.videos ?? []);
          default:
        }
        return Container();
      }),
    );
  }

  Widget _buildBody(List<VideoModel> list) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF282828),
      ),
      child: ListView(
        children: [
          SizedBox(
            height: 45,
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 28,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(
                                Icons.explore_outlined,
                                color: Colors.white,
                              ),
                              Text(
                                "Explore",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    VerticalDivider(
                      thickness: 1,
                      indent: 2,
                      endIndent: 8,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    Column(
                      children: [
                        Row(
                          children: List.generate(
                            menus.length,
                            (index) => InkWell(
                              onTap: () {
                                setState(() {
                                  activeIndex = index;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Container(
                                  height: 28,
                                  decoration: BoxDecoration(
                                    color: activeIndex == index
                                        ? Colors.grey[200]
                                        : Colors.grey.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                      color: const Color(0xFFEEEEEE),
                                      width: 0.2,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 6,
                                      horizontal: 8,
                                    ),
                                    child: Text(
                                      menus[index],
                                      style: TextStyle(
                                        color: activeIndex == index
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          VideoTiles(
            list: list,
          ),
        ],
      ),
    );
  }
}
