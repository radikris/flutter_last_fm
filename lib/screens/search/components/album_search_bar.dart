import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_fm_api/screens/search/search_controller.dart';

class CharacterSearchInputSliver extends StatefulWidget {
  const CharacterSearchInputSliver({
    Key? key,
    this.onChanged,
    this.debounceTime,
  }) : super(key: key);
  final ValueChanged<String>? onChanged;
  final Duration? debounceTime;

  @override
  _CharacterSearchInputSliverState createState() => _CharacterSearchInputSliverState();
}

class _CharacterSearchInputSliverState extends State<CharacterSearchInputSliver> {
  final controller = Get.find<SearchController>();

  final StreamController<String> _textChangeStreamController = StreamController();
  late StreamSubscription _textChangesSubscription;

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Expanded(
            child: TextField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                labelText: 'Character Name',
              ),
              onChanged: _textChangeStreamController.add,
            ),
          ),
        ),
      );

  @override
  void dispose() {
    _textChangeStreamController.close();
    _textChangesSubscription.cancel();
    super.dispose();
  }
}
