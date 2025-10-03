import 'package:flutter/material.dart';
import 'package:tourist_safety_app/l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:tourist_safety_app/core/providers/trip_provider.dart';
import 'package:tourist_safety_app/core/models/trip.dart';
import 'package:flutter/rendering.dart' show ScrollDirection;
import 'package:tourist_safety_app/features/dashboard/screens/add_new_trip_screen.dart';
import 'package:tourist_safety_app/core/design/animated_components.dart';
import 'package:tourist_safety_app/core/design/modern_theme.dart';

class TourPlanScreen extends StatefulWidget {
  const TourPlanScreen({super.key});

  @override
  State<TourPlanScreen> createState() => _TourPlanScreenState();
}

class _TourPlanScreenState extends State<TourPlanScreen> {
  final ScrollController _scrollController = ScrollController();
  double _fabScale = 1.0;
  double _fabAlpha = 1.0;
  bool _isScrollingDown = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final directionDown = _scrollController.position.userScrollDirection ==
        ScrollDirection.reverse;
    if (directionDown != _isScrollingDown) {
      setState(() {
        _isScrollingDown = directionDown;
        _fabScale = directionDown ? 0.9 : 1.05;
        _fabAlpha = directionDown ? 0.8 : 1.0;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final tripProvider = context.watch<TripProvider>();
    final upcoming = tripProvider.upcomingTrips;
    final past = tripProvider.pastTrips;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          t.tourPlan,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButton: AnimatedOpacity(
        opacity: _fabAlpha,
        duration: const Duration(milliseconds: 200),
        child: AnimatedScale(
          scale: _fabScale,
          duration: const Duration(milliseconds: 200),
          child: FloatingActionButton.extended(
            heroTag: 'add_trip_fab',
            backgroundColor: const Color(0xFFD93F34),
            foregroundColor: Colors.white,
            icon: const Icon(Icons.add),
            label: Text(t.addNewTrip),
            onPressed: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 350),
                  reverseTransitionDuration: const Duration(milliseconds: 280),
                  pageBuilder: (_, a1, a2) => const AddNewTripScreen(),
                  transitionsBuilder: (_, a1, a2, child) {
                    final curved = CurvedAnimation(
                        parent: a1,
                        curve: Curves.easeOutCubic,
                        reverseCurve: Curves.easeInCubic);
                    return FadeTransition(
                      opacity: curved,
                      child: SlideTransition(
                        position: Tween<Offset>(
                                begin: const Offset(0, 1), end: Offset.zero)
                            .animate(curved),
                        child: child,
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/onboarding_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withValues(alpha: 0.35),
              BlendMode.darken,
            ),
          ),
        ),
        child: SafeArea(
          child: ListView(
            controller: _scrollController,
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 96),
            children: [
          const _AnimatedHeader(title: 'Upcoming'),
          const SizedBox(height: 8),
          if (upcoming.isEmpty)
            _EmptyState(message: t.noUpcomingTrips)
          else
            ...List.generate(
              upcoming.length,
              (i) => _StaggeredTripCard(
                index: i,
                child: _TripCard(trip: upcoming[i]),
              ),
            ),
          const SizedBox(height: 24),
          const _AnimatedHeader(title: 'Past'),
          const SizedBox(height: 8),
          if (past.isEmpty)
            _EmptyState(message: t.noPastTrips)
          else
            ...List.generate(
              past.length,
              (i) => _StaggeredTripCard(
                index: i,
                child: _TripCard(trip: past[i]),
              ),
            ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 1, // Tour Plan is index 1
        onDestinationSelected: (i) {
          if (i == 0) Navigator.pushReplacementNamed(context, '/dashboard');
          if (i == 1) return; // Already on Tour Plan
          if (i == 2) Navigator.pushReplacementNamed(context, '/map-fullscreen');
          if (i == 3) Navigator.pushReplacementNamed(context, '/alerts');
          if (i == 4) Navigator.pushReplacementNamed(context, '/profile');
        },
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.dashboard_outlined),
              selectedIcon: Icon(Icons.dashboard),
              label: 'Dashboard'),
          NavigationDestination(
              icon: Icon(Icons.event_note_outlined),
              selectedIcon: Icon(Icons.event_note),
              label: 'Tour Plan'),
          NavigationDestination(
              icon: Icon(Icons.map_outlined),
              selectedIcon: Icon(Icons.map),
              label: 'Map'),
          NavigationDestination(
              icon: Icon(Icons.notifications_outlined),
              selectedIcon: Icon(Icons.notifications),
              label: 'Alerts'),
          NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: 'Profile'),
        ],
      ),
    );
  }
}

class _AnimatedHeader extends StatefulWidget {
  final String title;
  const _AnimatedHeader({required this.title});

