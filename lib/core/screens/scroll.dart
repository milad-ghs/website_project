import 'package:flutter/material.dart';

class Scroll extends StatelessWidget {
  ScrollController scrollController;
  bool back;

  Scroll({super.key, required this.scrollController, required this.back});

  @override
  Widget build(BuildContext context) {
    return back
        ? Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton.extended(
                onPressed: () {
                  scrollController.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.linear);
                },
                label: const Text("Back to Top"),
              ),
            ),
          )
        : const SizedBox();
  }
}
