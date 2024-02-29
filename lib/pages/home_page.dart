import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:wiki_app/pages/character_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> characters = [];
  Map<String, dynamic> info = {};
  var url = 'https://rickandmortyapi.com/api/character';

  void getData() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonResponse =
            convert.jsonDecode(response.body) as Map<String, dynamic>;
        setState(() {
          characters = jsonResponse['results'];
          info = jsonResponse['info'];
        });
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print(e);
    }
  }

  void navigatePrevPage() {
    url = info['prev'];
    getData();
  }

  void navigateNextPage() {
    url = info['next'];
    getData();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Row(
          children: [
            Text('count: ${info['count'].toString()}'),
            const SizedBox(width: 10),
            Text('page: ${info['pages'].toString()}'),
          ],
        ),
        actions: [
          IconButton(
            onPressed: navigatePrevPage,
            icon: const Icon(Icons.navigate_before),
          ),
          IconButton(
            onPressed: navigateNextPage,
            icon: const Icon(Icons.navigate_next),
          )
        ],
      ),
      // drawer: Drawer(),
      body: GridView.builder(
        padding: const EdgeInsets.all(9),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.0,
        ),
        itemCount: characters.length,
        itemBuilder: (ctx, index) {
          final character = characters[index];

          return Card(
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => CharacterPage(
                          charImage: character['image'],
                          id: character['id'],
                          charName: character['name'],
                        )));
              },
              title: Text(character['name']),
              leading: Hero(
                tag: character['id'],
                child: CircleAvatar(
                  backgroundImage: NetworkImage(character['image']),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
