import 'package:flutter_fridge_server/src/generated/protocol.dart';
import 'package:flutter_fridge_server/src/utils/strings.dart';
import 'package:serverpod/serverpod.dart';

const magnetChannel = "magnet-channel";

class FridgeEndpoint extends Endpoint {
  @override
  Future<void> streamOpened(StreamingSession session) async {
    final magnets = await Magnet.find(session);
    sendStreamMessage(session, MagnetStateMessage(magnets: magnets));

    session.messages.addListener(magnetChannel, (update) {
      sendStreamMessage(session, update);
    });
  }

  @override
  Future<void> handleStreamMessage(StreamingSession session, SerializableEntity message) async {
    if (message is MagnetCreateMessage) {
      final identifer = generateRandomString(16);

      final magnet = Magnet(
        identifier: identifer,
        x: message.x,
        y: message.y,
        color: message.color,
        text: message.text,
        createdAt: DateTime.now(),
      );

      await Magnet.insert(session, magnet);

      session.messages.postMessage(magnetChannel, MagnetAppendMessage(magnet: magnet), global: false);
    }

    if (message is MagnetUpdateMessage) {
      final magnet = await Magnet.findSingleRow(session, where: (m) => m.identifier.equals(message.identifier));
      if (magnet != null) {
        magnet.x = message.x;
        magnet.y = message.y;
        session.messages.postMessage(
          magnetChannel,
          MagnetUpdateMessage(identifier: magnet.identifier, x: magnet.x, y: magnet.y),
        );
        await Magnet.update(session, magnet);
      }
    }
  }
}
