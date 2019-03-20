class Api {
  static const BASE_URL = "http://www.wanandroid.com/";

  //首页轮播图
  static const HOME_BANNER = BASE_URL + "banner/json";

  //首页文章列表
  static const String HOME_ARTICLE_LIST = BASE_URL + "article/list/";

  // 知识体系
  static const String SYSTEM_TREE = BASE_URL + "tree/json";

  // 知识体系详情
  static const String SYSTEM_TREE_CONTENT = BASE_URL + "article/list/";

  // 公众号名称
  static const String WX_LIST = BASE_URL + "wxarticle/chapters/json";

  // 公众号文章
  static const String WX_ARTICLE_LIST = BASE_URL + "wxarticle/list/";

  // 导航列表数据
  static const String NAVI_LIST = BASE_URL + "navi/json";

  // 项目分类
  static const String PROJECT_TREE = BASE_URL + "project/tree/json";

  // 项目列表
  static const String PROJECT_LIST = BASE_URL + "project/list/";

  // 搜索热词
  static const String SEARCH_HOT_WORD = BASE_URL + "/hotkey/json";

  // 搜索结果
  static const String SEARCH_RESULT = BASE_URL + "article/query/";

  // 用户登录
  static const String USER_LOGIN = BASE_URL + "user/login";

  // 用户注册
  static const String USER_REGISTER = BASE_URL + "user/register";

  // 收藏列表
  static const String COLLECTION_LIST = BASE_URL + "lg/collect/list/";

  // 我的收藏-取消收藏
  static const String CANCEL_COLLECTION = BASE_URL + "lg/uncollect/";

  // 我的收藏-新增收藏
  static const String ADD_COLLECTION = BASE_URL + "lg/collect/add/json";

  // 网站收藏
  static const String WEBSITE_COLLECTION_LIST =
      BASE_URL + "lg/collect/usertools/json";

  // 取消网站收藏
  static const String CANCEL_WEBSITE_COLLECTION =
      BASE_URL + "lg/collect/deletetool/json";

  // 新增网站收藏
  static const String ADD_WEBSITE_COLLECTION =
      BASE_URL + "lg/collect/addtool/json";

  // 编辑网站收藏
  static const String EDIT_WEBSITE_COLLECTION =
      BASE_URL + "lg/collect/updatetool/json";

  // todo列表数据
  static const String TODO_LIST = BASE_URL + "lg/todo/list/";

  // 新增todo数据
  static const String ADD_TODO = BASE_URL + "lg/todo/add/json";

  // 更新todo数据
  static const String UPDATE_TODO = BASE_URL + "lg/todo/update/";

  // 删除todo数据
  static const String DELETE_TODO = BASE_URL + "lg/todo/delete/";

  // 仅更新todo完成状态
  static const String DONE_TODO = BASE_URL + "lg/todo/done/";
}
