import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prosper/utils/app_images.dart';
import 'package:prosper/widgets/nav_bar.dart';

class UserProfile extends StatelessWidget {
  static const String screenName = "/profile";
  final int selectedIndex;

  const UserProfile({super.key, this.selectedIndex = 3});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // Permite que o body se estenda por baixo da NavBar
      appBar: AppBar(
        title: const Text(
          'Perfil',
          style: TextStyle(
            color: Color(0xFF37D100),
            fontSize: 26,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: const Center( 
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            radius: 43, // Maior que o avatar para dar espaço à borda
                            backgroundColor: Colors.white, // Cor da borda
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 40,
                            child: Image(
                              height: 55,
                              image: AssetImage(AppImages.person,), 
                            ),
                          ),
                          Positioned(
                            right: 0,  // Posiciona à direita
                            bottom: 0, // Posiciona no rodapé
                            child: Image(
                              width: 30,  // Define o tamanho da imagem para que ela se ajuste ao círculo
                              image: AssetImage(AppImages.circlePen),
                            ),
                          ),  
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Chico Moedas',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Image(image: AssetImage(AppImages.penName),)
                        ]
                      ),
                    ],
                  ),
                )
              ),
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 470,
                          width: 350,
                          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              // ListTile como botão com onTap
                              ListTile(
                                leading: Icon(Icons.visibility, color: Colors.white),
                                title: const Text(
                                  'Alterar aparência',
                                  style: TextStyle(color: Colors.white, fontSize: 18),
                                ),
                                trailing: Switch(
                                  value: false,
                                  onChanged: (value) {
                                    
                                  },
                                  activeColor: Color(0xFF37D100),
                                ),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                                minLeadingWidth: 0,
                                onTap: () {
                                  // Ação ao tocar no botão
                                  print('Alterar aparência tocado');
                                },
                              ),
                              const Divider(color: Colors.white),
                              ListTile(
                                leading: Icon(Icons.help_outline, color: Colors.white),
                                title: const Text(
                                  'Ajuda',
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                                minLeadingWidth: 0,
                                onTap: () {
                                  // Ação ao tocar no botão
                                    //Navigator.pushReplacementNamed(context, '/');
                                },
                              ),
                              const Divider(color: Colors.white),
                              ListTile(
                                leading: Icon(Icons.info_outline, color: Colors.white),
                                title: const Text(
                                  'Sobre',
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                                minLeadingWidth: 0,
                                onTap: () {
                                  // Ação ao tocar no botão
                                  //Navigator.pushReplacementNamed(context, '/');
                                },
                              ),
                              const Divider(color: Colors.white),
                              ListTile(
                                leading: Icon(Icons.logout, color: Colors.white),
                                title: const Text(
                                  'Sair',
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                                minLeadingWidth: 0,
                                onTap: () {
                                  // Ação ao tocar no botão
                                  Navigator.pushReplacementNamed(context, '/login');
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),  
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: NavBar(selectedIndex: selectedIndex),
    );
  }
}