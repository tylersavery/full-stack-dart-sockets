import 'package:flutter/material.dart';
import 'package:flutter_fridge_client/flutter_fridge_client.dart';
import 'package:flutter_fridge_flutter/main.dart';
import 'package:flutter_fridge_flutter/src/create_magnet_modal.dart';
import 'package:flutter_fridge_flutter/src/utils.dart';

class FrigeScreen extends StatefulWidget {
  const FrigeScreen({super.key});

  @override
  State<FrigeScreen> createState() => _FrigeScreenState();
}

class _FrigeScreenState extends State<FrigeScreen> {
  late final StreamingConnectionHandler connectionHandler;
  final GlobalKey _key = GlobalKey();

  List<Magnet> magnets = [];
  int animationDurationMs = 300;

  @override
  void initState() {
    super.initState();

    connectionHandler = StreamingConnectionHandler(
      client: client,
      listener: (connectionState) {
        print(connectionState.status);
        setState(() {});
      },
    );

    connectionHandler.connect();

    listenForUpdates();
  }

  Future<void> listenForUpdates() async {
    await for (var message in client.fridge.stream) {
      if (message is MagnetStateMessage) {
        setState(() {
          magnets = message.magnets;
        });
      }

      if (message is MagnetAppendMessage) {
        setState(() {
          magnets = [...magnets, message.magnet];
        });
      }

      if (message is MagnetUpdateMessage) {
        final index = magnets.indexWhere((m) => m.identifier == message.identifier);

        if (index > -1) {
          var updatedMagnet = magnets[index];
          updatedMagnet.x = message.x;
          updatedMagnet.y = message.y;

          final updatedMagnets = [...magnets]
            ..removeAt(index)
            ..insert(index, updatedMagnet);

          setState(() {
            magnets = updatedMagnets;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newMagnet = await showModalBottomSheet(
            backgroundColor: Colors.white,
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return const CreateMagnetModal();
            },
          ) as MagnetCreateMessage?;

          if (newMagnet != null && newMagnet.text.isNotEmpty) {
            client.fridge.sendStreamMessage(newMagnet);
          }
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          key: _key,
          children: magnets.map(
            (magnet) {
              return AnimatedPositioned(
                duration: Duration(milliseconds: animationDurationMs),
                top: magnet.y.toDouble(),
                left: magnet.x.toDouble(),
                child: Draggable(
                  feedback: Opacity(
                    opacity: 0.5,
                    child: MagnetContainer(magnet),
                  ),
                  childWhenDragging: Container(),
                  onDragStarted: () {
                    setState(() {
                      animationDurationMs = 0;
                    });
                  },
                  onDragEnd: (dragDetails) {
                    final RenderBox? box = _key.currentContext?.findRenderObject() as RenderBox?;
                    final Offset? position = box?.localToGlobal(Offset.zero);

                    if (position != null) {
                      final x = dragDetails.offset.dx - position.dx;
                      final y = dragDetails.offset.dy - position.dy;

                      final message = MagnetUpdateMessage(
                        identifier: magnet.identifier,
                        x: x.round(),
                        y: y.round(),
                      );
                      client.fridge.sendStreamMessage(message);

                      Future.delayed(const Duration(milliseconds: 300)).then((_) {
                        setState(() {
                          animationDurationMs = 300;
                        });
                      });

                      // SEND MESSAGE
                    }
                  },
                  child: MagnetContainer(magnet),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

class MagnetContainer extends StatelessWidget {
  final Magnet magnet;
  const MagnetContainer(
    this.magnet, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3.0),
          boxShadow: const [
            BoxShadow(
              offset: Offset(3, 3),
              spreadRadius: 0,
              blurRadius: 0,
              color: Colors.black12,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Text(
            magnet.text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: hexToColor(magnet.color),
            ),
          ),
        ),
      ),
    );
  }
}
