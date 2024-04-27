import 'package:flutter/material.dart';
import 'candidate.dart';

class FriendsPage extends StatelessWidget {
  final Function(Candidate) onCandidateAdded;

  FriendsPage({
    required this.onCandidateAdded,
  });

  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController partyController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController dobController =
      TextEditingController(); // Contrôleur pour la date de naissance

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null)
      dobController.text = picked
          .toString(); // Met à jour le champ texte avec la date sélectionnée
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulaire'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nom'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir un nom';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir une description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: partyController,
                decoration: InputDecoration(labelText: 'Parti politique'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir un parti politique';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: imageUrlController,
                decoration: InputDecoration(labelText: 'URL de la photo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir une URL de photo';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller:
                    dobController, // Utilise le contrôleur pour la date de naissance
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Date de naissance',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () =>
                        _selectDate(context), // Ouvre le sélecteur de date
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner une date de naissance';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Candidate candidate = Candidate(
                      name: nameController.text,
                      description: descriptionController.text,
                      party: partyController.text,
                      imageUrl: imageUrlController.text,
                      dateOfBirth:
                          dobController.text, // Enregistre la date de naissance
                    );
                    onCandidateAdded(candidate);
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: Text('Sauvegarder'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
