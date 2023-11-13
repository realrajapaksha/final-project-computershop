import 'package:flutter/material.dart';

import 'widgets/watchlist_item.dart';

class WatchList extends StatefulWidget {
  const WatchList({super.key});

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text("Watchlist"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 1,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return const WatchlistItem();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
