import 'package:badminton/styles/app_dialog.dart';
import 'package:badminton/widgets/app_bottomsheet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatchController extends GetxController {
  var boardName1 = 'TBD'.obs;
  var boardName2 = 'TBD'.obs;
  var boardName3 = 'TBD'.obs;
  var boardName4 = 'TBD'.obs;

  var name1 = 'TBD'.obs;
  var name2 = 'TBD'.obs;
  var name3 = 'TBD'.obs;
  var name4 = 'TBD'.obs;

  var matchSet = 0.obs;

  var person = 2.obs;
  var personAway = 0.obs;

  var skorSetaway = [
    0,
    0,
    0,
  ].obs;

  var skorSet = [
    0,
    0,
    0,
  ].obs;
  var tcName = TextEditingController();

  void fnPlusSkor() {
    skorSet[matchSet.value]++;
  }

  void fnMinusSkor() {
    skorSet[matchSet.value]--;
  }

  void fnPlusSkorAway() {
    skorSetaway[matchSet.value]++;
  }

  void fnMinusSkorAway() {
    skorSetaway[matchSet.value]--;
  }

  void fnChangePerson() {
    if (person.value > 0) {
      person.value--;
    }
    if (person.value == 0) {
      personAway.value = 2;
    }
  }

  void fnChangePersonAway() {
    if (personAway.value > 0) {
      personAway.value--;
    }
    if (personAway.value == 0) {
      person.value = 2;
    }
  }

  void fnShowDalogAddNama(int i, String nama) {
    int index = matchSet.value;
    if (skorSet[index] > 0 || skorSetaway[index] > 0 || matchSet.value > 1) {
    } else {
      if (nama.isNotEmpty && nama != 'TBD') {
        tcName.text = nama;
      } else {
        tcName.clear();
      }
      AppBottomSheet.sheetAddNama(i);
    }
  }

  void fnAddNamaPemain(int slug) {
    if (slug == 1) {
      name1.value = tcName.text;
      boardName1.value = tcName.text;
    }
    if (slug == 2) {
      name2.value = tcName.text;
      boardName2.value = tcName.text;
    }
    if (slug == 3) {
      name3.value = tcName.text;
      boardName3.value = tcName.text;
    }
    if (slug == 4) {
      name4.value = tcName.text;
      boardName4.value = tcName.text;
    }
    Get.back();
  }

  void fnSwitchName() {
    final n1 = name1.value;
    final n2 = name2.value;
    final n3 = name3.value;
    final n4 = name4.value;

    name1.value = n3;
    name2.value = n4;
    name3.value = n1;
    name4.value = n2;
  }

  void fnSwitchShuttle(int slug) {
    final n1 = name1.value;
    final n2 = name2.value;
    final n3 = name3.value;
    final n4 = name4.value;
    if (slug == 1) {
      name1.value = n2;
      name2.value = n1;
    } else {
      name3.value = n4;
      name4.value = n3;
    }
  }

  void fnChangeSet() {
    if (matchSet.value < 2) {
      matchSet.value++;
    }
  }

  Future<void> fnAddMatchRekap() async {
    Map<String, dynamic> request = {
      "home": [
        boardName1.value,
        boardName2.value,
      ],
      "away": [
        boardName3.value,
        boardName4.value,
      ],
      "kategori": 1,
      "score": [
        {
          "set": "Pertama",
          "score_home": skorSet[0],
          "score_away": skorSetaway[0],
        },
        {
          "set": "Kedua",
          "score_home": skorSet[1],
          "score_away": skorSetaway[1],
        },
        {
          "set": "Ketiga",
          "score_home": skorSet[2],
          "score_away": skorSetaway[2],
        },
      ]
    };

    try {
      await FirebaseFirestore.instance
          .collection('rekap')
          .doc()
          .set(request)
          .whenComplete(() {
        AppDialog.dialogWithRoute(
            'Berhasil', 'Pertandingan berhasil disimpan', 'Kembali', onTap: () {
          Get.back();
          Get.back();
        });
      });
    } catch (e) {
      AppDialog.dialogWithRoute('Error', e.toString(), 'Tutup');
    }
  }
}
