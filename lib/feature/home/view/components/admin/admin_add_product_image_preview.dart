import 'dart:io';

import 'package:flutter/material.dart';

class ImagePreviewList extends StatelessWidget {
  const ImagePreviewList({
    super.key,
    required ScrollController scrollController,
    required this.images,
    required int currentPageIndex,
  })  : _scrollController = scrollController,
        _currentPageIndex = currentPageIndex;

  final ScrollController _scrollController;
  final List<File> images;
  final int _currentPageIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: MediaQuery.sizeOf(context).height / 2.5,
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: index < images.length
                      ? Image.file(
                          images[index],
                          height: MediaQuery.sizeOf(context).height / 2.5,
                          width: MediaQuery.sizeOf(context).height / 2.5,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromARGB(255, 133, 78, 187),
                              ),
                              borderRadius: BorderRadius.circular(12)),
                          width: MediaQuery.sizeOf(context).height / 2.5,
                          child: const Center(
                            child: Icon(
                              Icons.add,
                              color: Color.fromARGB(255, 133, 78, 187),
                              size: 55,
                            ),
                          ),
                        ),
                );
              },
            )),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) => Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == _currentPageIndex
                    ? const Color.fromARGB(255, 133, 78, 187)
                    : Colors.grey,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
