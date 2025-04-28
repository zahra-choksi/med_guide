import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/reusable_widgets.dart';
import '../bloc/medicine_bloc.dart';
import '../bloc/medicine_event.dart';
import '../bloc/medicine_state.dart';
import '../widgets/appbar_widgets.dart';
import '../widgets/medicine_card.dart';

class MedicinePage extends StatefulWidget {
  @override
  _MedicinePageState createState() => _MedicinePageState();
}

class _MedicinePageState extends State<MedicinePage> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: richText(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter medicine name',
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.pink, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 10),

            eleButton(
                func: () {
                  context.read<MedicineBloc>().add(FetchMedicine(_controller.text));
                }, text: 'Search'

            ),

            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<MedicineBloc, MedicineState>(
                builder: (context, state) {
                  if (state is MedicineLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is MedicineLoaded) {
                    return MedicineCard(medicine: state.medicine);
                  } else if (state is MedicineFailure) {
                    return Center(child: Text(state.message));
                  }
                  return const Center(
                      child: Text(
                          'Enter a medicine name to begin.',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black
                        ),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
