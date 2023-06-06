import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopee_fake/app/components/custom_text_input.dart';
import 'package:shopee_fake/common/constants/app_assets.dart';
import 'package:shopee_fake/common/constants/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const routePath = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Row(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  color: Colors.white,
                ),
                child: CustomTextInput(
                  textController: _searchController,
                  // onTextChange: _onSearchTextChange,
                  hintText: "Search here",
                  startIcon: const Icon(
                    Icons.search_outlined,
                    color: AppColors.colorIcon,
                  ),
                  endIcon: const Icon(
                    Icons.camera_alt,
                    color: AppColors.colorIcon,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.shopping_cart_rounded,
                color: Colors.white,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.chat_bubble,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Swiper.children(
              autoplay: true,
              pagination: const SwiperPagination(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
                  builder: DotSwiperPaginationBuilder(
                      color: Colors.white30,
                      activeColor: Colors.white,
                      size: 5.0,
                      activeSize: 10.0)),
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(40.0),
                    bottomLeft: Radius.circular(40.0),
                  ),
                  child: Image.asset(
                    AppAssets.imgSecondPanel,
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                  ),
                  child: Image.asset(
                    AppAssets.imgThirdPanel,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          const Flexible(
            flex: 7,
            child: SizedBox(),
          )
        ],
      ),
    );
  }
}
