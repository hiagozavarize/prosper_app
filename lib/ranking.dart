import 'package:flutter/material.dart';
import 'package:prosper/utils/app_colors.dart';
import 'package:prosper/utils/app_images.dart';
import 'package:prosper/widgets/nav_bar.dart';

class Ranking extends StatefulWidget {
  static const String screenName = "/ranking";
  final int selectedIndex;

  const Ranking({super.key, this.selectedIndex = 2});

  @override
  State<Ranking> createState() => _RankingState();
}

class _RankingState extends State<Ranking> {
  List<Map<String, dynamic>> allClients = [
    {'name': 'Ana Clara', 'debt': 100.0},
    {'name': 'João Pedro', 'debt': 90.0},
    {'name': 'Maria Silva', 'debt': 80.0},
    {'name': 'Pedro', 'debt': 20.0},
    {'name': 'Marta', 'debt': 120.0},
    // Adicione mais clientes aqui
  ];

  List<Map<String, dynamic>> displayedClients = [];

  @override
  void initState() {
    super.initState();
    _sortClients();
    displayedClients = List.from(allClients); // Inicializa com todos os clientes
  }

  void _sortClients() {
    // Ordena os clientes pelo valor da dívida, em ordem decrescente
    allClients.sort((a, b) => b['debt'].compareTo(a['debt']));

    // Atualiza a posição de cada cliente com base na nova ordem
    for (int i = 0; i < allClients.length; i++) {
      allClients[i]['position'] = i + 1;
    }
  }

  void _searchClient(String query) {
    setState(() {
      if (query.isEmpty) {
        displayedClients = List.from(allClients);
      } else {
        displayedClients = allClients
            .where((client) => client['name']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
Widget build(BuildContext context) {
  return GestureDetector(
    onTap: () {
      // Remove o foco do campo de texto
      FocusScope.of(context).unfocus();
    },
    child: Scaffold(
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
                  onChanged: _searchClient, // Atualiza a busca ao digitar
                  style: const TextStyle(
                    color: Colors.white,
                  ),
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
                    labelStyle: const TextStyle(
                      color: Color(0xFFAAA4A4),
                      fontSize: 24,
                    ),
                    filled: true,
                    fillColor: const Color(0xFF282727),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      gapPadding: 8.0,
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.primaryColor),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: displayedClients.length,
                    itemBuilder: (context, index) {
                      final client = displayedClients[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFF333333),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: SizedBox(
                          height: 56,
                          child: ListTile(
                            contentPadding: const EdgeInsets.only(right: 12),
                            leading: Container(
                              width: 46,
                              height: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: client['position'] <= 3
                                    ? _getLeadingColor(client['position'])
                                    : AppColors.primaryColor,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                              ),
                              child: Text(
                                '${client['position']}°',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            title: Row(children: [
                              Image.asset(
                                AppImages.imgCliente,
                                width: 40,
                                height: 40,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  client['name'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ]),
                            trailing: Text(
                              "-R\$ ${client['debt'].toStringAsFixed(2)}",
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
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavBar(selectedIndex: widget.selectedIndex),
    ),
  );
}

  Color _getLeadingColor(int position) {
    switch (position) {
      case 1:
        return const Color(0xFFFFC700); // Ouro
      case 2:
        return const Color(0XFFC1BFB8); // Prata
      case 3:
        return const Color(0xFFD38301); // Bronze
      default:
        return AppColors.primaryColor; // Padrão
    }
  }
}
