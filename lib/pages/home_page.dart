import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:university_list/service/http_service.dart';

import '../model/university_model.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  var logger = Logger();
  List<UniversityModel> lst = [];

  void getData() async {
    Map<String, String> mp = {"country": "United states"};
    String? response = await Network.GET(api: Network.API_GET, params: mp);
    logger.e(response);
    List<UniversityModel> universityList =
        Network.parsingResponse(response: response!);
    logger.i(universityList[0].name);
    lst = universityList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Home Page"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                getData();
              },
              icon: Icon(Icons.add)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: lst.length,
          itemBuilder: (ctx, index) {
            return universityContainer(index: index);
          },
        ),
      ),
    );
  }

  Widget universityContainer({required int index}) {
    return Container();
  }
}
