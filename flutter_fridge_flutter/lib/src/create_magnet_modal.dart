import 'package:flutter/material.dart';
import 'package:flutter_fridge_client/flutter_fridge_client.dart';
import 'package:flutter_fridge_flutter/src/utils.dart';

const List<String> colors = [
  "#000000",
  "#00008B",
  "#800000",
  "#556B2F",
  "#4B0082",
  "#E7691D",
];

const MIN_X = 8;
const MIN_Y = 64;

class CreateMagnetModal extends StatefulWidget {
  const CreateMagnetModal({super.key});

  @override
  State<CreateMagnetModal> createState() => _CreateMagnetModalState();
}

class _CreateMagnetModalState extends State<CreateMagnetModal> {
  String selectedColor = "#000000";
  TextEditingController messageController = TextEditingController();
  FocusNode focus = FocusNode();
  bool expand = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Add Magnet',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Focus(
                focusNode: focus,
                onFocusChange: (val) {
                  setState(() {
                    expand = val;
                  });
                },
                child: TextField(
                  autofocus: true,
                  decoration: const InputDecoration(hintText: 'Message'),
                  controller: messageController,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Color',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: colors
                  .map((e) => InkWell(
                        onTap: () {
                          setState(() {
                            selectedColor = e;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: selectedColor == e ? Border.all(color: Colors.lightGreen, width: 5) : null,
                            color: hexToColor(e),
                          ),
                          width: 50,
                          height: 40,
                        ),
                      ))
                  .toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(
                      MagnetCreateMessage(
                        x: MIN_X,
                        y: MIN_Y,
                        text: messageController.text,
                        color: selectedColor,
                      ),
                    );
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: hexToColor(selectedColor),
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox(
            //   height: expand ? 1000 : 0,
            // )
          ],
        ),
      ),
    );
  }
}
