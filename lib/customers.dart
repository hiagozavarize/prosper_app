import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:google_fonts/google_fonts.dart";
import "package:prosper/utils/app_colors.dart";
import "package:prosper/utils/app_images.dart";
import "package:prosper/widgets/nav_bar.dart";

class Customers extends StatefulWidget {
  final int selectedIndex;
  const Customers({super.key, this.selectedIndex = 1});
  static const String screenName = "/customers";

  @override
  _CustomersState createState() => _CustomersState();
}

class _CustomersState extends State<Customers> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            leading: Image.asset(AppImages.logozinha),
            actions: [
              IconButton(
                icon: Image.asset(AppImages.nonotification),
                onPressed: () {}, // colocar função pra acessar as notificações
              )
            ],
            title: Text('Clientes',
                style: TextStyle(
                    color: AppColors.navBarColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w600)),
          ),
          body: Column(children: [
            const SizedBox(height: 30),
            TextField(
                style: const TextStyle(color: Colors.white),
                cursorColor: Color(0xFFAAA4A4),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFF282727),
                  prefixIcon: Image.asset(AppImages.search),
                  labelText: 'Pesquisar cliente',
                  labelStyle: const TextStyle(
                    color: Color(0xFFAAA4A4),
                    fontSize: 24,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    gapPadding: 8.0,
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.primaryColor),
                  ),
                )),
            const SizedBox(height: 10),
            ElevatedButton(
                // botão de adiconar cliente
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.infoCard,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size(200, 40),
                ),
                onPressed:
                    () {}, // colocar função pra adicionar um novo cliente
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 13),
                      child: Row(
                        children: [
                          Image.asset(
                            AppImages.add_button,
                          ),
                          const SizedBox(width: 7),
                          Text(
                            'Adicionar',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                color: Color(0xFFAAA4A4)),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        child: customer(),
                      );
                    }))
          ]),
          bottomNavigationBar: NavBar(selectedIndex: widget.selectedIndex),
        ));
  }

  Widget customer() {
    return Container(
      height: 60,
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            child: Image.asset(
              AppImages.customer_image,
            ),
            // backgroundImage: NetworkImage('https://picsum.photos/200',),
          ),
          const SizedBox(width: 10),
          Text(
            'Chico',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
          ),
          Spacer(),
          Image.asset(
            AppImages.money_icon_customer,
          ),
        ],
      ),
    );
  }
}
