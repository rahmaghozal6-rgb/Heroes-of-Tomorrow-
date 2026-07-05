import 'package:flutter/material.dart';

class SuperBooWidget extends StatefulWidget {
  final bool isTalking;
  final bool isListening;

  const SuperBooWidget({
    super.key,
    required this.isTalking,
    required this.isListening,
  });

  @override
  State<SuperBooWidget> createState() => _SuperBooWidgetState();
}

class _SuperBooWidgetState extends State<SuperBooWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bounceAnim;
  bool _mouthOpen = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed && widget.isTalking) {
          _controller.forward();
          setState(() => _mouthOpen = !_mouthOpen);
        }
      });

    _bounceAnim = Tween<double>(begin: 0, end: -8).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void didUpdateWidget(SuperBooWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isTalking && !oldWidget.isTalking) {
      _controller.forward();
    } else if (!widget.isTalking && oldWidget.isTalking) {
      _controller.stop();
      _controller.reset();
      setState(() => _mouthOpen = false);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _bounceAnim,
      builder: (_, child) => Transform.translate(
        offset: Offset(0, _bounceAnim.value),
        child: child,
      ),
      child: SizedBox(
        width: 80,
        height: 100,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // جسم سوبر بو
            widget.isTalking
                ? Image.asset(
                    'assets/images/superboo_talking.png',
                    width: 80,
                    errorBuilder: (_, __, ___) => _buildFallbackSuperboo(true),
                  )
                : widget.isListening
                    ? Image.asset(
                        'assets/images/superboo_listening.png',
                        width: 80,
                        errorBuilder: (_, __, ___) =>
                            _buildFallbackSuperboo(false),
                      )
                    : Image.asset(
                        'assets/images/superboo_idle.png',
                        width: 80,
                        errorBuilder: (_, __, ___) =>
                            _buildFallbackSuperboo(false),
                      ),
          ],
        ),
      ),
    );
  }

  Widget _buildFallbackSuperboo(bool talking) {
    return Container(
      width: 80,
      height: 95,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        border: Border.all(color: Colors.black87, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // القناع الأزرق
          Container(
            width: 68,
            height: 22,
            decoration: BoxDecoration(
              color: const Color(0xFF3D6BE8),
              borderRadius: BorderRadius.circular(11),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildEye(),
                const SizedBox(width: 14),
                _buildEye(),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // الفم
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: talking && _mouthOpen ? 18 : 12,
            height: talking && _mouthOpen ? 10 : 5,
            decoration: BoxDecoration(
              color: talking && _mouthOpen
                  ? Colors.red.shade300
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey.shade400, width: 1.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEye() {
    return Container(
      width: 14,
      height: 14,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Container(
          width: 4,
          height: 4,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
