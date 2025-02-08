import 'dart:async';

import 'package:clean_architecture_movie_app/core/constant/strings.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constant/route_names.dart';
import '../../../../core/constant/styles.dart';

import '../../../../core/presentation/widgets/list_horizontal_card_widget.dart';
import '../bloc/movie/movie_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/enum.dart';
import '../widgets/movie_page_main_view_widget.dart';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/utils/helper.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  TextEditingController searchController = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'MovieRay',
            style: Styles.textStyle(
              size: 26,
              weight: FontWeight.bold,
              color: Helper.isDark(context)
                  ? AppColors.textColorDark
                  : AppColors.textColorLight,
            ),
          ),
        ),
        body: _bodyWidget(context),
      ),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      // check if user want to go back after using search feature
      onWillPop: () => _detectBackButton(searchController, context),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0).copyWith(bottom: 0),
          child: SingleChildScrollView(
            child: BlocBuilder<MovieBloc, MovieState>(
              builder: (context, state) {
                switch (state.allMoviesByQueryStatus) {
                  case BlocStates.initial:
                    return Column(
                      children: [
                        _searchBar(context, state),
                        const SizedBox(
                          height: 10,
                        ),
                        const MoviePageMainViewWidget(),
                      ],
                    );

                  case BlocStates.loading:
                    return Column(
                      children: [
                        _searchBar(context, state),
                        const SizedBox(
                          height: 10,
                        ),
                        const Center(
                          child: LinearProgressIndicator(),
                        ),
                      ],
                    );
                  case BlocStates.success:
                    return Column(
                      children: [
                        _searchBar(context, state),
                        const SizedBox(
                          height: 10,
                        ),
                        _searchResult(context, state),
                      ],
                    );
                  case BlocStates.error:
                    return Center(
                      child: Text(state.allMoviesByQueryFailure),
                    );
                  default:
                    return const SizedBox();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _searchBar(BuildContext context, MovieState state) {
    return Stack(
      children: [
        TextField(
          controller: searchController,
          onChanged: (String? value) => _searchOnChangeFunction(context, value),
          onSubmitted: (value) {
            if (value == '') {
              Helper.showSnackBar(context, Strings.searchFiledCannotBeEmpty);
            }
          },
          decoration: InputDecoration(
            prefixIcon: const Icon(Iconsax.search_normal),
            suffixIcon: state.isSearchBarFocus
                ? IconButton(
                    onPressed: () {
                      _clearSearchView(searchController, context);
                    },
                    icon: const Icon(Iconsax.close_circle),
                  )
                : const SizedBox(),
            fillColor: Colors.transparent,
            hintText: 'Search Movie',
            contentPadding: const EdgeInsets.all(20),
            border: Styles.outlineBoxDecoration(AppColors.greyColor),
            enabledBorder: Styles.outlineBoxDecoration(AppColors.greyColor),
            focusedBorder:
                Styles.outlineBoxDecoration(AppColors.mediumDarkGreyColor),
          ),
        ),
      ],
    );
  }

  void _searchOnChangeFunction(BuildContext context, String? value) {
    // cancel timer
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    // start new timer
    _debounce = Timer(
      const Duration(milliseconds: 500),
      () {
        if (value == '' || value == null) {
          _clearSearchView(searchController, context);
        } else {
          _getResultThroughSearchQuery(value, context);
        }
      },
    );
  }
}

void _getResultThroughSearchQuery(
  String value,
  BuildContext context,
) {
  context.read<MovieBloc>().add(const SearchBarFocusEvent(isFocus: true));
  context.read<MovieBloc>().add(GetMoviesByQueryEvent(query: value));
}

void _clearSearchView(
  TextEditingController searchController,
  BuildContext context,
) {
  searchController.clear();
  context.read<MovieBloc>().add(const SearchBarFocusEvent(isFocus: false));
  FocusScope.of(context).unfocus();
}

Widget _searchResult(BuildContext context, MovieState state) {
  return SizedBox(
    height: Helper.screeHeight(context) * 0.71,
    child: state.allMoviesByQuery.isEmpty
        ? const Center(
            child: Text(Strings.searchMovieNotFound),
          )
        : ListView.builder(
            itemCount: state.allMoviesByQuery.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.goNamed(
                    RouteNames.movieDetailsPageName,
                    queryParameters: {
                      'movieId': state.allMoviesByQuery[index].id.toString(),
                    },
                  );
                },
                child: ListHorizontalCardWidget(
                  movie: state.allMoviesByQuery[index],
                ),
              );
            },
          ),
  );
}

Future<bool> _detectBackButton(
  TextEditingController searchController,
  BuildContext context,
) async {
  bool shouldCloseApp = false;
  if (searchController.text.isNotEmpty) {
    _clearSearchView(searchController, context);
    shouldCloseApp = false;
  } else {
    shouldCloseApp = true;
  }
  return shouldCloseApp;
}
