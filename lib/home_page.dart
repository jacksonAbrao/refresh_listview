import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<String> lista;
  var random = Random();

  @override
  void initState() {
    lista = _generateList();
    super.initState();
  }

  _generateList() => List.generate(random.nextInt(10), (i) => 'Item $i');

  Future<void> _reloadList() async {
    var newList =
        await Future.delayed(const Duration(seconds: 2), () => _generateList());
    setState(() {
      lista = newList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView Refresh')),
      body: RefreshIndicator(
        onRefresh: _reloadList,
        child: ListView.builder(
          itemCount: lista.length,
          itemBuilder: (_, int index) {
            return ListTile(
              title: Text(lista[index]),
            );
          },
        ),
      ),
    );
  }
}
