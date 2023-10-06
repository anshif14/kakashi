import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';

class productScreen extends StatefulWidget {
  const productScreen({super.key});

  @override
  State<productScreen> createState() => _productScreenState();
}

class _productScreenState extends State<productScreen> {
  ///USED PACKAGE
  /// flutter_advanced_switch: ^3.0.1 FOR TOGGLE BUTTON

  List productList = [
    {
      "name": 'Loco Pizza',
      "veg": true,
      "rating": '4.4',
      'category': 'pizza',
      "offer": 50,
      "price": 9.6,
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Pizza-3007395.jpg/800px-Pizza-3007395.jpg",
      "available": true
    },
    {
      "name": 'biriyani',
      "veg": false,
      "rating": '4.5',
      'category': 'Biriyani',
      "offer": 40,
      "price": 12.6,
      "image":
          "https://nishkitchen.com/wp-content/uploads/2014/01/M-CHICKEN-BIRYANI-1.jpg",
      "available": true
    },
    {
      "name": 'meals',
      "veg": true,
      "rating": '4.0',
      'category': 'meals',
      "offer": 25,
      "price": 5.6,
      "image":
          "https://farm8.staticflickr.com/7671/17269221094_6c0b6605a8_z.jpg",
      "available": true
    },
    {
      "name": 'Vegetable Salad',
      "veg": true,
      "rating": '3.9',
      'category': 'Salads',
      "offer": 50,
      "price": 9.6,
      "image":
          "https://www.acouplecooks.com/wp-content/uploads/2022/02/Vegetable-Salad-009.jpg",
      "available": false
    },
  ];

  List availableProduct = [
    {
      "name": 'Loco Pizza',
      "veg": true,
      "rating": '4.4',
      'category': 'pizza',
      "offer": 50,
      "price": 9.6,
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Pizza-3007395.jpg/800px-Pizza-3007395.jpg",
      "available": true
    },
    {
      "name": 'biriyani',
      "veg": false,
      "rating": '4.5',
      'category': 'Biriyani',
      "offer": 40,
      "price": 12.6,
      "image":
          "https://nishkitchen.com/wp-content/uploads/2014/01/M-CHICKEN-BIRYANI-1.jpg",
      "available": true
    },
    {
      "name": 'meals',
      "veg": true,
      "rating": '4.0',
      'category': 'meals',
      "offer": 25,
      "price": 5.6,
      "image":
          "https://farm8.staticflickr.com/7671/17269221094_6c0b6605a8_z.jpg",
      "available": true
    },
  ];
  List unavailabelProduct = [
    {
      "name": 'Vegetable Salad',
      "veg": true,
      "rating": '3.9',
      'category': 'Salads',
      "offer": 50,
      "price": 9.6,
      "image":
          "https://www.acouplecooks.com/wp-content/uploads/2022/02/Vegetable-Salad-009.jpg",
      "available": false
    },
  ];

  bool select = false;
  bool tap = false;

  int selected = 0;

