import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:movieverse/main.dart';
import 'package:movieverse/presentation/bloc/movie/discover/discover_movies_bloc.dart';
import 'package:movieverse/presentation/bloc/movie/trending/trending_movies_bloc.dart';
import 'package:movieverse/presentation/bloc/movie/upcoming/upcoming_movies_bloc.dart';
import 'package:movieverse/presentation/bloc/tv/discover/discover_tv_bloc.dart';
import 'package:movieverse/presentation/bloc/tv/on_the_air/on_the_air_tv_bloc.dart';
import 'package:movieverse/presentation/bloc/tv/trending/trending_tv_bloc.dart';
import 'package:movieverse/presentation/screens/search/search_screen.dart';
import 'package:movieverse/presentation/widgets/movie_card.dart';
import 'package:movieverse/presentation/widgets/navigation_drawer.dart';
import 'package:movieverse/presentation/widgets/tv_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  late TabController _secondTabController;
  late TabController _thirdTabController;

  @override
  void initState() {
    super.initState();
    Future.microtask(() => BlocProvider.of<TrendingMoviesBloc>(context)
      ..add(FetchTrendingMovies()));
    Future.microtask(
        () => BlocProvider.of<TrendingTvBloc>(context)..add(FetchTrendingTv()));
    Future.microtask(() => BlocProvider.of<DiscoverMoviesBloc>(context)
      ..add(FetchDiscoverMovies()));
    Future.microtask(
        () => BlocProvider.of<DiscoverTvBloc>(context)..add(FetchDiscoverTv()));
    Future.microtask(() => BlocProvider.of<UpcomingMoviesBloc>(context)
      ..add(FetchUpcomingMovies()));
    Future.microtask(
        () => BlocProvider.of<OnTheAirTvBloc>(context)..add(FetchOnTheAirTv()));
    _tabController = TabController(vsync: this, length: 2);
    _secondTabController = TabController(length: 2, vsync: this);
    _thirdTabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _secondTabController.dispose();
    _thirdTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationsDrawer(),
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                snap: true,
                pinned: true,
                floating: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        child: Image.asset(
                          "assets/images/banner.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.amber.withOpacity(0.4),
                        ),
                      ),
                      Positioned(
                          left: 9,
                          top: 140,
                          child: Text(
                              'Welcome.\nMiliion of Movied and Tv Shows to discover.\nExplore Now.',
                              style: $styles.text.bodyLarge)),
                    ],
                  ),
                ),
                expandedHeight: 277,
                bottom: AppBar(
                  title: SizedBox(
                    width: double.maxFinite,
                    height: 40,
                    child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SearchScreen()));
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              $styles.theme.primaryColor),
                          side: MaterialStatePropertyAll<BorderSide>(
                              BorderSide(color: $styles.theme.tertiaryColor)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.search,
                              color: $styles.theme.tertiaryColor,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Search for a movie or tv show...",
                              style: $styles.text.labelLarge,
                            ),
                          ],
                        )),
                  ),
                  backgroundColor: $styles.theme.primaryColor,
                  leading: Builder(builder: (context) {
                    return IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        ));
                  }),
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      Text(
                        'Trending',
                        style: $styles.text.headlineMedium,
                      ),
                      TabBar(
                        labelPadding: const EdgeInsets.only(left: 20),
                        controller: _tabController,
                        labelColor: $styles.theme.tertiaryColor,
                        unselectedLabelColor: $styles.theme.neutralColor,
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: $styles.theme.tertiaryColor,
                        labelStyle: $styles.text.labelLarge,
                        dividerColor: $styles.theme.primaryColor,
                        tabs: const [
                          Tab(
                            text: "Movie",
                          ),
                          Tab(
                            text: "Tv Series",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Gap($styles.insets.xs),
                SizedBox(
                  width: double.infinity,
                  height: 350,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
                          builder: (_, state) {
                        if (state is TrendingMoviesLoading) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.amber,
                            ),
                          );
                        } else if (state is TrendingMoviesHasData) {
                          return MovieCard(state.result);
                        } else {
                          return const Text('Something went wrong');
                        }
                      }),
                      BlocBuilder<TrendingTvBloc, TrendingTvState>(
                          builder: (_, state) {
                        if (state is TrendingTvLoading) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.amber,
                            ),
                          );
                        } else if (state is TrendingTvHasData) {
                          return TvCard(state.result);
                        } else {
                          return const Text('Something went wrong');
                        }
                      }),
                    ],
                  ),
                ),
                Gap($styles.insets.sm),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      Text(
                        'Discover',
                        style: $styles.text.headlineMedium,
                      ),
                      TabBar(
                        labelPadding: const EdgeInsets.only(left: 20),
                        controller: _thirdTabController,
                        labelColor: $styles.theme.tertiaryColor,
                        unselectedLabelColor: $styles.theme.neutralColor,
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: $styles.theme.tertiaryColor,
                        labelStyle: $styles.text.labelLarge,
                        dividerColor: $styles.theme.primaryColor,
                        tabs: const [
                          Tab(
                            text: "Movie",
                          ),
                          Tab(
                            text: "Tv Series",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Gap($styles.insets.xs),
                SizedBox(
                  width: double.infinity,
                  height: 350,
                  child: TabBarView(
                    controller: _thirdTabController,
                    children: [
                      BlocBuilder<DiscoverMoviesBloc, DiscoverMoviesState>(
                          builder: (_, state) {
                        if (state is DiscoverMoviesLoading) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.amber,
                            ),
                          );
                        } else if (state is DiscoverMoviesHasData) {
                          return MovieCard(state.result);
                        } else {
                          return const Text('Something went wrong');
                        }
                      }),
                      BlocBuilder<DiscoverTvBloc, DiscoverTvState>(
                          builder: (_, state) {
                        if (state is DiscoverTvLoading) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.amber,
                            ),
                          );
                        } else if (state is DiscoverTvHasData) {
                          return TvCard(state.result);
                        } else {
                          return const Text('Something went wrong');
                        }
                      }),
                    ],
                  ),
                ),
                Gap($styles.insets.sm),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      Text(
                        'Upcoming',
                        style: $styles.text.headlineMedium,
                      ),
                      TabBar(
                        labelPadding: const EdgeInsets.only(left: 20),
                        controller: _secondTabController,
                        labelColor: $styles.theme.tertiaryColor,
                        unselectedLabelColor: $styles.theme.neutralColor,
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: $styles.theme.tertiaryColor,
                        labelStyle: $styles.text.labelLarge,
                        dividerColor: $styles.theme.primaryColor,
                        tabs: const [
                          Tab(
                            text: "Movie",
                          ),
                          Tab(
                            text: "Tv Series",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Gap($styles.insets.xs),
                SizedBox(
                  width: double.infinity,
                  height: 350,
                  child: TabBarView(
                    controller: _secondTabController,
                    children: [
                      BlocBuilder<UpcomingMoviesBloc, UpcomingMoviesState>(
                          builder: (_, state) {
                        if (state is UpcomingMoviesLoading) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.amber,
                            ),
                          );
                        } else if (state is UpcomingMoviesHasData) {
                          return MovieCard(state.result);
                        } else {
                          return const Text('Something went wrong');
                        }
                      }),
                      BlocBuilder<OnTheAirTvBloc, OnTheAirTvState>(
                          builder: (_, state) {
                        if (state is OnTheAirTvLoading) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.amber,
                            ),
                          );
                        } else if (state is OnTheAirTvHasData) {
                          return TvCard(state.result);
                        } else {
                          return const Text('Something went wrong');
                        }
                      }),
                    ],
                  ),
                ),
                Gap($styles.insets.sm)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
