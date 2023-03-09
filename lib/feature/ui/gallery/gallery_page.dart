import 'package:flutter/material.dart';

import 'file_images.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Gallery')),
        body: GridView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(4.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: imgList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: InkWell(
                onTap: () {
                  if (index % 2 == 0) {
                    _openImageDialog(context, index);
                  } else {
                    _openImageBottomSheet(context, index);
                  }
                },
                child: GridTile(
                    child: ClipRRect(
                  child: Image.asset(imgList[index].imgPath, fit: BoxFit.fill),
                )),
              ),
            );
          },
        ));
  }

  _openImageDialog(context, index) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          title: const Text('Preview',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child:
                        Image.asset(imgList[index].imgPath, fit: BoxFit.fill),
                  ),
                  const SizedBox(height: 16.0),
                  TextButton(
                      onPressed: () => _closeDialog(context),
                      child: const Text('OK'))
                ])),
          ]),
    );
  }

  _closeDialog(context) {
    Navigator.pop(context);
  }

  _openImageBottomSheet(context, index) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    showModalBottomSheet(
      isScrollControlled: false,
      shape:
          ContinuousRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
      context: context,
      builder: (context) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            const Text('Preview',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            const SizedBox(height: 8.0),
            Expanded(
                child: Container(
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32.0),
                        image: DecorationImage(
                            image: AssetImage(imgList[index].imgPath),
                            fit: BoxFit.cover)))),
            TextButton(
                onPressed: () => _closeDialog(context), child: const Text('OK'))
          ])),
    );
  }
}
