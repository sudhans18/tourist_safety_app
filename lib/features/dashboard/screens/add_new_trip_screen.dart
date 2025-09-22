import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tourist_safety_app/core/providers/trip_provider.dart';

class AddNewTripScreen extends StatefulWidget {
  const AddNewTripScreen({super.key});

  @override
  State<AddNewTripScreen> createState() => _AddNewTripScreenState();
}

class _AddNewTripScreenState extends State<AddNewTripScreen> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _destinationCtrl = TextEditingController();
  final _notesCtrl = TextEditingController();

  late DateTime _startDate;
  late DateTime _endDate;

  // Entrance animation flags
  bool _showName = false;
  bool _showDestination = false;
  bool _showDates = false;
  bool _showNotes = false;
  bool _showButtons = false;

  // Save button pulse
  late final AnimationController _pulseCtrl;
  late final Animation<double> _pulse;

  // Shake animations for validation
  late final AnimationController _shakeName;
  late final AnimationController _shakeDestination;
  late final AnimationController _shakeDates;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _startDate = now.add(const Duration(days: 1));
    _endDate = now.add(const Duration(days: 3));

    _pulseCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200))
      ..repeat(reverse: true);
    _pulse = Tween<double>(begin: 1.0, end: 1.04).animate(CurvedAnimation(parent: _pulseCtrl, curve: Curves.easeInOut));

    _shakeName = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
    _shakeDestination = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
    _shakeDates = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));

    _runStagger();
  }

  void _runStagger() async {
    await Future.delayed(const Duration(milliseconds: 60));
    if (!mounted) return; setState(() => _showName = true);
    await Future.delayed(const Duration(milliseconds: 90));
    if (!mounted) return; setState(() => _showDestination = true);
    await Future.delayed(const Duration(milliseconds: 90));
    if (!mounted) return; setState(() => _showDates = true);
    await Future.delayed(const Duration(milliseconds: 90));
    if (!mounted) return; setState(() => _showNotes = true);
    await Future.delayed(const Duration(milliseconds: 90));
    if (!mounted) return; setState(() => _showButtons = true);
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _destinationCtrl.dispose();
    _notesCtrl.dispose();
    _pulseCtrl.dispose();
    _shakeName.dispose();
    _shakeDestination.dispose();
    _shakeDates.dispose();
    super.dispose();
  }

  Future<void> _pickDate({required bool start}) async {
    final initial = start ? _startDate : _endDate;
    final first = DateTime.now().subtract(const Duration(days: 365));
    final last = DateTime.now().add(const Duration(days: 365 * 2));
    final picked = await showDatePicker(context: context, initialDate: initial, firstDate: first, lastDate: last);
    if (picked != null) {
      setState(() {
        if (start) {
          _startDate = picked;
          if (_endDate.isBefore(_startDate)) {
            _endDate = _startDate.add(const Duration(days: 1));
          }
        } else {
          _endDate = picked;
          if (_startDate.isAfter(_endDate)) {
            _startDate = _endDate.subtract(const Duration(days: 1));
          }
        }
      });
    }
  }

  void _triggerShake(AnimationController ctrl) async {
    if (ctrl.isAnimating) return;
    await ctrl.forward();
    ctrl.reset();
  }

  bool _validate() {
    bool ok = true;
    if (_nameCtrl.text.trim().isEmpty) {
      ok = false;
      _triggerShake(_shakeName);
    }
    if (_destinationCtrl.text.trim().isEmpty) {
      ok = false;
      _triggerShake(_shakeDestination);
    }
    if (_endDate.isBefore(_startDate)) {
      ok = false;
      _triggerShake(_shakeDates);
    }
    return ok;
  }

  void _save() {
    if (!_validate()) return;
    context.read<TripProvider>().addTrip(
          name: _nameCtrl.text.trim(),
          destination: _destinationCtrl.text.trim(),
          startDate: _startDate,
          endDate: _endDate,
          notes: _notesCtrl.text.trim(),
        );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final dateFmt = DateFormat('MMM dd, yyyy');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Trip'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _SlideIn(
              show: _showName,
              child: _Shake(
                controller: _shakeName,
                child: TextFormField(
                  controller: _nameCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Trip Name',
                    prefixIcon: Icon(Icons.title),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            _SlideIn(
              show: _showDestination,
              child: _Shake(
                controller: _shakeDestination,
                child: TextFormField(
                  controller: _destinationCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Destination',
                    prefixIcon: Icon(Icons.location_on),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            _SlideIn(
              show: _showDates,
              child: _Shake(
                controller: _shakeDates,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => _pickDate(start: true),
                        child: InputDecorator(
                          decoration: const InputDecoration(
                            labelText: 'Start Date',
                            prefixIcon: Icon(Icons.calendar_today),
                          ),
                          child: Text(dateFmt.format(_startDate)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: InkWell(
                        onTap: () => _pickDate(start: false),
                        child: InputDecorator(
                          decoration: const InputDecoration(
                            labelText: 'End Date',
                            prefixIcon: Icon(Icons.calendar_today),
                          ),
                          child: Text(dateFmt.format(_endDate)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            _SlideIn(
              show: _showNotes,
              child: TextFormField(
                controller: _notesCtrl,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Activities / Notes',
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.notes),
                ),
              ),
            ),
            const SizedBox(height: 24),
            _SlideIn(
              show: _showButtons,
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(context).maybePop(),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: const BorderSide(color: Color(0xFFD1D5DB)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        foregroundColor: const Color(0xFF111827),
                        backgroundColor: Colors.white,
                      ),
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ScaleTransition(
                      scale: _pulse,
                      child: ElevatedButton(
                        onPressed: _save,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFD93F34),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text('Save Trip'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SlideIn extends StatelessWidget {
  final bool show;
  final Widget child;
  const _SlideIn({required this.show, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: show ? 1 : 0,
      duration: const Duration(milliseconds: 320),
      curve: Curves.easeOut,
      child: AnimatedSlide(
        offset: show ? Offset.zero : const Offset(0, 0.1),
        duration: const Duration(milliseconds: 320),
        curve: Curves.easeOut,
        child: child,
      ),
    );
  }
}

class _Shake extends StatelessWidget {
  final AnimationController controller;
  final Widget child;
  const _Shake({required this.controller, required this.child});

  @override
  Widget build(BuildContext context) {
    final animation = Tween(begin: 0.0, end: 8.0)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(controller);
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        return Transform.translate(
          offset: Offset(animation.value, 0),
          child: child,
        );
      },
    );
  }
}
