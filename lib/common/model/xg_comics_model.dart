import 'package:html/dom.dart';

class XGComicsModel {
  int comicsId = 0; // 漫画id
  String comicsName = ''; // 漫画名
  String authors = '';
  String comicsProfile = ''; // 漫画子标题
  String comicsCover = ''; // 漫画封面图
  int comicsSort = 0; // 漫画排名
  int comicsType = 0; // 漫画类型
  String comicsTypes = ''; // 漫画类型
  String comicsStatus = ''; // 漫画状态
  String comicsUrl = ''; // 漫画站外链接
  String comicsDetailUrl = ''; // 漫画详情链接
  String lastName = ''; // 最近更新
  Map<String, String> headers = {}; // 图片请求头设置

  XGComicsModel({
    this.comicsId,
    this.comicsName,
    this.comicsProfile,
    this.comicsCover,
    this.comicsSort,
    this.comicsType,
    this.comicsStatus,
    this.comicsUrl,
    this.comicsDetailUrl,
    this.lastName,
    this.headers,
  });

  XGComicsModel.fromJson(Map<String, dynamic> json) {
    comicsId = json['obj_id'] == null ? json['id'] : json['obj_id'];
    comicsName = json['title'] == null ? '' : json['title'];
    comicsProfile = json['sub_title'] == null ? '' : json['sub_title'];
    comicsCover = json['cover'] == null ? '' : json['cover'];
    comicsType = json['type'] == null ? 0 : json['type'];
    comicsTypes = json['types'] == null ? '' : json['types'];
    comicsUrl = json['url'] == null ? '' : json['url'];
    comicsStatus = json['status'].toString() == null ? '' : json['status'].toString();
    lastName = json['last_name'] == null ? '' : json['last_name'];
    authors = json['authors'] == null ? '' : json['authors'];
  }

  XGComicsModel.fromSql(Map<String, dynamic> json) {
    this.comicsId = json['columnId'] == null ? 0 : json['columnId'];
    this.comicsName = json['comicsName'] == null ? '' : json['comicsName'];
    this.comicsProfile = json['comicsProfile'] == null ? '' : json['comicsProfile'];
    this.comicsCover = json['comicsCover'] == null ? '' : json['comicsCover'];
    this.comicsType = json['comicsType'] == null ? 0 : json['comicsType'];
    this.comicsTypes = json['comicsTypes'] == null? '' : json['comicsTypes'];
    this.comicsUrl = json['comicsUrl'] == null ? '': json['comicsUrl'];
    this.comicsStatus = json['comicsStatus'] == null ? '' : json['comicsStatus'];
    this.lastName = json['lastName'] == null ? '' : json['lastName'];
    this.authors = json['authors'] == null ? '' : json['authors'];
  }

  // 获取每个漫画的具体信息
  XGComicsModel.fromElement(Element element) {
    final detailList = element.getElementsByTagName('a');
    for (var detail in detailList) {
      comicsDetailUrl = detail.attributes['href'];
      // print('zxd-log: comicsDetailUrl >>>>> $comicsDetailUrl');

      final imageList = detail.getElementsByTagName('mip-img');
      for (var image in imageList) {
        comicsCover = image.attributes['src'];
        // print('zxd-log: comicsCover >>>>> $comicsCover');
        break;
      }

      final comicsPList = detail.getElementsByTagName('p');
      for (var comicsP in comicsPList) {
        if (comicsP.className == 'manga-title') {
          comicsName = comicsP.text;
          // print('zxd-log: comicsName >>>>>> $comicsName');
        } else {
          comicsProfile = comicsP.text;
          // print('zxd-log: comicsProfile >>>>>> $comicsProfile');
        }
      }
    }

    headers = {
      'Accept': 'image/png,image/svg+xml,image/*;q=0.8,video/*;q=0.8,*/*;q=0.5',
      'Pragma': 'no-cache',
      'Cache-Control': ' no-cache',
      'Host': 'c.nationaltcm.com',
      'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Safari/605.1.15',
      'Accept-Language': 'zh-cn',
      'Referer': 'https://m.happymh.com/',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
    };

    // headers = {
    //   'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Safari/605.1.15',
    //   'Pragma': 'no-cache',
    //   'Host': 'm-happymh-com.mipcdn.com',
    //   'Connection': 'keep-alive',
    //   'Cache-Control': 'no-cache',
    //   'Accept-Language': 'zh-cn',
    //   'Accept-Encoding': 'gzip, deflate, br',
    //   'Accept': 'image/png,image/svg+xml,image/*;q=0.8,video/*;q=0.8,*/*;q=0.5',
    // };
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = Map<String, dynamic>();
    json['columnId'] = this.comicsId;
    json['comicsName'] = this.comicsName;
    json['comicsProfile'] = this.comicsProfile;
    json['comicsCover'] = this.comicsCover;
    json['comicsType'] = this.comicsType;
    json['comicsTypes'] = this.comicsTypes;
    json['comicsUrl'] = this.comicsUrl;
    json['comicsStatus'] = this.comicsStatus;
    json['lastName'] = this.lastName;
    json['authors'] = this.authors;
    return json;
  }

  @override
  String toString() {
    return 'XGComicsModel{comicsId: $comicsId, comicsName: $comicsName, authors: $authors, comicsProfile: $comicsProfile, comicsCover: $comicsCover, comicsSort: $comicsSort, comicsType: $comicsType, comicsTypes: $comicsTypes, comicsStatus: $comicsStatus, comicsUrl: $comicsUrl, comicsDetailUrl: $comicsDetailUrl, lastName: $lastName, headers: $headers}';
  }
}
