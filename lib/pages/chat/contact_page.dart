import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/chat/chat_page.dart';
import 'package:flutter/cupertino.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Message",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              height: size.height * 0.96,
              decoration: const BoxDecoration(color: Colors.white),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.builder(
                itemCount: 25,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      ListTile(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ChatPage()),
                        ),
                        title: const Text(
                          "Jane Cooper",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          "I am very happy",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff3C3C43).withOpacity(0.6),
                          ),
                        ),
                        leading: CircleAvatar(
                          radius: size.height * 0.03,
                          backgroundImage: NetworkImage(
                              "https://source.unsplash.com/random/$index"),
                        ),
                        trailing: SizedBox(
                          width: size.width * 0.22,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "9:41 AM",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w400,
                                  color:
                                      const Color(0xff3C3C43).withOpacity(0.6),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Icon(
                                CupertinoIcons.right_chevron,
                                size: 15.0,
                                color: const Color(0xff3C3C43).withOpacity(0.6),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(color: const Color(0xffB7B7B7).withOpacity(0.36)),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
