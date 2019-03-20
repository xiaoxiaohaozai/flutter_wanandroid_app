import 'package:flutter/material.dart';
import 'package:flutter_wanandroid_ch/ui/drawer_section.dart';
import 'package:flutter_wanandroid_ch/ui/home_page_ui.dart';
import 'package:flutter_wanandroid_ch/ui/navigation_page_ui.dart';
import 'package:flutter_wanandroid_ch/ui/project_tree_page_ui.dart';
import 'package:flutter_wanandroid_ch/ui/system_tree_ui.dart';
import 'package:flutter_wanandroid_ch/ui/wx_article_page_ui.dart';
import 'package:flutter_wanandroid_ch/widget/bottom_navigation_bar_section.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_wanandroid_ch/global_config.dart';
import 'package:flutter_wanandroid_ch/api/api.dart';

void main() async {
  bool themeIndex = await getTheme();
  runApp(MyApp(themeIndex));
}

//获取主题样式
Future<bool> getTheme() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  bool themeIndex = sp.getBool('themeIndex') ?? false; //返回null会报错
  GlobalConfig.dark = themeIndex;
  return themeIndex;
}

class MyApp extends StatefulWidget {
  final bool themeIndex;

  MyApp(this.themeIndex);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData themeData;

  @override
  void initState() {
    super.initState();
    themeData = GlobalConfig.getThemeData(widget.themeIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '玩Android',
      theme: themeData,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  var _titleList = ["首页", "体系", "公众号", "导航", "项目"];
  int _index = 0;
  List<Widget> _pageList;

  bool _showAppBar = true; //是否显示appbar
  bool _showDrawer = true; //控制侧拉菜单是否显示

  @override
  void initState() {
    super.initState();
    _pageList = [
      HomePageUI(),
      SystemTreeUI(),
      WxArticlePageUI(),
      NavigationPageUI(),
      ProjectTreePageUI(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: DefaultTabController(
          length: _pageList.length,
          child: Scaffold(
            appBar: _showAppBar ? _appBarWidget(context) : null,
            body: IndexedStack(
              //IndexedStack用于保存状态
              index: _index,
              children: _pageList,
            ),
            bottomNavigationBar: BottomNavigationBarSection(
              onChanged: _handleTabChanged,
              index: _index,
            ),
            drawer: _showDrawer ? DrawerSection() : null,
          ),
        ),
        onWillPop: _onWillPop);
  }

//点击返回 ??为空 返回false
  Future<bool> _onWillPop() {
    return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('提示'),
                content: Text('确认退出应用吗?'),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text('再看一会'),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Text('退出'),
                  ),
                ],
              );
            }) ??
        false;
  }

  Widget _appBarWidget(BuildContext context) {
    return AppBar(
      title: Text(_titleList[_index]),
      elevation: 0.4,
      actions: _actionsWidget(),
    );
  }

  List<Widget> _actionsWidget() {
    if (_showDrawer) {
      return [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            onSearchClick();
          },
        ),
      ];
    } else {
      return null;
    }
  }

//tab回调选中处理
  void _handleTabChanged(int index) {
    setState(() {
      _index = index;
      //appbar 显示控制
      if (_index == 0 || _index == 1 || _index == 3) {
        _showAppBar = true;
      } else {
        _showAppBar = false;
      }

      //drawer显示控制
      if (_index == 0) {
        _showDrawer = true;
      } else {
        _showDrawer = false;
      }
    });
  }

//搜索
  void onSearchClick() {}
}
