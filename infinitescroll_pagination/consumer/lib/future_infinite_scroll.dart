import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FutureInfiniteScroll extends StatefulWidget {
  const FutureInfiniteScroll({Key? key}) : super(key: key);

  @override
  _FutureInfiniteScrollState createState() => _FutureInfiniteScrollState();
}

class _FutureInfiniteScrollState extends State<FutureInfiniteScroll> {
  List data = [];
  int page = 1;
  bool isLoading = true;
  bool hasMoreData = true;

  makeApiRequest() async {
    print("FETCHING DATA");
    var response = await http.get(
      Uri.parse(
        "http://10.0.2.2:8000/api?page=$page",
      ),
    );

    if (response.statusCode == 200) {
      final dataItems = jsonDecode(response.body);
      setState(() {
        data.addAll(dataItems['dataToSend']);
        isLoading = false;
      });
    } else {}
  }

  @override
  void initState() {
    super.initState();
    makeApiRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome",
        ),
      ),
      //
      //

      body: Column(
        children: [
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                print((scrollInfo.metrics.maxScrollExtent -
                        scrollInfo.metrics.pixels)
                    .round());
                if (!isLoading &&
                    (scrollInfo.metrics.maxScrollExtent -
                                scrollInfo.metrics.pixels)
                            .round() <=
                        200) {
                  page++;
                  makeApiRequest();
                  setState(() {
                    isLoading = true;
                  });
                }
                return true;
              },
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return card(
                    data[index][0],
                    data[index][1],
                  );
                },
              ),
            ),
          ),
          //
          Container(
            height: isLoading ? 50.0 : 0.0,
            child: CircularProgressIndicator(),
          ),
          Container(
            height: hasMoreData ? 50.0 : 0.0,
            child: Text("You have watched all the posts"),
          ),
        ],
      ),
    );
  }

  Widget card(String name, String imageUrl) {
    return Container(
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
