class UniversityModel {
  String alpha_two_code;
  List web_pages;
  String name;
  List domains;
  String country;
  String? stateProvince; // Make it nullable

  UniversityModel({
    required this.alpha_two_code,
    required this.web_pages,
    required this.name,
    required this.domains,
    required this.country,
    required this.stateProvince,
  });

  UniversityModel.fromJson(Map<String, dynamic> json)
      : alpha_two_code = json['alpha_two_code'],
        web_pages = json['web_pages'],
        name = json['name'],
        domains = json['domains'],
        country = json['country'],
        stateProvince = json['state-province'] ?? '';

  Map<String, dynamic> toJson() => {
    "alpha_two_code": alpha_two_code,
    'web_pages': web_pages,
    'name': name,
    'domains': domains,
    'country': country,
    'state-province': stateProvince,
  };
}
