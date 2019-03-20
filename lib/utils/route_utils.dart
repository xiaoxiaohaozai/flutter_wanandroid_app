import 'package:flutter/material.dart';
import 'package:flutter_wanandroid_ch/ui/webview_page_ui.dart';

/// 路由工具类
class RouteUtils {
  /// 跳转webview
  static void toWebView(BuildContext context, String title, String link) async {
    await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return WebViewPageUI(title: title, url: link);
    }));
  }
}
