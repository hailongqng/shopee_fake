import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopee_fake/app/components/custom_text_input.dart';
import 'package:shopee_fake/common/constants/app_assets.dart';
import 'package:shopee_fake/common/constants/app_colors.dart';
import 'package:shopee_fake/common/dialog_utils.dart';
import 'package:shopee_fake/generated/l10n.dart';

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
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
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
                    hintText: S.of(context).txt_search,
                    startIcon: IconButton(
                      icon: const Icon(
                        Icons.search_outlined,
                        color: AppColors.colorIcon,
                      ),
                      onPressed: () {
                        DialogUtils.showDialog(context, 'In progress...');
                      },
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
        body: Stack(
          children: [
            Column(
              children: [
                Flexible(
                  flex: 2,
                  child: _banner(),
                ),
                const Flexible(
                  flex: 7,
                  child: SizedBox(),
                ),
              ],
            ),
            _abc(),
          ],
        ),
      ),
    );
  }

  Widget _banner() {
    return Swiper.children(
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
    );
  }

  Widget _abc() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.screenBackground,
        border: Border.all(
          color: Colors.black12,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      margin: const EdgeInsets.only(
        top: 140,
        right: 20,
        left: 20,
      ),
      width: double.infinity,
      height: 80,
      child: Row(
        children: [
          Container(
            width: 80,
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(color: Colors.black12),
              ),
            ),
            child: const Icon(
              Icons.document_scanner_outlined,
              size: 35,
              color: Colors.grey,
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(color: Colors.black12),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.wallet,
                          size: 35,
                          color: AppColors.primaryColor,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                '1.000.000',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'Long dep trai vcl',
                                style: TextStyle(
                                  fontSize: 9,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.attach_money_sharp,
                        size: 35,
                        color: AppColors.primaryColor,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              '1.000 coin',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'Long dep trai vcl',
                              style: TextStyle(
                                fontSize: 9,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
