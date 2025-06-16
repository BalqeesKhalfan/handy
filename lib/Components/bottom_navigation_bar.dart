import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:homecleaning/Theme/app_theme.dart';

class FancyBottomBar extends StatefulWidget {
  const FancyBottomBar({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  State<FancyBottomBar> createState() => _FancyBottomBarState();
}

class _FancyBottomBarState extends State<FancyBottomBar>
    with SingleTickerProviderStateMixin {
  late int _current;
  late final AnimationController _bounce =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 200));

  static const _tabs = [
    (label: 'Home',     icon: HeroIcons.home),
    (label: 'Explore',  icon: HeroIcons.mapPin),
    (label: 'Bookmark', icon: HeroIcons.bookmark),
    (label: 'Chat',     icon: HeroIcons.chatBubbleBottomCenterText),
    (label: 'Profile',  icon: HeroIcons.user),
  ];

  @override
  void initState() {
    super.initState();
    _current = widget.navigationShell.currentIndex;
  }

  void _select(int i) {
    if (i == _current) return;
    HapticFeedback.lightImpact();  // subtle bump
    _bounce.forward(from: 0);
    setState(() => _current = i);
    widget.navigationShell.goBranch(i, initialLocation: false);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / _tabs.length;

    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: PhysicalModel(
        color: Colors.white,
        elevation: 6,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        child: SafeArea(
          top: false,
          child: SizedBox(
            height: 70,
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                // ── sliding strip ───────────────────────────────
                AnimatedAlign(
                  alignment: Alignment(-1 + 2 / (_tabs.length - 1) * _current, 1),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                  child: Container(width: width, height: 3, color: primaryColor),
                ),
                // ── Row of items ────────────────────────────────
                Row(
                  children: List.generate(_tabs.length, (i) {
                    final active = i == _current;
                    return Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () => _select(i),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeOutQuad,
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          decoration: BoxDecoration(
                            color: active
                                ? primaryColor.withOpacity(.12)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ScaleTransition(
                                scale: active
                                    ? Tween(begin: 1.0, end: 1.2).animate(_bounce)
                                    : const AlwaysStoppedAnimation(1),
                                child: HeroIcon(
                                  _tabs[i].icon,
                                  style: HeroIconStyle.solid,
                                  color: active ? primaryColor : secondaryColor,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                _tabs[i].label,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight:
                                      active ? FontWeight.w600 : FontWeight.w400,
                                  color: active ? primaryColor : secondaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
