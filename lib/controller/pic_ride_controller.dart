import 'package:duseca_task/const/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class PickRideController extends GetxController{
  List<List<String>> seatsData = [];

  Widget buildSeatWidgets(BuildContext context) {
    List<Widget> rows = [];

    for (int i = 0; i < seatsData.length; i++) {
      List<Widget> seatWidgets = seatsData[i].asMap().entries.map((entry) {
        int seatIndex = entry.key;
        String seat = entry.value;

        return GestureDetector(
          onTap: () {
            showSeatNumber(context, '${seatIndex+3}');
            print('Selected Seat: Row $i, Seat ${seatIndex+3}');
          },
          child: Image.asset(seat).animate().fade(duration: const Duration(seconds: 1)).slideY(),
        );
      }).toList();

      rows.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: seatWidgets,
      ));
    }

    return Column(
      children: rows,
    );
  }


  void showAddSeatDialog(BuildContext context) {
    int totalSeats = seatsData.fold<int>(0, (count, row) => count + row.length);

    if (totalSeats < 9) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add Seat'),
            content: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (){
                    if (totalSeats < 9) {
                      addSeat(AppAssets.selectedSeat);
                      Navigator.pop(context);
                    } else {
                      showBusFullDialog(context);
                    }
                  },
                  child: Image.asset(AppAssets.selectedSeat),
                ),
                GestureDetector(
                  onTap: (){
                    if (totalSeats < 9) {
                      addSeat(AppAssets.availableSeat);
                      Navigator.pop(context);
                    } else {
                      showBusFullDialog(context);
                    }
                  },
                  child: Image.asset(AppAssets.availableSeat),
                ),

              ],
            ),
          );
        },
      );
    } else {
      showBusFullDialog(context);
    }
  }

  void showBusFullDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Bus Full'),
          content: const Text('The bus is full. No more seats can be added.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
  void showSeatNumber(BuildContext context,String number) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Seat Info'),
          content:  Text('Seat No is $number.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void addSeat(String newSeat) {
      if (seatsData.length < 9) {
        if (seatsData.isEmpty || seatsData.last.length == 3) {
          seatsData.add([newSeat]);
        } else {
          seatsData.last.add(newSeat);
        }
      }
    update();
  }

  void removeSeat() {
      if (seatsData.isNotEmpty) {
        seatsData.last.removeLast();

        if (seatsData.last.isEmpty) {
          seatsData.removeLast();
        }
      }
    update();
  }


}