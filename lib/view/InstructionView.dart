import 'dart:io';

import 'package:flutter/material.dart';

import '../config/ColorConfig.dart';
import '../maze/maze.dart';
import '../view/MazeView.dart';

class InstructionView extends StatelessWidget {
  final Set<MagicKey> _collectedKeys;
  final Set<MagicSkill> _collectedSkills;
  final String kidSpeak;
  final CellType currentCellType;
  final CellType nextCellType;
  final Function(CellType) onRiddleSolved;

  final textController = TextEditingController();

  InstructionView(this._collectedKeys, this._collectedSkills, this.kidSpeak,
      this.currentCellType, this.nextCellType, this.onRiddleSolved);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
          Padding(padding: EdgeInsets.all(8), child: buildKidChatWindow()),
          Padding(padding: EdgeInsets.all(8), child: buildMagicConsole()),
          Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                Expanded(
                    flex: 1,
                    child: Padding(
                        padding: EdgeInsets.all(8), child: buildSkillWindow())),
                Expanded(
                    flex: 1,
                    child: Padding(
                        padding: EdgeInsets.all(8),
                        child: buildCollectedKeysWindow())),
              ]))
        ])));
  }

  Widget buildKidChatWindow() {
    return Container(
        color: ColorConfig.bgColorInfoSection,
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Image.asset('assets/img/kid.png', width: 100, height: 100)),
            Expanded(flex: 3, child: Text(kidSpeak)),
          ],
        ));
  }

  Widget buildMagicConsole() {
    if (!showMagicConsole()) {
      return null;
    }

    // should check if current type is key and if enxt cell is skill
    return Container(
        color: ColorConfig.bgColorInfoSection,
        child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  "Magic Contract\n",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                    "You need certain skills to pass this maze. You need Magic.\n" +
                        "I can help you. If..  you can solve this riddle:\n\n"),
                Text(
                  getRiddle(getCellTypeUsedInMagicConsole()),
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text("\n"),
                getTextField(),
              ],
            )));
  }

  Widget getTextField() {
    return TextField(
      decoration: InputDecoration(
        fillColor: ColorConfig.wallColorDefault,
        border: OutlineInputBorder(),
        hintText: 'What am I?',
        suffixIcon: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            textController.clear();
          },
        ),
      ),
      onChanged: (text) {
        if (getAnswersForRiddle(getCellTypeUsedInMagicConsole())
            .contains(text.toLowerCase().trim())) {
          onRiddleSolved.call(getCellTypeUsedInMagicConsole());
        }
      },
      controller: textController,
    );
  }

  Widget buildSkillWindow() {
    return buildRowSectionFormatting("Skills", [
      buildRowImageItem(
          "assets/img/fire.webp",
          "Fire-Proof",
          ColorConfig.pathColorFire,
          _collectedSkills.contains(MagicSkill.fire_proof)),
      buildRowImageItem(
          "assets/img/shark.png",
          "Shark-Proof",
          ColorConfig.pathColorRiver,
          _collectedSkills.contains(MagicSkill.shark_proof)),
      buildRowImageItem(
          "assets/img/ghost.png",
          "Ghost-Proof",
          ColorConfig.pathColorNight,
          _collectedSkills.contains(MagicSkill.ghost_proof)),
    ]);
  }

  Widget buildCollectedKeysWindow() {
    return buildRowSectionFormatting("Keys", [
      buildRowImageItem("assets/img/key1.png", "Key 1", Colors.transparent,
          _collectedKeys.contains(MagicKey.key1)),
      buildRowImageItem("assets/img/key2.png", "Key 2", Colors.transparent,
          _collectedKeys.contains(MagicKey.key2)),
      buildRowImageItem("assets/img/key3.png", "Key 3", Colors.transparent,
          _collectedKeys.contains(MagicKey.key3)),
    ]);
  }

  Widget buildRowSectionFormatting(String title, List<Widget> children) {
    List<Widget> widgets = [
      Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
    ];
    widgets.addAll(children);
    return Container(
        color: ColorConfig.bgColorInfoSection,
        child: Center(
            child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widgets))));
  }

  Widget buildRowImageItem(
      String imgPath, String description, Color bgColor, bool isEnabled) {
    Widget image = Image.asset(
      imgPath,
      width: 50,
      height: 50,
    );
    return Container(
        foregroundDecoration: !isEnabled
            ? BoxDecoration(
                color: Colors.grey,
                backgroundBlendMode: BlendMode.saturation,
              )
            : null,
        child: Padding(
            padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
            child: Row(
              children: [
                Container(
                    color: bgColor,
                    child: Padding(padding: EdgeInsets.all(4), child: image)),
                Padding(
                    padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: Text(description)),
              ],
            )));
  }

  bool showMagicConsole() {
    return getCellTypeUsedInMagicConsole() != CellType.normal_path;
  }

  CellType getCellTypeUsedInMagicConsole() {
    if (currentCellType == CellType.key1 &&
        !_collectedKeys.contains(MagicKey.key1)) {
      return CellType.key1;
    } else if (currentCellType == CellType.key2 &&
        !_collectedKeys.contains(MagicKey.key2)) {
      return CellType.key2;
    } else if (currentCellType == CellType.key3 &&
        !_collectedKeys.contains(MagicKey.key3)) {
      return CellType.key3;
    } else if (nextCellType == CellType.fire_land &&
        !_collectedSkills.contains(MagicSkill.fire_proof)) {
      return CellType.fire_land;
    } else if (nextCellType == CellType.shark_land &&
        !_collectedSkills.contains(MagicSkill.shark_proof)) {
      return CellType.shark_land;
    } else if (nextCellType == CellType.ghost_land &&
        !_collectedSkills.contains(MagicSkill.ghost_proof)) {
      return CellType.ghost_land;
    } else {
      return CellType.normal_path;
    }
  }

  String getRiddle(CellType cellType) {
    switch (cellType) {
      case CellType.key1:
        return """ 
Grumpy. Mean. And so very loud. 
Gentle. Sweet. Hardly makes a sound. 
My moods aren't always easy to tame.
But my curiosity has stayed the same.  
""";
      case CellType.key2:
        return """ 
I sit up high and sing my songs.
Folks often like what they hear. 

But when they don't, they scream my name.
It'd give anyone a scare.
""";
      case CellType.key3:
        return """
I have a small head, a long neck and an oversized body. 
I'm an utter delight if you know how to use me.         
""";
      case CellType.fire_land:
        return """
I splish and I splash, but I don't make a mess.
I'm a clever little thing that few can guess.
""";
      case CellType.ghost_land:
        return """
I see everything, be it day or night,
though it depends on my line of sight.
I can hear. I can speak. 
I can remember what you did last week.  
""";
      case CellType.shark_land:
        return """ 
I've run across mountains. I've paddled up rivers.
I've flapped through the sky. I've fought off monsters. 
It's truly amazing what I can do, 
with a steering wheel and a pair of shoes.
""";
    }

    return null;
  }

  List<String> getAnswersForRiddle(CellType cellType) {
    switch (cellType) {
      case CellType.key1:
        return ["lily", "tiger lily"];
      case CellType.key2:
        return ["echo", "alexa", "amazon"];
      case CellType.key3:
        return ["guitar"];
      case CellType.fire_land:
        return ["cat fountain"];
      case CellType.ghost_land:
        return ["security camera", "mi camera"];
      case CellType.shark_land:
        return ["ringfit", "ring fit"];
    }

    return null;
  }
}
