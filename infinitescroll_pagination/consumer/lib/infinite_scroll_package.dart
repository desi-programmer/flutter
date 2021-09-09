import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class InfiniteScrollPackage extends StatefulWidget {
  const InfiniteScrollPackage({Key? key}) : super(key: key);

  @override
  _InfiniteScrollPackageState createState() => _InfiniteScrollPackageState();
}

class _InfiniteScrollPackageState extends State<InfiniteScrollPackage> {
  int page = 1;

  final PagingController<int, dynamic> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((page) {
      fetchNewPage();
    });
    super.initState();
  }

  getDataFromApi() async {
    print("Getting More Data");
    var response = await http.get(
      Uri.parse(
        "http://10.0.2.2:800/api?page=$page",
      ),
    );
    if (response.statusCode == 200) {
      // return a decoded body
      var decodedData = jsonDecode(response.body);
      // data = decodedData['dataToSend'];
      print(decodedData['dataToSend']);
      return decodedData['dataToSend'];
      //
    } else {
      // server error
      return Future.error("Server Error !");
    }
  }

  Future<void> fetchNewPage() async {
    try {
      final newItems = await getDataFromApi();
      print(newItems);
      _pagingController.appendLastPage(newItems);
    } catch (e) {
      _pagingController.error = e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Get Data",
        ),
      ),
      //
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _pagingController.refresh();
          page = 1;
          fetchNewPage();
        },
        child: Icon(
          Icons.refresh,
        ),
      ),
      //
      body: PagedListView<int, dynamic>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<dynamic>(
            itemBuilder: (context, item, index) {
          return Column(
            children: [
              card(item[0], item[1]),
              if (index == _pagingController.itemList!.length - 1)
                Container(
                  padding: EdgeInsets.all(15.0),
                  child: Text("No More Data"),
                ),
            ],
          );
        }),
      ),
    );
  }

  Widget card(String name, String imageUrl) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(
        horizontal: 25.0,
        vertical: 25.0,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 25.0,
        vertical: 25.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          5.0,
        ),
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
      ),
      child: Column(
        children: [
          //
          Image.network(
            imageUrl,
            width: 64,
          ),
          //
          SizedBox(
            height: 12.0,
          ),
          //
          Text(
            name,
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}
