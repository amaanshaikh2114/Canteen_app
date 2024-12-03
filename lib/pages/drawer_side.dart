import 'package:canteen_user/controller/login_controller.dart';
import 'package:canteen_user/model/user/user.dart';
import 'package:canteen_user/pages/home_page.dart';
import 'package:canteen_user/pages/my_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerSide extends StatelessWidget {
  const DrawerSide({super.key});

  Widget listTile(
      {required IconData icon,
      required String title,
      required Function()? onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        size: 40,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.black, fontSize: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    User? loginUse = Get.find<LoginController>().loginUser;
    return Container(
      color: const Color.fromARGB(255, 240, 184, 138),
      child: ListView(
        children: [
          DrawerHeader(
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 45,
                  child: CircleAvatar(
                    foregroundImage: NetworkImage(
                        'https://media.istockphoto.com/id/1300845620/vector/user-icon-flat-isolated-on-white-background-user-symbol-vector-illustration.jpg?s=612x612&w=0&k=20&c=yBeyba0hUkh14_jgv1OKqIH0CCSWU_4ckRkAoy2p73o='),
                    // 'https://th.bing.com/th/id/OIP.EpWkMAaV8y2P8dDpiY5CpwHaHK?rs=1&pid=ImgDetMain'),
                    radius: 40,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Name: ${loginUse?.name ?? ''}',
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'No.: ${loginUse?.number ?? 00}',
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
          listTile(
              icon: Icons.home,
              title: "Home",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              }),
          listTile(
              icon: Icons.shopping_cart_rounded,
              title: "Review Cart",
              onTap: () {}),
          listTile(
              icon: Icons.person_outline_outlined,
              title: "My Profile",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MyProfile(),
                  ),
                );
              }),
          listTile(
              icon: Icons.notifications_none,
              title: "Notifications",
              onTap: () {}),
          listTile(
              icon: Icons.star_rate_outlined,
              title: "Rating & Review",
              onTap: () {}),
          listTile(
              icon: Icons.favorite_outline, title: "WishList", onTap: () {}),
          listTile(
              icon: Icons.comment, title: "Raise a complaint", onTap: () {}),
          listTile(
              icon: Icons.question_mark_outlined, title: "FAQs", onTap: () {}),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 200,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Contact Support",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text("Call us:"),
                    SizedBox(
                      width: 10,
                    ),
                    Text("+917028545659")
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text("Mail us:"),
                      SizedBox(
                        width: 10,
                      ),
                      Text("booknbitepbl@gmail.com")
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
