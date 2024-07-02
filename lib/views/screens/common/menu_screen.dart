import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => MenuScreenState();
}

class MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    super.initState();
    readlocalJson();
  }

  dynamic local;
  List _items = [], _items1 = [];
  var subMenuScreen = '',
      URL_PATH = '',
      jsonFile = '',
      data_source = '',
      g1 = '',
      g2 = '';
  int gradient1 = 0, gradient2 = 0;
  // Fetch content from the json file
  Future<void> readlocalJson() async {
    final String response1 =
        await rootBundle.loadString('assets/json/data.json');
    final data1 = await json.decode(response1);
    print('inside readlocalJson:$data1');
    setState(() {
      local = data1['sdp']['response'];
      // _items = data1["sdp"];
      /*_items2=data1["SubMenuScreen"];
      g1=_items1[0]["gradient_color1"];
      g2=_items1[0]["gradient_color2"];*/
    });

    print('local:$local');

    /* print("gradient color");
    print(g1);
    print(g2);
    gradient1=int.parse(g1);
    gradient2=int.parse(g2);*/
  }

  Future<void> readJson() async {
    final String response1 =
        await rootBundle.loadString('assets/json/config.json');
    final data1 = await json.decode(response1);
    setState(() {
      _items1 = data1['splashscreen'];
      _items = data1['MenuScreenScreen'];
      g1 = _items1[0]['gradient_color1'];
      g2 = _items1[0]['gradient_color2'];
    });
    print(_items1);
    print('gradient color');
    print(g1);
    print(g2);
    gradient1 = int.parse(g1);
    gradient2 = int.parse(g2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_items1.isNotEmpty ? _items1[0]['App_Name'] : ''),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(gradient1),
                    Color(gradient2),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: const [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              // Display the data loaded from my_json.json
              _items.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: _items.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 8,
                            shadowColor: Colors.blue,
                            margin: EdgeInsets.all(10),
                            child: ListTile(
                              // leading: Text(_items[index]["Department_Code"]),
                              title: Text(_items[index]['MenuScreenName']),
                              onTap: () {
                                subMenuScreen =
                                    _items[index]['SubMenuScreenType'];
                                switch (subMenuScreen) {
                                  case 'DataTable':
                                    // URL_PATH=_items2[index]["URL_Path"];
                                    // jsonFile=_items2[index]["JsonFile"];
                                    // data_source=_items1.isNotEmpty ? _items1[0]["DataSource"] : "";
                                    // print(data_source);
                                    // print(URL_PATH);
                                    // print(jsonFile);
                                    // if(data_source == "local")  {
                                    //   print("ifPart");
                                    //   Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(builder: (context) =>
                                    //         datatable1(_items[index]["MenuScreenId"])),
                                    //   );
                                    // }
                                    // else if(data_source == "online"){
                                    //   print("elseifPart");
                                    //   Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(builder: (context) =>
                                    //         MyApp(_items[index]["MenuScreenId"]),
                                    //     ));
                                    // }
                                    // else{
                                    //   print("DataSource Not Available");
                                    // }
                                    break;
                                  case 'JsonTable':
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(builder: (context)=>final_MenuScreen(_items[index]["MenuScreenId"])),
                                    // );
                                    break;
                                  case 'Google Map':
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) => mapscreen1(
                                    //           _items[index]['MenuScreenId'])),
                                    // );
                                    break;
                                  case 'OSM':
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(builder: (context)=>MyHomePage(_items[index]["MenuScreenId"])),
                                    // );
                                    break;
                                  case 'PieChart':
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(builder: (context)=>pie_chart(_items[index]["MenuScreenId"])),
                                    // );
                                    break;
                                  case 'BarChart':
                                    data_source = _items1.isNotEmpty
                                        ? _items1[0]['DataSource']
                                        : '';
                                    print(data_source);
                                    // print(URL_PATH);
                                    // print(jsonFile);
                                    if (data_source == 'local') {
                                      print('ifPart');
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(builder: (context)=>barchart(_items[index]["MenuScreenId"])),
                                      // );
                                    } else if (data_source == 'online') {
                                      print('elseifPart');
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(builder: (context) =>
                                      //         barchartJson(_items[index]["MenuScreenId"]),
                                      //     ));
                                    } else {
                                      print('DataSource Not Available');
                                    }
                                    break;
                                  case 'PhotoGallery':
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(builder: (context)=>singlephotogallery(_items[index]["MenuScreenId"])),
                                    // );
                                    break;
                                  case 'GridPhotoGallery':
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(builder: (context)=>gridphotogallery(_items[index]["MenuScreenId"])),
                                    // );
                                    break;
                                }
                              },
                            ),
                          );
                        },
                      ),
                    )
                  : Container()
            ],
          ),
        ));
  }
}
