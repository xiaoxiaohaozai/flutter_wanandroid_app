import 'package:dio/dio.dart';
import 'package:flutter_wanandroid_ch/net/dio_manager.dart';
import 'package:flutter_wanandroid_ch/api/api.dart';
import 'package:flutter_wanandroid_ch/model/banner_model.dart';
import 'package:flutter_wanandroid_ch/model/article_model.dart';

//请求统一管理
class CommonServie {
  /// 获取轮播图
  void getBanner(Function callback) async {
    DioManager.singleton.dio.get(Api.HOME_BANNER).then((response) {
      callback(BannerModel.fromJson(response.data));
    });
  }

  /// 获得首页文章列表
  /// _page 第几页
  void getArticleList(int _page, Function callback) async {
    DioManager.singleton.dio
        .get(Api.HOME_ARTICLE_LIST + "$_page/json")
        .then((response) {
      callback(ArticleModel.fromJson(response.data));
    });
  }

  Options _getOptions() {
    Map<String, String> map = Map();
    return Options(headers: map);
  }
}