  @override
  State<_AnimatedHeader> createState() => _AnimatedHeaderState();
}

class _AnimatedHeaderState extends State<_AnimatedHeader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;
  late final Animation<Offset> _offset;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..forward();
    _opacity = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _offset = Tween(begin: const Offset(-0.1, 0), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: SlideTransition(
        position: _offset,
        child: Text(
          widget.title,
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white),
        ),
      ),
    );
  }
}

class _StaggeredTripCard extends StatefulWidget {
  final int index;
  final Widget child;
  const _StaggeredTripCard({required this.index, required this.child});

  @override
  State<_StaggeredTripCard> createState() => _StaggeredTripCardState();
}

class _StaggeredTripCardState extends State<_StaggeredTripCard> {
  bool _start = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 80 * widget.index), () {
      if (mounted) setState(() => _start = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _start ? 1 : 0,
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeOut,
      child: AnimatedSlide(
        offset: _start ? Offset.zero : const Offset(0, 0.1),
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeOut,
        child: widget.child,
      ),
    );
  }
}

class _TripCard extends StatefulWidget {
  final Trip trip;
  const _TripCard({required this.trip});

  @override
  State<_TripCard> createState() => _TripCardState();
}

class _TripCardState extends State<_TripCard> {
  double _scale = 1.0;

  void _onTapDown(_) => setState(() => _scale = 1.05);
  void _onTapCancel() => setState(() => _scale = 1.0);

  void _openDetails() {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (_, a1, a2) => FadeTransition(
          opacity: a1,
          child: SlideTransition(
            position:
                Tween<Offset>(begin: const Offset(0, 0.05), end: Offset.zero)
                    .animate(a1),
            child: _TripDetailsScreen(trip: widget.trip),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('MMM dd, yyyy');
    final trip = widget.trip;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 120),
        child: GestureDetector(
          onTapDown: _onTapDown,
          onTapUp: (_) {
            _onTapCancel();
            _openDetails();
          },
          onTapCancel: _onTapCancel,
          child: SurfaceCard(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Hero(
                  tag: 'trip-img-${trip.id}',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: SizedBox(
                      width: 72,
                      height: 72,
                      child: trip.imageUrl != null
                          ? Image.network(trip.imageUrl!, fit: BoxFit.cover)
                          : Container(
                              color: ModernColors.neutral200,
                              child: const Icon(Icons.image,
                                  color: ModernColors.neutral400)),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        trip.destination,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: ModernColors.neutral900),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${dateFormat.format(trip.startDate)} - ${dateFormat.format(trip.endDate)}',
                        style: const TextStyle(
                            fontSize: 13, color: ModernColors.neutral600),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.chevron_right, color: ModernColors.neutral400),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final String message;
  const _EmptyState({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      child: SurfaceCard(
        child: Row(
          children: [
            const Icon(Icons.info_outline, color: ModernColors.neutral600),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: ModernColors.neutral600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TripDetailsScreen extends StatelessWidget {
  final Trip trip;
  const _TripDetailsScreen({required this.trip});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final dateFormatLong = DateFormat('EEEE, MMM dd, yyyy');
    return Scaffold(
      appBar: AppBar(title: Text(trip.destination)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Hero(
            tag: 'trip-img-${trip.id}',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: SizedBox(
                height: 180,
                child: trip.imageUrl != null
                    ? Image.network(trip.imageUrl!, fit: BoxFit.cover)
                    : Container(
                        color: const Color(0xFFE5E7EB),
                        child:
                            const Icon(Icons.image, color: Color(0xFF9CA3AF))),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(trip.name,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.calendar_today,
                  size: 16, color: Color(0xFF6B7280)),
              const SizedBox(width: 6),
              Text(
                '${dateFormatLong.format(trip.startDate)} - ${dateFormatLong.format(trip.endDate)}',
                style: const TextStyle(color: Color(0xFF6B7280)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (trip.notes.isNotEmpty) ...[
            Text(t.activitiesNotes,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Text(trip.notes, style: const TextStyle(fontSize: 14, height: 1.4)),
          ],
        ],
      ),
    );
  }
}
