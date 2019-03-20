import 'package:flutter/material.dart';
import 'package:flutter_wanandroid_ch/global_config.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// 侧拉菜单
class DrawerSection extends StatefulWidget {
  @override
  _DrawerSectionState createState() => _DrawerSectionState();
}

class _DrawerSectionState extends State<DrawerSection> {
  String userName = "Ace";
  String accountEmail = "ace_haochen@163.com";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              "$userName",
              style: TextStyle(color: Colors.white),
            ),
            accountEmail: Text(
              "$accountEmail",
              style: TextStyle(color: Colors.white),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('images/avatar.jpg'),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(GlobalConfig.dark
                    ? 'images/bg_dark.jpg'
                    : 'images/bg_light.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.grey[800].withOpacity(0.6), BlendMode.hardLight),
              ),
            ),
          ),
          ListTile(
            title: Text(
              GlobalConfig.dark ? '日间模式' : '夜间模式',
              textAlign: TextAlign.left,
            ),
            leading: Icon(Icons.wb_sunny,
                color: GlobalConfig.themeData.accentColor, size: 22.0),
            onTap: () {
              setState(() {
                if (GlobalConfig.dark == true) {
                  GlobalConfig.dark = false;
                } else {
                  GlobalConfig.dark = true;
                }
              });
            },
          ),
          ListTile(
            title: Text(
              '常用网站',
              textAlign: TextAlign.left,
            ),
            leading: Icon(Icons.web,
                color: GlobalConfig.themeData.accentColor, size: 22.0),
            onTap: () {
              _showToast("功能暂未开放");
            },
          ),
          ListTile(
            title: Text(
              '设置',
              textAlign: TextAlign.left,
            ),
            leading: Icon(Icons.settings_applications,
                color: GlobalConfig.themeData.accentColor, size: 22.0),
            onTap: () {
              _showToast("功能暂未开放");
            },
          ),
          ListTile(
            title: Text(
              '关于App',
              textAlign: TextAlign.left,
            ),
            leading: Icon(Icons.people,
                color: GlobalConfig.themeData.accentColor, size: 22.0),
            onTap: () {
              Scaffold.of(context).openEndDrawer();
              _showToast("功能暂未开放");
            },
          ),
          const SizedBox(height: 24.0),
        ],
      ),
    );
  }

  /// 显示toast
  void _showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.black26,
        textColor: Colors.white,
        fontSize: 14.0);
  }
}
