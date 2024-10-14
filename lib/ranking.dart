import 'package:flutter/material.dart';
import 'package:prosper/utils/utils.dart';
import 'package:prosper/widgets/nav_bar.dart';

class Ranking extends StatelessWidget {
  static const String screenName = "/ranking";
  final int selectedIndex;

  const Ranking({super.key, this.selectedIndex = 2});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(AppImages.logozinha),
        title: const Text(
          'Ranking',
          style: TextStyle(
            color: Color(0xFF37D100),
            fontSize: 26,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          Image.asset(AppImages.nonotification),
        ],
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: Image.asset(
                    AppImages.trofeus, 
                    height: 92,
                    width: 140,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 24, right: 10),
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Image.asset(
                          AppImages.search,
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                    labelText: 'Pesquisar cliente',
                    labelStyle: TextStyle(
                      color: Color(0xFFAAA4A4),
                      fontSize: 24,
                    ),
                    filled: true,
                    fillColor: Color(0xFF282727),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                      gapPadding: 8.0,
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.primaryColor),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  ),
                ),
                SizedBox(height: 10), // Adicione um SizedBox para o espaçamento
                Expanded(
                  child: Stack(
                    children: [
                      ListView.builder(
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          // Defina uma lista com cores para os 3 primeiros itens
                          final List<Color> leadingColors = [
                            Color(0xFFFFC700),    // Cor para o 1º item
                            Color(0XFFC1BFB8),  // Cor para o 2º item
                            Color(0xFFD38301),   // Cor para o 3º item
                          ];
                          Color leadingColor = index < 3
                              ? leadingColors[index]
                              : AppColors.primaryColor; 

                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 8.0),
                            decoration: BoxDecoration(
                              color: Color(0xFF333333),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: SizedBox(
                              height: 56,
                              child: ListTile(
                                contentPadding: EdgeInsets.only(right: 12,),
                                leading: Container(
                                  width: 46,
                                  height: 60,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: leadingColor, 
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    '${index + 1}°',
                                    style: const TextStyle(
                                      color: Colors.white, 
                                      fontSize: 21,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                                title: Row(
                                  children: [
                                    Image.asset(
                                      AppImages.imgCliente, 
                                      width: 40,
                                      height: 40, 
                                    ),
                                    const SizedBox(width: 8),
                                    const Expanded(
                                      child: Text(
                                        'Menina Veneno',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ]
                                ),
                                trailing: Text(
                                  " -${index * 10 + 10},00",
                                  style: const TextStyle(
                                    color: Color(0xFFE74500),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                textColor: Colors.white,
                              ),
                            ),
                          );
                        },
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 40, // Ajuste a altura conforme necessário
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.black.withOpacity(0.1), Colors.black],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.0, 0.85], // Ajuste o ponto onde a opacidade começa a mudar
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavBar(selectedIndex: selectedIndex),
    );
  }
}

