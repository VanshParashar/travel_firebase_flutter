import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_firebase_flutter/PackagePage/pakage_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List _resultList = [];
  List _allResults = [];

  getClientStream() async {
    var data = await FirebaseFirestore.instance
        .collection('package')
        .get();

    setState(() {
      _allResults = data.docs;
    });
    searchResutList();
  }

  @override
  void initState() {
    // TODO: implement initState
    _searchController.addListener(_onSearchChaged);
    super.initState();
  }

  _onSearchChaged() {
    // print(_searchController.text);
    searchResutList();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _searchController.removeListener(_onSearchChaged);
    _searchController.dispose();
    super.dispose();
  }

  searchResutList() {
    var showResults = [];
    if (_searchController.text != "") {
      for (var clientSnapshot in _allResults) {
        var name = clientSnapshot['name'].toString().toLowerCase();
        if (name.contains(_searchController.text.toLowerCase())) {
          showResults.add(clientSnapshot);
        }
      }
    } else {
      showResults = List.from(_allResults);
    }
    setState(() {
      _resultList = showResults;
    });
  }

  @override
  void didChangeDependencies() {
    getClientStream();

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: CupertinoSearchTextField(
          controller: _searchController,
        ),
      ),
      body: ListView.builder(
          itemCount: _resultList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: GestureDetector(
                // child: _resultList[index]['daysList'].isEmpty() ? Text(_resultList[index]['name']): Text("No data"),
                child: Text(_resultList[index]['name']),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => PackagePage(datafromuser:_resultList[index].data())));
                },
              ),
            );
          }),
    );
  }
}
