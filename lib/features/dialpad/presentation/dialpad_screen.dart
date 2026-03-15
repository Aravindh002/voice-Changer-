import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/primary_button.dart';

class DialPadScreen extends StatefulWidget {
  const DialPadScreen({super.key});

  @override
  State<DialPadScreen> createState() => _DialPadScreenState();
}

class _DialPadScreenState extends State<DialPadScreen> {
  String _number = '';

  void _append(String value) => setState(() => _number += value);
  void _backspace() => setState(() {
        if (_number.isNotEmpty) _number = _number.substring(0, _number.length - 1);
      });

  @override
  Widget build(BuildContext context) {
    const keys = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '*', '0', '#'];
    return Scaffold(
      appBar: AppBar(title: const Text('Dial Pad')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(_number.isEmpty ? 'Enter phone number' : _number, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                itemCount: keys.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (_, i) => FilledButton.tonal(
                  onPressed: () => _append(keys[i]),
                  child: Text(keys[i], style: Theme.of(context).textTheme.titleLarge),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    label: 'Call',
                    icon: Icons.call,
                    onPressed: _number.isEmpty ? null : () => context.push('/call/$_number'),
                  ),
                ),
                IconButton(onPressed: _backspace, icon: const Icon(Icons.backspace_outlined)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
