import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/chat/components/chat_bubbles.dart';
import 'package:flutter/cupertino.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final textController = TextEditingController();
  late List<Widget> columnList;
  @override
  void initState() {
    columnList = [
      _firstChat(),
      _secondChat(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Jane Cooper"),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            icon: const Icon(
              CupertinoIcons.left_chevron,
              color: StaticColors.kActiveIconColor,
              size: 30.0,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(color: Colors.white),
          padding: const EdgeInsets.only(right: 18.0, left: 16.0, bottom: 21.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ...columnList,
                  ],
                ),
              ),
              _inputField(columnList, size, textController.text),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _inputField(List<Widget> columnList, Size size, String text) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      controller: textController,
      validator: (value) {
        if (textController.text.isEmpty) {
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide:
                const BorderSide(color: StaticColors.kActiveBorderColor)),
        hintText: "Type Something...",
        hintStyle:
            GoogleFonts.inter(fontSize: 16.0, fontWeight: FontWeight.w400),
        suffixIcon: IconButton(
          onPressed: () {
            columnList.add(_firstChat(
              listColumn: columnList,
              text: textController.text,
              dateTime: DateTime.now(),
            ));
            textController.clear();
            setState(() {});
          },
          icon: const Icon(
            IconlyBold.send,
            color: StaticColors.kBlackTextColor,
          ),
        ),
      ),
    );
  }

  Align _secondChat() {
    return Align(
      alignment: Alignment.topLeft,
      child: ChatContainer(
        "Let's get lunch. How about pizza?",
        const Color(0xffE5E5EA),
        Colors.black,
        Alignment.topLeft,
        DateTime(2022, 1, 1, 15, 40),
      ),
    );
  }

  ChatContainer _firstChat({
    List? listColumn,
    String? text,
    DateTime? dateTime,
  }) {
    return ChatContainer(
      listColumn == null
          ? "Let's get lunch. How about pizza?"
          : text ?? "Hello",
      Colors.blue,
      Colors.white,
      Alignment.topRight,
      dateTime ?? DateTime(2022, 1, 1, 15, 40),
    );
  }
}

// ignore: must_be_immutable
class ChatContainer extends StatelessWidget {
  String text;
  Color color;
  Color textColor;
  Alignment align;
  DateTime dateTime;
  ChatContainer(
    this.text,
    this.color,
    this.textColor,
    this.align,
    this.dateTime, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Column(
          crossAxisAlignment: align == Alignment.topRight
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            CustomPaint(
              painter: ChatBubble(color: color, alignment: align),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                child: Stack(
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "${dateTime.hour}:${dateTime.minute}",
              style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.2),
              ),
            )
          ],
        ),
      ),
    );
  }
}
