import 'package:flutter/material.dart';
import 'tourism_place.dart';

class Detailpage extends StatefulWidget {
  final TourismPlace place;

  const Detailpage({super.key, required this.place});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<Detailpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.place.name),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network(widget.place.imageUrls[0]),
                const SizedBox(height: 16.0),
                Text(
                  widget.place.name,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8.0),
                Text(
                  widget.place.location,
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8.0),
                Text(
                  widget.place.description,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.place.imageUrls.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 160,
                        child: Card(
                          child: Image.network(widget.place.imageUrls[index]),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}