  final _controller00 = ValueNotifier<bool>(false);
  bool status = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          SizedBox(
            height: width * 0.1,
          ),
          Padding(
            padding: EdgeInsets.all(width * 0.02),
            child: Container(
              height: width * 0.16,
              width: width * 1,
              padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xffA4A0A0).withOpacity(0.25),
                        blurRadius: 90,
                        spreadRadius: 2,
                        offset: Offset(0, 0))
                  ],
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                          height: width * 0.06,
                          width: width * 0.06,
                          child: SvgPicture.asset("assets/images/product.svg")),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      Text(
                        "Add Product",
                        style: GoogleFonts.roboto(
                          fontSize: width * 0.055,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff535353),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: width * 0.12,
                    width: width * 0.17,
                    decoration: BoxDecoration(
                        color: Color(0xffE83B66),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xffFC6187).withOpacity(0),
                              blurRadius: 20,
                              spreadRadius: 1,
                              offset: Offset(0, 0))
                        ],
                        borderRadius: BorderRadius.circular(15)),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: width * 0.08,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: width * 0.05,
          ),
          tap == false
              ? Padding(
                  padding: EdgeInsets.all(width * 0.02),
                  child: InkWell(
                    onTap: () {
                      tap = !tap;
                      setState(() {});
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: width * 0.07,
                              width: width * 0.01,
                              decoration: BoxDecoration(
                                  color: Color(0xffE83B66),
                                  borderRadius: BorderRadius.circular(7)),
                            ),
                            SizedBox(width: width * 0.03),
                            Text(
                              "Menu",
                              style: GoogleFonts.roboto(
                                fontSize: width * 0.05,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff535353),
                              ),
                            )
                          ],
                        ),
                        Icon(Icons.menu_outlined)
                      ],
                    ),
                  ),
                )
              : Container(
                  height: width * 0.1,
                  width: width * 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              select = !select;
                              selected = 1;
                              setState(() {});
                            },
                            child: Container(
                              height: width * 0.09,
                              width: width * 0.39,
                              decoration: BoxDecoration(
                                  color: select == true
                                      ? Color(0xffE83B66)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  "Available",
                                  style: GoogleFonts.roboto(
                                      color: select == true
                                          ? Colors.white
                                          : Color(0xff414141),
                                      fontSize: width * 0.04,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.005,
                          ),
                          InkWell(
                            onTap: () {
                              select = !select;
                              selected = 2;
                              setState(() {});
                            },
                            child: Container(
                              height: width * 0.09,
                              width: width * 0.39,
                              decoration: BoxDecoration(
                                  color: select == true
                                      ? Colors.white
                                      : Color(0xffE83B66),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  "Not Available",
                                  style: GoogleFonts.roboto(
                                      color: select == true
                                          ? Color(0xff414141)
                                          : Colors.white,
                                      fontSize: width * 0.04,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: width * 0.025,
                      ),
                      InkWell(
                        onTap: () {
                          tap = !tap;
                          selected = 0;
                          setState(() {});
                        },
                        child: Container(
                            height: width * 0.09,
                            width: width * 0.09,
                            padding: EdgeInsets.all(width * 0.01),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3)),
                            child: SvgPicture.asset(
                              "assets/close.svg",
                            )),
                      ),
                    ],
                  ),
                ),
          Expanded(
            flex: 0,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: selected == 0
                  ? productList.length
                  : selected == 1
                      ? availableProduct.length
                      : unavailabelProduct.length,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(width * 0.02),
              itemBuilder: (context, index) {
                var data = selected == 0
                    ? productList[index]
                    : selected == 1
                        ? availableProduct[index]
                        : unavailabelProduct[index];
                ;
                return Productoggle(
                    name: data['name'],
                    veg: data['veg'],
                    rating: data['rating'],
                    category: data['category'],
                    offer: data['offer'].toDouble(),
                    price: data['price'].toDouble(),
                    image: data['image'],
                    available: data['available']);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Guestey extends StatefulWidget {
  const Guestey({Key? key}) : super(key: key);

  @override
  State<Guestey> createState() => _GuesteyState();
}

class _GuesteyState extends State<Guestey> {
  bool select = false;
  bool tap = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffE0E0E0),
      body: Container(
        height: width * 1.9,
        width: width * 1,
        padding: EdgeInsets.only(
            left: width * 0.05, right: width * 0.05, top: width * 0.13),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}

class Productoggle extends StatefulWidget {
  const Productoggle(
      {super.key,
      required this.name,
      required this.veg,
      required this.rating,
      required this.category,
      required this.offer,
      required this.price,
      required this.image,
      required this.available});

  // "name":'Loco Pizza',
  //   // "veg":true,
  //   // "rating":'4.4',
  //   // 'category':'pizza',
  //   // "offer":50,
  //   // "price":9.6,
  //   // "image":"https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Pizza-3007395.jpg/800px-Pizza-3007395.jpg",
  //   // "available":true

  final String name;
  final bool veg;
  final String rating;
  final String category;
  final double offer;
  final double price;
  final String image;
  final bool available;

  @override
  State<Productoggle> createState() => _ProductoggleState();
}

class _ProductoggleState extends State<Productoggle> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: width * 0.35,
            width: width * 0.9,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Padding(
              padding: EdgeInsets.all(width * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///Image

                  Container(
                    height: width * 0.30,
                    width: width * 0.30,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(widget.image),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // color: Colors.red,
                            width: width * 0.54,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color(0x1a7d7d7d),
                                                spreadRadius: 1,
                                                blurRadius: 2)
                                          ]),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: width * 0.03,
                                            top: width * 0.01,
                                            bottom: width * 0.01),
                                        child: Row(
                                          children: [
                                            Text(widget.rating),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                                size: width * 0.04,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.03,
                                    ),
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Icon(
                                          Icons.square_outlined,
                                          color: widget.veg
                                              ? Colors.green
                                              : Colors.red,
                                          size: 20,
                                        ),
                                        Icon(Icons.circle,
                                            color: widget.veg
                                                ? Colors.green
                                                : Colors.red,
                                            size: 8),
                                      ],
                                    ),
                                  ],
                                ),

                                ///Toggle

                                GestureDetector(
                                  onTap: () {
                                    status = !status;
                                    setState(() {});
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(seconds: 3),
                                    child:
                                        // InkWell(
                                        //     onTap: (){
                                        //       _controller00.value =!_controller00.value;
                                        //       print(_controller00.value);
                                        //       print(']]]]]]]');
                                        //       setState(() {
                                        //
                                        //       });
                                        //     },
                                        //   child: AdvancedSwitch(
                                        //
                                        //
                                        //     inactiveColor: Color(0xffE83D67),
                                        //     height: width*0.065,
                                        //     thumb: Container(
                                        //       height: width*0.05,
                                        //       width: width*0.05,
                                        //       decoration: BoxDecoration(
                                        //         color: Colors.white
                                        //       ),
                                        //     ),
                                        //
                                        //     borderRadius: BorderRadius.zero,
                                        //     width: 76,
                                        //     controller: _controller00,
                                        //
                                        //   ),
                                        // ),

                                        // FlutterSwitch(
                                        //   width: 125.0,
                                        //   height: 55.0,
                                        //   valueFontSize: 25.0,
                                        //   toggleSize: 45.0,
                                        //   value: status,
                                        //   borderRadius: 5.0,
                                        //   padding: 8.0,
                                        //   showOnOff: false,
                                        //   activeColor:   Color(0x8f48e98b),
                                        //
                                        //   inactiveColor:Color(0xffE83D67),
                                        //   activeIcon:Container(
                                        //     height: width*0.005,
                                        //     width: width*0.005,
                                        //     decoration: BoxDecoration(
                                        //         color: Colors.red
                                        //     ),
                                        //   ),
                                        //   inactiveIcon: Container(
                                        //     height: width*0.05,
                                        //     width: width*0.05,
                                        //     decoration: BoxDecoration(
                                        //         color: Colors.white
                                        //     ),
                                        //   ),
                                        //   onToggle: (val) {
                                        //     setState(() {
                                        //       status = val;
                                        //     });
                                        //   },
                                        // ),

                                        Center(
                                      child: AnimatedContainer(
                                        alignment: status
                                            ? Alignment.topLeft
                                            : Alignment.bottomRight,
                                        height: status ? 5 : 20,
                                        width: status ? 10 : 15,
                                        color: Colors.white,
                                        duration: Duration(seconds: 2),
                                        curve: Curves.fastOutSlowIn,
                                      ),
                                    ),
                                    height: width * 0.07,
                                    width: width * 0.13,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(width * 0.01),
                                        color: Color(0xff48E98B),
                                        boxShadow: [
                                          BoxShadow(
                                              color: status
                                                  ? Color(0x8f48e98b)
                                                  : Color(0xffE83D67),
                                              blurRadius: 10,
                                              spreadRadius: 0.1)
                                        ]),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: width * 0.025,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.name,
                                style: TextStyle(
                                    fontFamily: 'roboto',
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: width * 0.01,
                              ),
                              Row(
                                children: [
                                  Text(
                                    widget.category,
                                    style: TextStyle(
                                        color: Color(0xff848484),
                                        fontSize: width * 0.028),
                                  ),
                                  SizedBox(
                                    width: width * 0.025,
                                  ),
                                  Container(
                                    height: width * 0.028,
                                    width: width * 0.001,
                                    color: Colors.black87,
                                  ),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  Text(
                                    widget.available
                                        ? "Available"
                                        : "Unavailable",
                                    style: TextStyle(
                                        color: widget.available
                                            ? Colors.green
                                            : Colors.red,
                                        fontSize: width * 0.025),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        '\$ ${widget.price}',
                        style: TextStyle(fontSize: width * 0.05),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: width * 0.02,
            right: width * 0.018,
            child: Container(
              height: width * 0.07,
              width: width * 0.27,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xffE83B66)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset('assets/svg/offer.svg'),
                  Text(
                    '${widget.rating}% OFF',
                    style:
                        TextStyle(color: Colors.white, fontSize: width * 0.035),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
    ;
  }
}
