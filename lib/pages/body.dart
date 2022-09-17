// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //It will provie us total height and width of our screen
    Size size = MediaQuery.of(context).size;
    //SingleChildScrollView enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const Banner(),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(17.0),
              // Expanded(
              //     child: GridView.count(
              //     crossAxisCount: 2,
              //     childAspectRatio: 1.5,
              //     crossAxisSpacing: 2,
              //     mainAxisSpacing: 2,
              //     padding: const EdgeInsets.all(40.0),
              //     children: const <Widget>[
              child: Row(
                children: const <Widget>[
                  CategoryCard(
                    title: "Lịch khám",
                    imgSrc: "images/lich-kham.png",
                  ),
                  CategoryCard(
                    title: "Đặt hẹn",
                    imgSrc: "images/dat-hen.png",
                  ),
                  CategoryCard(
                    title: "Khám công ty",
                    imgSrc: "images/kham-cong-ty.png",
                  ),
                  CategoryCard(
                    title: "Khám cá nhân",
                    imgSrc: "images/kham-ca-nhan.png",
                  ),
                ],
              )),

          //column -> stats + transactions
          // mn

          //
          Stack(
            children: <Widget>[
              Container(
                height: size.height * .6,
                decoration: const BoxDecoration(
                    // color: Colors.blue[300],
                    image: DecorationImage(
                        image: AssetImage("images/background.jpg"),
                        fit: BoxFit.cover,
                        opacity: 0.2)),
              ),
              SafeArea(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //icon
                            Container(
                              height: 60,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.lightBlue[600],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child:
                                  Image.asset('images/loi-ich-kham-benh.png'),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  'Lợi ích của:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.blue),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text(
                                  'ĐẶT HẸN KHÁM BỆNH',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.blue),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Bạn cần gặp Bác sĩ khám và tư vấn theo yêu cầu vì có công việc gấp?',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          'Chúng tôi đã xây dựng hệ thống đặt hẹn đảm bảo:',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const ContentCard(
                          imgIconPath: 'images/lich-kham.png',
                          text: 'Khám đúng lịch Bác sĩ theo yêu cầu.',
                        ),
                        const ContentCard(
                          imgIconPath: 'images/phone.png',
                          text: 'Đội ngũ chăm sóc khách hàng nhắc giờ hẹn.',
                        ),
                        const ContentCard(
                          imgIconPath: 'images/waiting-room.png',
                          text: 'Không phải đợi để đăng ký khám.',
                        ),
                        const ContentCard(
                          imgIconPath: 'images/timetable.png',
                          text: 'Thời gian khám chính xác, tiện lợi.',
                        ),

                        //Button Dat Hen Kham
                        Center(

                            // height: 80,
                            // padding: const EdgeInsets.all(20),
                            // decoration: BoxDecoration(
                            //   color: Colors.white,
                            //   borderRadius: BorderRadius.circular(12),
                            // ),
                            // child: Image.asset('images/lich-kham.png'),

                            child: TextButton.icon(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: const BorderSide(
                                          color: Colors.blue)))),
                          onPressed: () {},
                          icon: const Icon(Icons.calendar_month),
                          label: const Text(
                            "ĐẶT HẸN KHÁM",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                        )),
                      ],
                    )
                    //),
                    ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ContentCard extends StatelessWidget {
  final String imgIconPath;
  final String text;
  const ContentCard({
    Key? key,
    required this.imgIconPath,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 20),
        SizedBox(
          height: 20,
          // padding: const EdgeInsets.all(20),
          // decoration: BoxDecoration(
          //   color: Colors.blue,
          //   borderRadius: BorderRadius.circular(12),
          // ),
          child: Image.asset(imgIconPath),
        ),
        const SizedBox(height: 40, width: 10),
        Column(
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ListTitle extends StatelessWidget {
  final String iconImgPath;
  final String titleTitle;
  final String titleSubTitle;

  const ListTitle({
    Key? key,
    required this.iconImgPath,
    required this.titleTitle,
    required this.titleSubTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        children: [
          //statistics
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //icon
              Container(
                height: 60,
                // padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.lightBlue[600],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(iconImgPath),
              ),
              // const SizedBox(
              //   width: 20,
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titleTitle,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    titleSubTitle,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              const Icon(Icons.arrow_forward),
            ],
          )
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String imgSrc;
  final String title;
  const CategoryCard({Key? key, required this.imgSrc, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      //It will cover 40% of our total width
      height: size.height * 0.18,
      width: size.width * 0.2,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(
        // left: 10,
        right: 10,
        // top: ,
        // bottom: 50,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        // color: Colors.lightBlue[600],
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(children: <Widget>[
        // const Spacer(),
        Image.asset(
          imgSrc,
          width: 40,
          height: 40,
        ),
        // const Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 15),
        )
      ]),
    );
  }
}

class Banner extends StatelessWidget {
  const Banner({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //It will cover 20% of our total height
      // height: size.height * 0.28,
      // color: Colors.black,
      // child: Stack(
      //   children: <Widget>[
      //     Container(
      //       height: size.height * 0.28 - 27,
      //       decoration: const BoxDecoration(
      //           // color: Color(0xff0047A1),
      //           // color: Colors.blue,
      //           borderRadius: BorderRadius.only(
      //             bottomLeft: Radius.circular(36),
      //             bottomRight: Radius.circular(36),
      //           )),
      //     ),
    
      // child: Expanded(
        // bottom: 0,
        // left: 0,
        // right: 0,
        child: CarouselSlider(
          items: [
            //1st Image of Slider
            Container(
              // margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                  image: AssetImage('images/banner_01.jpg'), 
                  fit: BoxFit.cover
                )
              ),
            ),
            //2st Image of Slider
            Container(
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                  image: AssetImage('images/banner_02.jpg'), 
                  fit: BoxFit.cover
                )
              ),
            ),
            //3st Image of Slider
            Container(
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                  image: AssetImage('images/banner_03.jpg'), 
                  fit: BoxFit.cover
                )
              ),
            ),
            //4st Image of Slider
            Container(
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                  image: AssetImage('images/banner_04.jpg'), 
                  fit: BoxFit.cover
                )
              ),
            ),
            //5st Image of Slider
            Container(
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
               image: const DecorationImage(
                  image: AssetImage('images/banner_05.jpg'), 
                  fit: BoxFit.cover
                )
              ),
            )
          ],
          //Slider Container properties
          options: CarouselOptions(
            height: 180.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(microseconds: 800),
            viewportFraction: 1.0,
          ),
        ),
      //),
    );
  }
}
