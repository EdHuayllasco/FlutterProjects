import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: _AppBarView(),
      body: _ChatView(),
    );
  }
}

class _AppBarView extends StatelessWidget implements PreferredSizeWidget {
  // final color;
  // const _AppBarView( {required this.color});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Padding(
        padding: EdgeInsets.all(4.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage(
              'https://www.infobae.com/new-resizer/nPfziUzCHdFjlXbLo76LBGIXGpE=/arc-anglerfish-arc2-prod-infobae/public/6UCCEKKQBESZRT2POYOHAJV7SM.jpg'),
        ),
      ),
      title: const Text('Mi amor ❤️'),
      centerTitle: false,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    //SafeArea hace que no toque los bordes de la pantalla que usa para tomar foto, retroceder botones propios del equipo
    return SafeArea(
      child: Padding(
        // symmetric es para poner el mismo padding en los dos lados del widget
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            // builder ayuda a que se cree unicamente los que estan en pantalla los widget, asi ahorramos memoria al crear innecesariamente widgets
            Expanded(
                child: ListView.builder(
                  controller: chatProvider.scrollController,
                    itemCount: chatProvider.messageList.length,
                    itemBuilder: (context, index) {
                      final message = chatProvider.messageList[index];
                      
                      return (message.fromWho == FromWho.hers)
                          ? HerMessageBubble(indice: index, message:message)
                          : MyMessageBubble(indice: index, message:message);
                    })),
            // Caja de texto
            MessageFieldBox(
              // onValue: (value) => chatProvider.sendMessage(value),
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
