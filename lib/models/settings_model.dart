class Settings {
  int? id;
  String? settingName;
  bool? settingValue;

  Settings({this.id, this.settingName, this.settingValue});

  Settings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    settingName = json['setting_name'];
    settingValue = json['setting_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['setting_name'] = this.settingName;
    data['setting_value'] = this.settingValue;
    return data;
  }
}