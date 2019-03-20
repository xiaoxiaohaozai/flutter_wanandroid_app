import 'package:flutter/material.dart';
import 'package:flutter_wanandroid_ch/api/common_service.dart';
import 'package:flutter_wanandroid_ch/model/banner_model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_wanandroid_ch/utils/route_utils.dart';

/// 首页轮播图
class BannerWidgetUI extends StatefulWidget {
  @override
  _BannerWidgetUIState createState() => _BannerWidgetUIState();
}

class _BannerWidgetUIState extends State<BannerWidgetUI> {
  List<BannerData> _bannerList = List();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Swiper(
        itemCount: _bannerList.length,
        autoplay: true,
        scrollDirection: Axis.horizontal,
        pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
              color: Colors.grey, activeColor: Colors.white),
        ),
        itemBuilder: (context, index) {
          if (_bannerList[index] == null ||
              _bannerList[index].imagePath == null) {
            return Container(
              color: Colors.grey[100],
            );
          } else {
            return buildItemImageWidget(context, index);
          }
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _bannerList.add(null); //不加这一个listview滚动后,swiper 有快速滚动的bug,目前不知道具体原因
    _getBanner();
  }

  /// 获取轮播图数据
  Future<Null> _getBanner() async {
    CommonServie().getBanner((BannerModel bannerModel) {
      if (bannerModel.data.length > 0) {
        setState(() {
          _bannerList = bannerModel.data;
        });
      }
    });
  }

  Widget buildItemImageWidget(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        RouteUtils.toWebView(
            context, _bannerList[index].title, _bannerList[index].url);
      },
      child: Image.network(
        _bannerList[index].imagePath,
        fit: BoxFit.fill,
      ),
    );
  }
}

///TODO 不知道有什么用
class RefreshSafeArea extends StatelessWidget {
  final Widget child;

  const RefreshSafeArea({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (ScrollNotification notification) {
        return true;
      },
      child: this.child,
    );
  }
}
