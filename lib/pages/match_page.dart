import 'package:badminton/controllers/match_controller.dart';
import 'package:badminton/styles/app_style_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MatchPage extends StatelessWidget {
  MatchPage({
    Key? key,
    this.sistem,
    this.partai,
  }) : super(key: key);

  final int? sistem;
  final int? partai;

  final matchC = Get.put(MatchController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.blueGrey.shade300,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            physics: const ClampingScrollPhysics(),
            children: [
              const SizedBox(
                height: 25,
              ),
              Text(
                partai == 1
                    ? 'Partai Tunggal \nSistem Reli Point'
                    : sistem == 2
                        ? 'Partai Ganda \nSistem Pindah Bola'
                        : 'Partai Ganda \nSistem Reli Point',
                style: AppStyleText.styleMonsterat(
                  fontSize: 18,
                  color: Colors.white,
                  height: 1.2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Obx(
                          () => Container(
                            width: Get.width,
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 10),
                            color: Colors.white,
                            child: Column(children: [
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                matchC.boardName1.value,
                                style: AppStyleText.styleMonsterat(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              if (partai == 2)
                                const SizedBox(
                                  height: 12,
                                ),
                              if (partai == 2)
                                Text(
                                  matchC.boardName2.value,
                                  style: AppStyleText.styleMonsterat(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              const SizedBox(
                                height: 8,
                              ),
                            ]),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Vs',
                          style: AppStyleText.styleMonsterat(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Obx(
                          () => Container(
                            width: Get.width,
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 10),
                            color: Colors.white,
                            child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    matchC.boardName3.value,
                                    style: AppStyleText.styleMonsterat(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  if (partai == 2)
                                    const SizedBox(
                                      height: 12,
                                    ),
                                  if (partai == 2)
                                    Text(
                                      matchC.boardName4.value,
                                      style: AppStyleText.styleMonsterat(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                InkWell(
                                  onTap: () => matchC.fnPlusSkor(),
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 2,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.add_rounded,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                InkWell(
                                  onTap: () {
                                    if (matchC.skorSet[matchC.matchSet.value] !=
                                        0) {
                                      matchC.fnMinusSkor();
                                    }
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade400,
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 2,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.remove_rounded,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Row(
                              children: List.generate(
                                3,
                                (index) => Obx(
                                  () => Container(
                                    alignment: Alignment.center,
                                    height: 88,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: index == matchC.matchSet.value
                                            ? Colors.black
                                            : Colors.black38,
                                        width: index == matchC.matchSet.value
                                            ? 4
                                            : 1,
                                      ),
                                    ),
                                    child: Text(
                                      '${matchC.skorSet[index]}',
                                      style: AppStyleText.styleMonsterat(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                InkWell(
                                  onTap: () => matchC.fnPlusSkorAway(),
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 2,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.add_rounded,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                InkWell(
                                  onTap: () {
                                    if (matchC.skorSetaway[
                                            matchC.matchSet.value] !=
                                        0) {
                                      matchC.fnMinusSkorAway();
                                    }
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade400,
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 2,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.remove_rounded,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Row(
                              children: List.generate(
                                3,
                                (index) => Obx(
                                  () => Container(
                                    alignment: Alignment.center,
                                    height: 88,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: index == matchC.matchSet.value
                                            ? Colors.black
                                            : Colors.black38,
                                        width: index == matchC.matchSet.value
                                            ? 4
                                            : 1,
                                      ),
                                    ),
                                    child: Text(
                                      '${matchC.skorSetaway[index]}',
                                      style: AppStyleText.styleMonsterat(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              ExpandableNotifier(
                child: ScrollOnExpand(
                  scrollOnExpand: false,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    child: Card(
                      elevation: 4,
                      child: ExpansionTile(
                        trailing: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          height: 18,
                          child: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 10,
                            color: Colors.black,
                          ),
                        ),
                        iconColor: Colors.black,
                        collapsedIconColor: Colors.black,
                        title: Text(
                          'Preview',
                          style: AppStyleText.styleLato(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: Get.width,
                            color: Colors.grey.shade300,
                            child: YoutubePlayerIFrame(
                              aspectRatio: 16 / 9,
                              controller: matchC.youtubePlayerController!,
                            ),
                            // BetterPlayer(
                            //   controller: matchC.betterPlayerController!,
                            // ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              if (partai == 2 && sistem == 2)
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () => matchC.fnChangePerson(),
                        child: Row(
                          children: [
                            Image.asset(
                              matchC.person.value > 1
                                  ? 'assets/on.png'
                                  : 'assets/off.png',
                              width: 35,
                            ),
                            Image.asset(
                              matchC.person.value > 0
                                  ? 'assets/on.png'
                                  : 'assets/off.png',
                              width: 35,
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () => matchC.fnChangePersonAway(),
                        child: Row(
                          children: [
                            Image.asset(
                              matchC.personAway.value > 0
                                  ? 'assets/on.png'
                                  : 'assets/off.png',
                              width: 35,
                            ),
                            Image.asset(
                              matchC.personAway.value > 1
                                  ? 'assets/on.png'
                                  : 'assets/off.png',
                              width: 35,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(
                height: 25,
              ),
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: 130,
                    width: Get.width,
                    child: Column(
                      children: [
                        Expanded(
                          child: Obx(
                            () => Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () => matchC.fnShowDalogAddNama(
                                        1, matchC.name1.value),
                                    child: Container(
                                      alignment: Alignment.center,
                                      color: Colors.white,
                                      height: partai == 2 ? 65 : 100,
                                      child: Text(
                                        matchC.name1.value.toUpperCase(),
                                        style: AppStyleText.styleMonsterat(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () => matchC.fnShowDalogAddNama(
                                        3, matchC.name3.value),
                                    child: Container(
                                      alignment: Alignment.center,
                                      color: Colors.grey.shade300,
                                      height: partai == 2 ? 65 : 100,
                                      child: Text(
                                        matchC.name3.value.toUpperCase(),
                                        style: AppStyleText.styleMonsterat(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        if (partai == 2)
                          Expanded(
                            child: Obx(
                              () => Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () => matchC.fnShowDalogAddNama(
                                          2, matchC.name2.value),
                                      child: Container(
                                        alignment: Alignment.center,
                                        color: Colors.white,
                                        height: 65,
                                        child: Text(
                                          matchC.name2.value.toUpperCase(),
                                          style: AppStyleText.styleMonsterat(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () => matchC.fnShowDalogAddNama(
                                          4, matchC.name4.value),
                                      child: Container(
                                        alignment: Alignment.center,
                                        color: Colors.grey.shade300,
                                        height: 65,
                                        child: Text(
                                          matchC.name4.value.toUpperCase(),
                                          style: AppStyleText.styleMonsterat(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 130,
                    child: Center(
                      child: InkWell(
                        onTap: () => matchC.fnSwitchName(),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                          height: 35,
                          width: 35,
                          child: Image.asset(
                            'assets/swap.png',
                            width: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (partai == 2)
                    SizedBox(
                      height: 130,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: () => matchC.fnSwitchShuttle(1),
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.amber,
                            ),
                            height: 28,
                            width: 28,
                            child: Image.asset(
                              'assets/upswap.png',
                              width: 25,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (partai == 2)
                    SizedBox(
                      height: 130,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () => matchC.fnSwitchShuttle(2),
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.amber,
                            ),
                            height: 28,
                            width: 28,
                            child: Image.asset(
                              'assets/upswap.png',
                              width: 25,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    )
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                        ),
                        onPressed: () => matchC.fnChangeSet(),
                        child: Text(
                          'PINDAH SET',
                          style: AppStyleText.styleMonsterat(
                            fontSize: 14,
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.amber,
                        ),
                        onPressed: () =>
                            matchC.fnAddMatchRekap(partai!, sistem!),
                        child: Text(
                          'SIMPAN',
                          style: AppStyleText.styleMonsterat(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 35,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
