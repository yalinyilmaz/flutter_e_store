import 'package:flutter/material.dart';
import 'package:flutter_e_store/core/button_animation/new_animated_fade_button.dart';

class AdminHomeProductListBody extends StatelessWidget {
  const AdminHomeProductListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RefreshIndicator(
        onRefresh: () async {},
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: 4,
            itemBuilder: (context, index) {
              //final photo = photoList.elementAt(index);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration:
                        BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(12)),
                    child: Center(
                        child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  // showModalBottomSheet(
                                  //     context: context,
                                  //     showDragHandle: true,
                                  //     isScrollControlled: true,
                                  //     isDismissible: true,
                                  //     builder: (context) {
                                  //       return PhotoEditBottomSheet(
                                  //           photo: photo);
                                  //     });
                                },
                                icon: const Icon(Icons.more_vert))
                          ],
                        ),
                        Flexible(
                          child: AnimatedFadeButton(
                            onTap: () {
                              // product detay sayfasına gidecek
                            },
                            child: const SizedBox()
                            // Image.network(
                            //   "",
                            //   fit: BoxFit.cover,
                            //   loadingBuilder: (BuildContext context,
                            //       Widget child,
                            //       ImageChunkEvent? loadingProgress) {
                            //     if (loadingProgress == null) {
                            //       return child;
                            //     }
                            //     return Center(
                            //       child: CircularProgressIndicator(
                            //         value: loadingProgress.expectedTotalBytes !=
                            //                 null
                            //             ? loadingProgress
                            //                     .cumulativeBytesLoaded /
                            //                 loadingProgress.expectedTotalBytes!
                            //             : null,
                            //       ),
                            //     );
                            //   },
                            // ),
                          ),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(child: Text("caption")),
                          ],
                        ),
                      ],
                    ))),
              );
            }),
      ),
    );
  }
}
