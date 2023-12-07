import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mahfil_app/src/modules/trending_videos/models/trending_videos_model.dart';
import '../../../repository/repository.dart';
import '../../../utils/app_colors.dart';
import '../../../widgets/snackbar.dart';

var trendingVideosProvider =
    ChangeNotifierProvider.autoDispose((ref) => TrendingVideosController());

class TrendingVideosController extends ChangeNotifier {
  ServiceRepository repository = ServiceRepository();
  TrendingVideoModel? trendingVideoModel;
  var isLoading = false;
  var isBottomLoading = false;
  int pageNo = 1;
  int totalItem = 0;
  var scrollController = ScrollController();
  getTrendingVideos(context) async {
    if (pageNo == 1) {
      isLoading = true;
      isBottomLoading = false;
      notifyListeners();
    } else {
      isBottomLoading = true;
      isLoading = false;
      notifyListeners();
    }

    try {
      Response response = await repository.getTrendingVideos(pageNo);
      if (pageNo == 1) {
        isBottomLoading = false;
        isLoading = false;
        notifyListeners();
      } else {
        isBottomLoading = false;
        isLoading = false;
        notifyListeners();
      }

      if (response.statusCode == 200) {
        if (pageNo > 1) {
          for (var videoData in response.data['results']) {
            trendingVideoModel!.results!.add(VideoModel.fromJson(videoData));
          }
        } else {
          trendingVideoModel = TrendingVideoModel.fromJson(response.data);
          totalItem = trendingVideoModel!.total!;
        }
        pageNo++;
        notifyListeners();
      } else {
        Utils.customSnackBar(
            context: context,
            snackText: "Something went wrong!",
            snackBackgroundColor: AppColors.redColor,
            snackTextColor: AppColors.whiteColor);
      }
    } catch (e) {
      if (pageNo == 1) {
        isLoading = false;
        notifyListeners();
      } else {
        isBottomLoading = false;
        isLoading = false;
        notifyListeners();
      }
      if (context.mounted) {
        Utils.customSnackBar(
            context: context,
            snackText: e.toString(),
            snackBackgroundColor: AppColors.redColor,
            snackTextColor: AppColors.whiteColor);
      }
    }
  }
}
