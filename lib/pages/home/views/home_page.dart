import 'package:feather_icons/feather_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authorization/constants/colors/colors.dart';
import 'package:firebase_authorization/pages/home/data/models/news_model.dart';
import 'package:firebase_authorization/pages/home/data/repository/repositories.dart';
import 'package:firebase_authorization/pages/home/views/bloc/news_bloc.dart';
import 'package:firebase_authorization/pages/home/views/bloc/news_event.dart';
import 'package:firebase_authorization/pages/home/views/bloc/news_state.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/textstyles/textstyles.dart';
import '../../../constants/widgets/containers.dart';
import '../../../constants/widgets/textfields.dart';

class HomePage extends StatefulWidget {
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> selectedTopics = [];
  final user = FirebaseAuth.instance.currentUser!;
  List<dynamic> topicList = [];

  @override
  void initState() {
    super.initState();
    _fetchTopics();
  }

  void _fetchTopics() async {
    try {
      DataSnapshot dataSnapshot =
          await FirebaseDatabase.instance.ref('${user.uid}/topics/0').get();
      topicList = dataSnapshot.value as List<dynamic>;

      setState(() {
        selectedTopics = topicList.map((item) => item.toString()).toList();
      });
    } catch (e) {
      // Handle any errors that occur during the fetch.
      print('Error fetching topics: $e');
    }
  }

  bool _isSelected(String option) {
    return selectedTopics.contains(option);
  }

  void _toggleSelection(String option) {
    setState(() {
      if (_isSelected(option)) {
        selectedTopics.remove(option);
      } else {
        selectedTopics.add(option);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            NewsBloc(NewsRepository(selectedTopics: selectedTopics)),
        child: Scaffold(
            body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 30, top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Browse', style: Texts.title),
                const SizedBox(height: 10),
                Text('Discover things of this world', style: Texts.subtitle),
                const SizedBox(height: 10),
                SearchTextField(title: 'Search', icon: FeatherIcons.search),
                Center(
                  child: Wrap(
                    spacing: 1.0,
                    runSpacing: 1.0,
                    children: List<Widget>.generate(topicList.length, (index) {
                      final option = topicList[index];
                      return FilterChip(
                        disabledColor: AppColors.fill,
                        selectedColor: AppColors.main,
                        label: Text(option,
                            style: TextStyle(
                                color: _isSelected == true
                                    ? Colors.white
                                    : Colors.black)),
                        selected: _isSelected(option),
                        onSelected: (isSelected) {
                          _toggleSelection(option);
                        },
                      );
                    }),
                  ),
                ),
                blocBody()
              ],
            ),
          ),
        )));
  }

  Widget blocBody() {
    return BlocProvider(
        create: (context) => NewsBloc(
              NewsRepository(selectedTopics: selectedTopics),
            )..add(LoadNewsEvent()),
        child: BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
          if (state is NewsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
          if (state is NewsLoadedState) {
            List<ArticleModel> article = state.article;

            return SingleChildScrollView(
                child: Container(
                    height: 500,
                    child: ListView.builder(
                        itemCount: article.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              homeContainers(
                                  description: '${article[index].title}',
                                  route: 'informPage',
                                  context: context,
                                  image: '${article[index].urlToImage}'),
                              const SizedBox(height: 10),
                            ],
                          );
                        })));
          }
          if (state is NewsErrorState) {
            return const Center(child: Text('You have no data'));
          }
          return Container();
        }));
  }
}
