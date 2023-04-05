import 'package:flutter/material.dart';
import 'model/weeds.dart';

class WeedDetails extends StatelessWidget {
  const WeedDetails({super.key, required this.weed});

  final Weed weed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(weed.weedName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                weed.image,
                height: 500,
                width: 500,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  'Scientific name: ${weed.weedName}',
                  style: const TextStyle(
                      fontSize: 24.0, fontStyle: FontStyle.italic),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Local name: ${weed.localName}',
                  style: const TextStyle(
                      fontSize: 22.0, fontStyle: FontStyle.italic),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  weed.description,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
