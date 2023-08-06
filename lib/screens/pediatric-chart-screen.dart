import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/chartItem.dart';
import 'login.dart';

class PediatricScreen extends StatefulWidget {
  PediatricScreen({super.key, required this.name});
  final String name;
  List<ChartItem> chartItemsList = [];
  @override
  State<PediatricScreen> createState() => _PediatricScreenState();
}

class _PediatricScreenState extends State<PediatricScreen> {
  int itemIndex = 0;
  late ChartItem currentItem;
  FocusNode focus = FocusNode();
  changeItem(bool next) {
    if (next) {
      itemIndex++;
      if (itemIndex >= widget.chartItemsList.length) {
        itemIndex = widget.chartItemsList.length - 1;
      }
    } else {
      itemIndex--;
      if (itemIndex < 0) {
        itemIndex = 0;
      }
    }
    setState(() {});
  }

  setImage(String name) {
    List<ChartItem> chartItemsList = [];
    if (name == "Pediatric") {
      chartItemsList = [
        // const ChartItem(
        //     textLeft: '',
        //     textRight: '',
        //     rotations: 1,
        //     image: 'assets/chart/pediatric/1.jpg',
        //     imageSize: 510,
        //     language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/1.png',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/2.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/2.png',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/3.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/3.png',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/4.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/4.png',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/5.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/5.png',
            imageSize: 450,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/6.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/6.png',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/7.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/7.png',
            imageSize: 450,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/8.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/8.png',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/9.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/9.png',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/10.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/10.png',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/11.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/11.png',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/12.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/12.png',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/13.png',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/14.png',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/15.png',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/16.png',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/17.png',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/18.png',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/19.png',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/20.png',
            imageSize: 450,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/21.png',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/22.png',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/23.png',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/24.png',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/25.png',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/26.png',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/27.png',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/28.png',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/29.png',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/pediatric/30.png',
            imageSize: 510,
            language: ''),
      ];
    }
    //Anatomy
    else if (name == "Anatomy") {
      chartItemsList = [
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/anatomy/1.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/anatomy/2.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/anatomy/3.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/anatomy/4.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/anatomy/5.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/anatomy/6.jpg',
            imageSize: 510,
            language: '')
      ];
    }
    //Astigmatism
    else if (name == "Astigmatism") {
      chartItemsList = [
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/Astigmatism/1.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/Astigmatism/2.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/Astigmatism/3.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/Astigmatism/4.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/Astigmatism/5.jpg',
            imageSize:480,
            language: '')
      ];
    }
    //cataract
    else if (name == "cataract") {
      chartItemsList = [
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/cataract/1.jpg',
            imageSize: 500,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/cataract/2.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/cataract/3.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/cataract/4.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/cataract/5.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/cataract/6.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/cataract/7.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/cataract/8.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/cataract/9.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/cataract/10.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/cataract/11.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/cataract/12.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/cataract/13.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/cataract/14.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/cataract/15.jpg',
            imageSize: 510,
            language: '')
      ];
    }
    //contactlenses
    else if (name == "contactlenses") {
      chartItemsList = [
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/contactlenses/1.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/contactlenses/2.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/contactlenses/3.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/contactlenses/4.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/contactlenses/5.jpg',
            imageSize: 510,
            language: '')
      ];
    }
    //diabetic
    else if (name == "diabetic") {
      chartItemsList = [
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/diabetic/1.jpg',
            imageSize: 500,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/diabetic/2.jpg',
            imageSize: 500,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/diabetic/3.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/diabetic/4.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/diabetic/5.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/diabetic/6.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/diabetic/7.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/diabetic/8.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/diabetic/9.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/diabetic/10.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/diabetic/11.jpg',
            imageSize: 510,
            language: '')
      ];
    }
    //dryeye
    else if (name == "dryeye") {
      chartItemsList = [
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/dryeye/1.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/dryeye/2.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/dryeye/3.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/dryeye/4.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/dryeye/5.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/dryeye/6.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/dryeye/7.jpg',
            imageSize: 330,
            language: '')
      ];
    }
    //general
    else if (name == "general") {
      chartItemsList = [
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/general/1.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/general/2.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/general/3.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/general/4.jpg',
            imageSize: 510,
            language: '')
      ];
    }
    //glaucoma
    else if (name == "glaucoma") {
      chartItemsList = [
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/glaucoma/1.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/glaucoma/2.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/glaucoma/3.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/glaucoma/4.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/glaucoma/5.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/glaucoma/6.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/glaucoma/7.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/glaucoma/8.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/glaucoma/9.jpg',
            imageSize: 510,
            language: ''),
      ];
    }
    //iol
    else if (name == "iol") {
      chartItemsList = [
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/iol/1.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/iol/2.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/iol/3.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/iol/4.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/iol/5.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/iol/6.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/iol/7.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/iol/8.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/iol/9.jpg',
            imageSize: 510,
            language: ''),
      ];
    }
    //lasik
    else if (name == "lasik") {
      chartItemsList = [
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/lasik/1.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/lasik/2.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/lasik/3.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/lasik/4.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/lasik/5.jpg',
            imageSize: 510,
            language: ''),
      ];
    }
    //macular
    else if (name == "macular") {
      chartItemsList = [
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/macular/1.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/macular/2.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/macular/3.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/macular/4.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/macular/5.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/macular/6.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/macular/7.jpg',
            imageSize: 510,
            language: ''),
      ];
    }
    //myopia
    else if (name == "myopia") {
      chartItemsList = [
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/myopia/1.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/myopia/2.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/myopia/3.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/myopia/4.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/myopia/5.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/myopia/6.jpg',
            imageSize: 510,
            language: ''),
      ];
    }
    //opticals
    else if (name == "opticals") {
      chartItemsList = [
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/opticals/1.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/opticals/2.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/opticals/3.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/opticals/4.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/opticals/5.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/opticals/6.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/opticals/7.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/opticals/8.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/opticals/9.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/opticals/10.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/opticals/11.jpg',
            imageSize: 510,
            language: ''),
      ];
    }
    //prakamaya
    else if (name == "prakamaya") {
      chartItemsList = [
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/prakamaya/1.jpg',
            imageSize: 490,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/prakamaya/2.jpg',
            imageSize: 510,
            language: ''),
      ];
    }
    //retinal
    else if (name == "retinal") {
      chartItemsList = [
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/retinal/1.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/retinal/2.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/retinal/3.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/retinal/4.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/retinal/5.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/retinal/6.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/retinal/7.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/retinal/8.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/retinal/9.jpg',
            imageSize: 510,
            language: ''),
        const ChartItem(
            textLeft: '',
            textRight: '',
            rotations: 1,
            image: 'assets/chart/educational/retinal/10.jpg',
            imageSize: 510,
            language: ''),
      ];
    }
      return chartItemsList;
  }

    @override
    Widget build(BuildContext context) {
      widget.chartItemsList = setImage(widget.name);
      currentItem = widget.chartItemsList[itemIndex];
      FocusScope.of(context).requestFocus(focus);
      return Scaffold(
          backgroundColor: Colors.black,
          body: Shortcuts(
              shortcuts: <LogicalKeySet, Intent>{
                LogicalKeySet(LogicalKeyboardKey.select): EnterButtonIntent(),
                LogicalKeySet(LogicalKeyboardKey.arrowUp): UpButtonIntent(),
                LogicalKeySet(LogicalKeyboardKey.arrowDown): DownButtonIntent(),
                LogicalKeySet(LogicalKeyboardKey.arrowLeft): LeftButtonIntent(),
                LogicalKeySet(LogicalKeyboardKey.arrowRight):
                    RightButtonIntent(),
                LogicalKeySet(LogicalKeyboardKey.goBack): AbortButtonIntent()
              },
              child: Actions(
                actions: <Type, Action<Intent>>{
                  RightButtonIntent: CallbackAction<RightButtonIntent>(
                      onInvoke: (intent) => changeItem(true)),
                  LeftButtonIntent: CallbackAction<LeftButtonIntent>(
                      onInvoke: (intent) => changeItem(false)),
                },
                child: Focus(focusNode: focus, child: currentItem),
              )));
    }
  }

