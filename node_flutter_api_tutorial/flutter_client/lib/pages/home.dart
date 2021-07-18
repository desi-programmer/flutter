import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool frontend = false;
  bool backend = false;
  bool devops = false;

  Future<bool>? loaded;
  List data = [];
  List filteredData = [];

  @override
  void initState() {
    loaded = getData();
    super.initState();
  }

  Future<bool> getData() async {
    try {
      print("+++ MAKING API CALL =======");
      var response = await http.get(Uri.parse("http://10.0.2.2:8000"));
      var decodedData = jsonDecode(response.body);
      data = decodedData['data'];
      filteredData = decodedData['data'];
      return true;
    } catch (SocketException) {
      return Future.error("Error Connecting to server !");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text(
          "Node JS PEOPLE API",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.purple,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addUser,
        child: Icon(
          Icons.person_add,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            8.0,
          ),
        ),
      ),
      //
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      //
      body: FutureBuilder<bool>(
        future: loaded,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                choices(),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredData.length,
                    itemBuilder: (context, index) {
                      Map d = filteredData[index];
                      return Card(
                        margin: EdgeInsets.all(
                          8.0,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                d['uid'],
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              Text(
                                "NAME : " + d['name'],
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              Text(
                                "EMAIL : " + d['email'],
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              Text(
                                "DEPARTMENT : " + d['department'],
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget choices() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ChoiceChip(
          label: Text("Frontend"),
          selected: frontend,
          onSelected: (val) {
            if (val) {
              // is selected
              filteredData = data
                  .where((element) => element['department'] == "Frontend")
                  .toList();

              setState(() {
                devops = false;
                backend = false;
                frontend = val;
              });
            } else {
              if (!(frontend && backend && devops)) {
                filteredData = data;
              }
              setState(() {
                frontend = val;
              });
            }
          },
        ),
        SizedBox(
          width: 12.0,
        ),
        ChoiceChip(
          label: Text("Backend"),
          selected: backend,
          onSelected: (val) {
            if (val) {
              // is selected
              filteredData = data
                  .where((element) => element['department'] == "Backend")
                  .toList();

              setState(() {
                frontend = false;
                devops = false;
                backend = val;
              });
            } else {
              if (!(frontend && backend && devops)) {
                filteredData = data;
              }
              setState(() {
                backend = val;
              });
            }
          },
        ),
        SizedBox(
          width: 12.0,
        ),
        ChoiceChip(
          label: Text("DevOps"),
          selected: devops,
          onSelected: (val) {
            if (val) {
              // is selected
              filteredData = data
                  .where((element) => element['department'] == "DevOps")
                  .toList();
              setState(() {
                frontend = false;
                backend = false;
                devops = val;
              });
            } else {
              if (!(frontend && backend && devops)) {
                filteredData = data;
              }

              setState(() {
                devops = val;
              });
            }
          },
        ),
      ],
    );
  }

  void addUser() {
    String name = "";
    String email = "";
    String? department;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => FractionallySizedBox(
        heightFactor: 0.8,
        child: ListView(
          padding: EdgeInsets.all(
            12.0,
          ),
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: "Name",
              ),
              onChanged: (val) {
                name = val;
              },
            ),
            SizedBox(
              height: 8.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Email",
              ),
              onChanged: (val) {
                email = val;
              },
            ),
            SizedBox(
              height: 8.0,
            ),
            DropdownButtonFormField(
              items: [
                DropdownMenuItem<String>(
                  child: Text(
                    "Frontend",
                  ),
                  value: "Frontend",
                ),
                DropdownMenuItem<String>(
                  child: Text(
                    "Backend",
                  ),
                  value: "Backend",
                ),
                DropdownMenuItem<String>(
                  child: Text(
                    "DevOps",
                  ),
                  value: "DevOps",
                ),
              ],
              hint: Text(
                "Select Department",
              ),
              value: department,
              onChanged: (val) {
                department = val.toString();
              },
            ),
            SizedBox(
              height: 8.0,
            ),
            SizedBox(
              height: 50.0,
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    var response = await http.post(
                        Uri.parse("http://10.0.2.2:8000/"),
                        body: jsonEncode({
                          'name': name,
                          'email': email,
                          "department": department,
                        }),
                        headers: {
                          'Content-Type': 'application/json; charset=UTF-8'
                        });
                    loaded = getData();
                    setState(() {});
                    Navigator.of(context).pop();
                  } catch (SocketException) {
                    // error adding user
                    // display error using dialog or toast
                  }
                },
                child: Text(
                  "Add User",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
