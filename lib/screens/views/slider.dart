import 'dart:math';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

CarouselSliders(MediaWidth, CarouselController buttonCarouselControllerItem, List<String> imgList) {

  return Stack(
    children: [
      Container(
          width: double.infinity,
          height: MediaWidth / 1.8,
          //  color: Colors.orange.shade100,
          child: CarouselSlider(
            carouselController: buttonCarouselControllerItem,
            options: CarouselOptions(height: 400.0),
            items: imgList.map((item) {
              return Padding(
                padding: const EdgeInsets.only(left: 35, right: 35),
                child: Container(
                  child: Center(
                    child: Image.asset(
                      item,
                      fit: BoxFit.cover,
                      width: 1000,
                    ),
                  ),
                ),
              );
            }).toList(),
          )),
      Container(
        width: double.infinity,
        height: MediaWidth / 1.8,
        //color: Colors.black12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(left: 15),
                alignment: Alignment.centerLeft,
                height: MediaWidth / 1.8,
                width: MediaWidth / 3,
// color: Colors.blue,
                child: Icon(Icons.arrow_back_ios,
                    color: Colors.orange, size: MediaWidth / 13),
              ),
              onTap: () {
                buttonCarouselControllerItem.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear);
              },
            ),
            Container(
              height: MediaWidth / 1.8,
              width: MediaWidth / 3,
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(right: 15),
                alignment: Alignment.centerRight,
                height: MediaWidth / 1.8,
                width: MediaWidth / 3,
// color: Colors.red,
                child: Transform.rotate(
                  angle: 180 * pi / 180,
                  child: Icon(Icons.arrow_back_ios,
                      color: Colors.orange, size: MediaWidth / 13),
                ),
              ),
              onTap: () {
                buttonCarouselControllerItem.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear);
              },
            ),
          ],
        ),
      )
    ],
  );
}
