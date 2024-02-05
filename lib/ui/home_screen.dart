import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_quran_app/global.dart';
import 'package:my_quran_app/ui/tabs/hijb_tab.dart';
import 'package:my_quran_app/ui/tabs/page_tab.dart';
import 'package:my_quran_app/ui/tabs/para_tab.dart';
import 'package:my_quran_app/ui/tabs/surah_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      bottomNavigationBar: _bottomNavigationBar(),
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 4,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: NestedScrollView(
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled)  => [
                  SliverToBoxAdapter(
                    child: _salam(),
                  ),
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.white,
                    elevation: 0,
                    pinned: true,
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(0),
                        child: _tabs()
                    ),
                  ),
                ],
                body: const TabBarView(
                  children: [
                    SurahTab(),
                    ParaTab(),
                    PageTab(),
                    HijbTab()
                  ],
                )
            ),
          ),
        ),
    );
  }

  TabBar _tabs() {
    return TabBar(tabs: [
          _tabItem(label: 'Surah'),
          _tabItem(label: 'Para'),
          _tabItem(label: 'Page'),
          _tabItem(label: 'Hijb')
    ],
      indicatorSize: TabBarIndicatorSize.tab,
    );
  }

  Tab _tabItem({required String label}) {
    return Tab(
        child: Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      );
  }

  Column _salam() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Assalamu'alaikum,",
            style: GoogleFonts.poppins(
              color: secondary,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "Kia Zunnurain",
            style: GoogleFonts.poppins(
              color: primary,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          _lastRead()
        ],
    );
  }

  Stack _lastRead() {
    return Stack(children: [
          Container(
            height: 131,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(0.5, 1),
                colors: [
                  Color(0xFFDF98FA),
                  Color(0xFF9055FF)
                ]
              )
            ),
          ),
      Positioned(
          bottom: 0,
          right: 0,
          child:
          SvgPicture.asset('/svg/banner_quran.svg')
      ),
      Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset('/svg/book_icon.svg'),
                const SizedBox(width: 8,),
                Text('Last Read',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
                'Al-Fatihah',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Ayah No: 1',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ],
        ),
      )
    ],
    );
  }

  AppBar _appBar() => AppBar(
    backgroundColor: Colors.white,
    automaticallyImplyLeading: false,
    title: Row(
      children: [
        IconButton(
            onPressed: (() => {}),
            icon: SvgPicture.asset('/svg/menu_icon.svg')
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          'Quran App',
          style: GoogleFonts.poppins(
            color: primary,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        const Spacer(),
        IconButton(
            onPressed: (() => {}),
            icon: SvgPicture.asset('/svg/search_icon.svg')
        ),
      ],
    ),
  );

  BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
    items: [
      _bottomNavigationBarItem(icon: '/svg/quran_icon.svg', label: 'Quran'),
      _bottomNavigationBarItem(icon: '/svg/doa_icon.svg', label: "Do'a"),
      _bottomNavigationBarItem(icon: '/svg/bookmark_ic.svg', label: 'Bookmark'),
    ],
  );

  BottomNavigationBarItem _bottomNavigationBarItem({required String icon, required String label}) =>
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          icon,
          color: secondary,
        ),
        activeIcon: SvgPicture.asset(
          icon,
          color: primary,
        ),
        label: label
      );
}
