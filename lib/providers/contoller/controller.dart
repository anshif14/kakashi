import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakashi/providers/poviders.dart';

final userDataStreamProvider=StreamProvider((ref) => ref.watch(userProvider).getUser());