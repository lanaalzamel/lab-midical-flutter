// hild: CarouselSlider(
// carouselController: _controller,
// items: [
// // loop through your list of photos and create image widgets
// for (String image in _slideImages)
// ClipRRect(
// borderRadius: BorderRadius.circular(8.0), //
//
// child: Image.asset(
// 'asset/images/$image',
// fit: BoxFit.cover,
// ),
// ),
// ],
// options: CarouselOptions(
// height: 200,
// // set the height of the slider
// //autoPlay: true, // enable auto play mode
// enlargeCenterPage: true,
// // enlarge the center page
// aspectRatio: 16 / 9,
// // set the aspect ratio
// autoPlayCurve: Curves.fastOutSlowIn,
// // set the animation curve
// enableInfiniteScroll: true,
// // enable infinite scrolling
// autoPlayAnimationDuration: Duration(milliseconds: 800),
// // set the animation duration
// viewportFraction: 0.8,
// // set the viewport fraction
// onPageChanged: (index, reason) {
// setState(() {
// _current = index;
// });
// }),
// ),
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: _slideImages.asMap().entries.map((entry) {
// return GestureDetector(
// onTap: () => _controller.animateToPage(entry.key),
// child: Container(
// width: 12.0,
// height: 12.0,
// margin:
// EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
// decoration: BoxDecoration(
// shape: BoxShape.circle,
// color: (Theme.of(context).brightness ==
// Brightness.dark
// ? Colors.white
//     : Colors.black)
//     .withOpacity(_current == entry.key ? 0.9 : 0.4)),
// ),
// );
// }).toList(),
// ),
// SizedBox(height: 15),