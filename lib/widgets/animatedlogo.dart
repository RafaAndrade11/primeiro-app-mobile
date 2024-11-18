import 'package:flutter/material.dart';

//Responsabilidades: controle da animação
class AnimatedSplashLogo extends StatefulWidget {
  const AnimatedSplashLogo({
    super.key,
  });

  @override
  State<AnimatedSplashLogo> createState() => _AnimatedSplashLogoState();
}

class _AnimatedSplashLogoState extends State<AnimatedSplashLogo>
    with SingleTickerProviderStateMixin {
  late final Animation<double> _animation;
  late final AnimationController _animationController;
  bool hasBlur = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    //tween de tamanho
    _animation = Tween<double>(begin: 100.0, end: 150.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.addStatusListener((status) {
      setState(() {
        hasBlur = status == AnimationStatus.reverse;
      });
    });

    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    // Libere os recursos do controller
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        child: Image.asset(
          'assets/icons/logo.png',
          fit: BoxFit.contain,
        ),
        builder: (context, child) {
          return Container(
            width: _animation.value,
            height: _animation.value,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.blue.withOpacity(0.5),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.transparent,
                width: 3,
              ),
              boxShadow: hasBlur
                  ? []
                  : [
                      const BoxShadow(
                        color: Colors.blue,
                        blurRadius: 18,
                        spreadRadius: 9,
                      ),
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.5),
                        blurRadius: 18,
                        spreadRadius: 9,
                      ),
                    ],
            ),
            child: child,
          );
        },
      ),
    );
  }
}