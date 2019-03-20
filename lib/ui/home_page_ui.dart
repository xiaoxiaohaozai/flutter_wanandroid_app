import 'package:flutter/material.dart';
import 'package:flutter_wanandroid_ch/api/common_service.dart';
import 'package:flutter_wanandroid_ch/model/article_model.dart';
import 'package:flutter_wanandroid_ch/widget/banner_widget_ui.dart';
import 'package:flutter_wanandroid_ch/utils/route_utils.dart';

//首页容器
class HomePageUI extends StatefulWidget {
  @override
  _HomePageUIState createState() => _HomePageUIState();
}

class _HomePageUIState extends State<HomePageUI>
    with AutomaticKeepAliveClientMixin {
  ScrollController _scrollController = ScrollController();
  List<Datas> _articleList = List();
  int _page = 0; //加载页数
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RefreshIndicator(
          child: ListView.separated(
            controller: _scrollController,
            //分割线的listview
            itemBuilder: _renderRow,
            separatorBuilder: (context, index) {
              //分割线
              return Container(
                height: 0.5,
                color: Colors.black26,
              );
            },
            itemCount: _articleList.length + 2,
          ),
          onRefresh: getData),
    );
  }

  @override
  void initState() {
    super.initState();
    //上拉加载更多
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // print("底部了");
        getMore();
      }
    });
    getData();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  ///获取数据
  Future<Null> getData() async {
    _page = 0;
    print("重新加载$_page");
    CommonServie().getArticleList(_page, (ArticleModel _articleModel) {
      setState(() {
        _articleList = _articleModel.data.datas;
      });
    });
  }

  ///加载更多
  Future<Null> getMore() async {
    _page++;
    print("加载更多$_page");
    CommonServie().getArticleList(_page, (ArticleModel _articleModel) {
      setState(() {
        _articleList.addAll(_articleModel.data.datas);
      });
    });
  }

  /// 渲染item
  Widget _renderRow(BuildContext context, int index) {
    //加载轮播图
    if (index == 0) {
      return Container(
        height: 200,
        child: BannerWidgetUI(),
      );
    }
    //加载文章内容
    if (index - 1 < _articleList.length) {
      return InkWell(
        onTap: () {
//          //TODO 加载webview
          RouteUtils.toWebView(context, _articleList[index - 1].title,
              _articleList[index - 1].link);
        print("点击");
        },
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                children: <Widget>[
                  Text(
                    _articleList[index - 1].author,
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.left,
                  ),
                  Expanded(
                    //TODO Expanded 需要放在flex中
                    child: Text(
                      _articleList[index - 1].niceDate,
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    //TODO 避免水平方向过度绘制?
                    child: Text(
                      _articleList[index - 1].title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: Row(
                  children: <Widget>[
                    Text(
                      _articleList[index - 1].superChapterName,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    )
                  ],
                )),
          ],
        ),
      );
    }
    //加载底部
    return _getMoreWidget();
  }

  /// 加载更多
  Widget _getMoreWidget() {
    return Container(
      padding: EdgeInsets.all(16),
      alignment: Alignment.center,
      child: SizedBox(
        width: 24,
        height: 24,
        child: CircularProgressIndicator(
          strokeWidth: 2,
        ),
      ),
    );
  }
}
