import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:prosper/utils/app_colors.dart";
import "package:prosper/utils/app_images.dart";
import 'package:fl_chart/fl_chart.dart';
import "package:prosper/utils/utils.dart";
import "package:prosper/widgets/nav_bar.dart";

class HomeScreen extends StatefulWidget {
  static const String screenName = '/home';
  final int selectedIndex;
  const HomeScreen({super.key, this.selectedIndex = 1});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Olá, [usuário]!",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Image.asset(AppImages.logozinha),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Image.asset(AppImages.comnotificacaonwhite),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Seu balanço",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "R\$ 9.999,99",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 36),
                Text(
                  "Sobre Hoje",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    InfoCard(
                      label: "Recebido",
                      value: "R\$ 1000",
                      image: AppImages.money_icon,
                      width: 168,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InfoCard(
                      label: "Vendas",
                      value: "10",
                      image: AppImages.graphic_icon,
                      width: 154,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.infoCard,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PeriodButton(text: "Semana"),
                      const SizedBox(width: 25),
                      PeriodButton(text: "Mês"),
                      const SizedBox(width: 25),
                      PeriodButton(text: "Ano"),
                    ],
                  ),
                  Expanded(
                    child: LineChart(
                      LineChartData(
                        gridData: FlGridData(show: false),
                        titlesData: FlTitlesData(show: true),
                        borderData: FlBorderData(show: false),
                        lineBarsData: [
                          LineChartBarData(
                            spots: [
                              FlSpot(5, 2),
                              FlSpot(10, 5),
                              FlSpot(15, 7),
                              FlSpot(20, 3),
                              FlSpot(25, 8),
                              FlSpot(30, 5),
                              FlSpot(35, 9),
                              FlSpot(40, 2),
                              FlSpot(45, 7),
                              FlSpot(50, 6),
                            ],
                            isCurved: true,
                            color: AppColors.navBarColor,
                            barWidth: 4,
                            isStrokeCapRound: true,
                            belowBarData: BarAreaData(
                              show: true,
                              color: AppColors.graphArea,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const NavBar(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String label;
  final String value;
  final String image;
  final double width;

  const InfoCard({
    super.key,
    required this.label,
    required this.value,
    required this.image,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.infoCard,
        borderRadius: BorderRadius.circular(60),
      ),
      child: Row(
        children: [
          Container(
            width: 75,
            height: 76,
            decoration: BoxDecoration(
              color: AppColors.infoCardCircule,
              borderRadius: BorderRadius.circular(36),
            ),
            child: Image.asset(image),
          ),
          const SizedBox(width: 9),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
              Text(
                value,
                style: TextStyle(color: AppColors.primaryColor, fontSize: 15),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PeriodButton extends StatefulWidget {
  final String text;

  const PeriodButton({super.key, required this.text});

  @override
  State<PeriodButton> createState() => _PeriodButtonState();
}

class _PeriodButtonState extends State<PeriodButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        width: 86,
        height: 34,
        decoration: BoxDecoration(
          image: isSelected
              ? DecorationImage(
                  image: AssetImage(AppImages.bg_periodButton),
                  fit: BoxFit.cover,
                )
              : DecorationImage(
                  image: AssetImage(AppImages.bg_noselectedperiodButton),
                  fit: BoxFit.cover,
                ),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
