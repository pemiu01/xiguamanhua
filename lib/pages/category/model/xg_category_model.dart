class XGCategoryModel {
		int tagId;
		String title;
		String cover;
		
		XGCategoryModel({this.tagId, this.title, this.cover});
		
		XGCategoryModel.fromJson(Map<String, dynamic> json) {
				tagId = json['tag_id'];
				title = json['title'];
				cover = json['cover'];
		}
		
		Map<String, dynamic> toJson() {
				final Map<String, dynamic> data = new Map<String, dynamic>();
				data['tag_id'] = this.tagId;
				data['title'] = this.title;
				data['cover'] = this.cover;
				return data;
		}
}