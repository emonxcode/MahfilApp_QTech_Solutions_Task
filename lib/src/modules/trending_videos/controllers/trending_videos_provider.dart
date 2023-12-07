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
  getTrendingVideos(context) async {
    isLoading = true;
    notifyListeners();

    try {
      Response response = await repository.getTrendingVideos();
      isLoading = false;
      notifyListeners();

      if (response.statusCode == 200) {
        trendingVideoModel = TrendingVideoModel.fromJson(response.data);
        notifyListeners();
      } else {
        Utils.customSnackBar(
            context: context,
            snackText: "Something went wrong!",
            snackBackgroundColor: AppColors.redColor,
            snackTextColor: AppColors.whiteColor);
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
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
