import 'package:flutter/material.dart';

class RadarPage extends StatefulWidget {
  const RadarPage({super.key});

  @override
  State<RadarPage> createState() => _RadarPageState();
}

class _RadarPageState extends State<RadarPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final String imageUrl =
      'https://user-images.githubusercontent.com/58719230/218909229-67867fec-6f4a-43fb-bfc3-33d6bc42ae2e.png';

  @override
  void initState() {
    _controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 20))
      ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(imageUrl), fit: BoxFit.cover),
        ),
        child: RadarSignal(controller: _controller),
      ),
    );
  }
}

class RadarSignal extends StatelessWidget {
  const RadarSignal({
    super.key,
    required AnimationController controller,
  }) : _controller = controller;

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(

      height:300 ,
      width: 300,decoration: BoxDecoration(
      shape: BoxShape.circle
    ),
      child: RotationTransition(
        turns: Tween(begin: 0.0, end: 4.0).animate(_controller),
        child: Container(
          height:300 ,
          width: 300,
          decoration: const BoxDecoration(

            gradient: SweepGradient(
              center: FractionalOffset.center,
              colors: <Color>[
                Colors.transparent,
                Color(0xFF34A853),
                Colors.transparent,
              ],
              stops: <double>[0.20, 0.25, 0.20],
            ),
          ),
        ),
      ),
    );
  }
}
