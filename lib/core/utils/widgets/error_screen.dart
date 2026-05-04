import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_structure/core/config/router/app_routes.dart';
import 'package:project_structure/core/config/theme/color.dart';
import 'package:project_structure/core/utils/classes/size_config.dart';
import 'package:project_structure/core/utils/extensions/context_extension.dart';

class ErrorScreen extends StatefulWidget {
  final String? message;

  const ErrorScreen({
    super.key,
    this.message,
  });

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late AnimationController _scaleController;
  late AnimationController _pulseController;

  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _startAnimations();
  }

  void _setupAnimations() {
    // Fade animation for overall content
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    // Slide animation for content
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOut));

    // Scale animation for image
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut),
    );

    // Pulse animation for image container
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  void _startAnimations() {
    Future.delayed(const Duration(milliseconds: 100), () {
      _fadeController.forward();
    });

    Future.delayed(const Duration(milliseconds: 200), () {
      _slideController.forward();
    });

    Future.delayed(const Duration(milliseconds: 300), () {
      _scaleController.forward();
    });

    // Start pulsing animation and repeat
    Future.delayed(const Duration(milliseconds: 1000), () {
      _pulseController.repeat(reverse: true);
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _scaleController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile =
        SizeConfig.mobileMaxWidth > MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: _buildResponsiveContent(context, isMobile),
          ),
        ),
      ),
    );
  }

  Widget _buildResponsiveContent(
    BuildContext context,
    bool isMobile,
  ) {
    final horizontalPadding = isMobile ? 24.0 : 48.0;
    final imageSize = isMobile ? 160.0 : 200.0;
    final containerSize = imageSize + 40;

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Animated error illustration
                    AnimatedBuilder(
                      animation: _pulseAnimation,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _pulseAnimation.value,
                          child: ScaleTransition(
                            scale: _scaleAnimation,
                            child: SizedBox(
                              width: containerSize,
                              height: containerSize,
                              child: Center(
                                child: Image.asset(
                                  'assets/images/comic.png',
                                  width: imageSize * 0.6,
                                  height: imageSize * 0.6,
                                  fit: BoxFit.contain,
                                  color: ColorsPalette.error,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                    SizedBox(height: isMobile ? 32 : 48),

                    // Error title with responsive typography
                    Text(
                      context.tr('Oops! Something went wrong'),
                      style: context.typography.h4Bold,
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: isMobile ? 16 : 24),

                    // Responsive action buttons
                    _buildActionButtons(context, isMobile),

                    SizedBox(height: isMobile ? 24 : 32),

                    // Additional help text
                    Text(
                      context.tr(
                          'If the problem persists, please contact our support team.'),
                      style: context.typography.bodyMediumMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildActionButtons(
    BuildContext context,
    bool isMobile,
  ) {
    final buttonWidth = isMobile ? double.infinity : 280.0;
    final buttonHeight = isMobile ? 56.0 : 60.0;

    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Column(
        children: [
          SizedBox(
            width: buttonWidth,
            height: buttonHeight,
            child: OutlinedButton.icon(
              onPressed: () async {
                context.go(AppRoutes.homeView);
              },
              icon: const Icon(Icons.home),
              label: Text(context.tr('Go to Home')),
              style: OutlinedButton.styleFrom(
                foregroundColor: ColorsPalette.primary500,
                side: BorderSide(
                  color: ColorsPalette.primary500,
                  width: 1.5,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: isMobile ? 16 : 20,
                  horizontal: 24,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
