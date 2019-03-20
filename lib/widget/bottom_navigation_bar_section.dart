import 'package:flutter/material.dart';

//底部navigation
class BottomNavigationBarSection extends StatefulWidget {
  final int index;
  final ValueChanged<int> onChanged;

//默认点击第index个
  const BottomNavigationBarSection(
      {Key key, this.index: 0, @required this.onChanged})
      : super(key: key);

  @override
  _BottomNavigationBarSectionState createState() =>
      _BottomNavigationBarSectionState();
}

class _BottomNavigationBarSectionState extends State<BottomNavigationBarSection>
    with AutomaticKeepAliveClientMixin {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.streetview),
            title: Text('体系'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            title: Text('公众号'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.navigation),
            title: Text('导航'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            title: Text('项目'),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onTapHandler,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.blue, //点击后颜色
      ),
    );
  }

  //是否保持页面状态
  @override
  bool get wantKeepAlive => true;

  //点击事件处理
  void _onTapHandler(int index) {
    setState(() {
      _currentIndex = index;
    });
    widget.onChanged(index);
  }
}
