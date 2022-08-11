import 'package:badminton/styles/app_dialog.dart';
import 'package:badminton/widgets/app_bottomsheet.dart';
import 'package:better_player/better_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MatchController extends GetxController {
  BetterPlayerController? betterPlayerController;

  YoutubePlayerController? youtubePlayerController;

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

  @override
  void onInit() {
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: Get.arguments,
      params: const YoutubePlayerParams(
        // hideControls: false,
        // isLive: true,
        enableCaption: false,
        strictRelatedVideos: false,
        enableJavaScript: true,

        showVideoAnnotations: true,
        showFullscreenButton: true,
        useHybridComposition: false,
        autoPlay: true,
        loop: true,
        mute: true,
      ),
    );
    betterPlayerController = BetterPlayerController(
      BetterPlayerConfiguration(
        aspectRatio: 16 / 9,
        autoPlay: false,
        fit: BoxFit.fill,
        autoDispose: true,
        looping: true,
        controlsConfiguration: const BetterPlayerControlsConfiguration(
          enablePlayPause: true,
          enablePlaybackSpeed: true,
          enableProgressBar: true,
          liveTextColor: Colors.white,
          showControls: true,
        ),
        placeholder: Container(
          alignment: Alignment.center,
          width: Get.width,
          height: 200,
          color: Colors.amber,
          child: const Icon(
            Icons.camera_rounded,
            size: 125,
          ),
        ),
        showPlaceholderUntilPlay: true,
      ),
    );
    betterPlayerController!.setupDataSource(
      BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        Get.arguments,
      ),
    );
    super.onInit();
  }

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

  Future<void> fnAddMatchRekap(int partai, int sistem) async {
    Map<String, dynamic> request = {
      "home": partai == 1
          ? [
              boardName1.value,
            ]
          : [
              boardName1.value,
              boardName2.value,
            ],
      "away": partai == 1
          ? [
              boardName3.value,
            ]
          : [
              boardName3.value,
              boardName4.value,
            ],
      "partai": partai,
      "nama_partai": partai == 1 ? "Tunggal" : "Ganda",
      "sistem": sistem,
      "nama_sistem": sistem == 1 ? "Reli Point" : "Pindah Bola",
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

  void fnConnectVideo() {}
}
