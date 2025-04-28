import '../entity/medicine.dart';

final List<Medicine> medicines = [
//1
Medicine(
name: 'Paracetamol',
uses: 'Used to relieve fever and mild pain',
sideEffects: 'Nausea, rash, liver damage (rare)',
),
//2
Medicine(
name: 'Amoxicillin',
uses: 'Treats bacterial infections',
sideEffects: 'Diarrhea, skin rash, allergic reactions',
),
//3
Medicine(
name: 'Ibuprofen',
uses: 'Used for pain relief, inflammation, and fever',
sideEffects: 'Stomach pain, heartburn, nausea, increased risk of bleeding',
),
//4
Medicine(
name: 'Aspirin',
uses: 'Used to reduce pain, inflammation, and prevent heart attacks',
sideEffects: 'Stomach ulcers, bleeding, allergic reactions',
),
//5
Medicine(
name: 'Cetirizine',
uses: 'Used to relieve allergy symptoms such as runny nose and sneezing',
sideEffects: 'Drowsiness, dry mouth, dizziness',
),
//6
Medicine(
name: 'Metformin',
uses: 'Used to control blood sugar levels in type 2 diabetes',
sideEffects: 'Nausea, vomiting, abdominal discomfort, lactic acidosis (rare)',
),
//7
Medicine(
name: 'Loratadine',
uses: 'Used to treat allergy symptoms without causing drowsiness',
sideEffects: 'Headache, dry mouth, fatigue',
),
//8
Medicine(
name: 'Azithromycin',
uses: 'Antibiotic used to treat respiratory and skin infections.',
sideEffects: 'Diarrhea, nausea, abdominal pain',
),
//9
Medicine(
name: 'Omeprazole',
uses: 'Used to treat acid reflux and stomach ulcers',
sideEffects: 'Headache, abdominal pain, diarrhea, vitamin B12 deficiency (long-term)',
),
//10
Medicine(
name: 'Dolo 650',
uses: 'Used for fever and mild to moderate pain relief.',
sideEffects: 'Liver damage in overdose, allergic reactions.',
),
//11
Medicine(
name: 'Diazepam',
uses: 'Used to relieve anxiety, muscle spasms, and seizures.',
sideEffects: 'Drowsiness, dizziness, blurred vision.',
),
//12
Medicine(
name: 'Alprazolam',
uses: 'Used for anxiety and panic disorders.',
sideEffects: 'Drowsiness, dizziness, memory problems.',
),
//13
Medicine(
name: 'Clonazepam',
uses: 'Used to prevent seizures and anxiety.',
sideEffects: 'Drowsiness, dizziness, difficulty concentrating.',
),
//14
Medicine(
name: 'Gabapentin',
uses: 'Used to treat nerve pain and seizures.',
sideEffects: 'Dizziness, drowsiness, tiredness.',
),
//15
Medicine(
name: 'Pregabalin',
uses: 'Used for nerve pain, fibromyalgia, and seizures.',
sideEffects: 'Dizziness, drowsiness, weight gain.',
),
//16
Medicine(
name: 'Hydrochlorothiazide',
uses: 'Used to treat high blood pressure and fluid retention.',
sideEffects: 'Dizziness, dehydration, low potassium levels.',
),
//17
Medicine(
name: 'Losartan',
uses: 'Used to treat high blood pressure and heart failure.',
sideEffects: 'Dizziness, headache, fatigue.',
),
//18
Medicine(
name: 'Enalapril',
uses: 'Used to treat high blood pressure and heart failure.',
sideEffects: 'Dizziness, headache, cough.',
),
//19
Medicine(
name: 'Amlodipine',
uses: 'Used to treat high blood pressure and chest pain.',
sideEffects: 'Swelling, dizziness, fatigue.',
),
//20
Medicine(
name: 'Simvastatin',
uses: 'Used to lower cholesterol levels.',
sideEffects: 'Muscle pain, liver problems, nausea.',
),
//21
Medicine(
name: 'Atorvastatin',
uses: 'Used to lower cholesterol levels and reduce heart disease risk',
sideEffects: 'Muscle pain, liver problems, headache.',
),
//22
Medicine(
name: 'Metoprolol',
uses: 'Used to treat high blood pressure and chest pain.',
sideEffects: 'Fatigue, dizziness, shortness of breath.',
),
//23
Medicine(
name: 'Carvedilol',
uses: 'Used for heart failure and high blood pressure.',
sideEffects: 'Dizziness, fatigue, weight gain',
),
//24
Medicine(
name: 'Furosemide',
uses: 'Used to treat fluid retention and swelling.',
sideEffects: 'Dizziness, dehydration, low potassium.',
),
//25
Medicine(
name: 'Spironolactone',
uses: 'Used to treat high blood pressure and fluid retention.',
sideEffects: 'Dizziness, tiredness, increased potassium.',
),
//26
Medicine(
name: 'Hydroxychloroquine',
uses: 'Used to treat malaria and autoimmune diseases like lupus.',
sideEffects: 'Headache, dizziness, stomach upset.',
),
//27
Medicine(
name: 'Methotrexate',
uses: 'Used for cancer treatment and autoimmune diseases.',
sideEffects: 'Nausea, mouth sores, liver problems.',
),
//28
Medicine(
name: 'Azathioprine',
uses: 'Used to prevent organ rejection and treat autoimmune diseases.',
sideEffects: 'Nausea, fatigue, liver problems',
),
//29
Medicine(
name: 'Prednisone',
uses: 'Used for inflammation, allergies, and autoimmune diseases.',
sideEffects: 'Weight gain, high blood sugar, mood changes',
),
//30
Medicine(
name: 'Ciprofloxacin',
uses: 'Used to treat bacterial infections.',
sideEffects: 'Nausea, diarrhea, tendonitis.',
),
//31
Medicine(
name: 'Levofloxacin',
uses: 'Used to treat bacterial infections like pneumonia.',
sideEffects: 'Nausea, diarrhea, dizziness.',
),
//32
Medicine(
name: 'Doxycycline',
uses: 'Used to treat bacterial infections and acne.',
sideEffects: 'Nausea, sun sensitivity, stomach upset.',
),
//33
Medicine(
name: 'Ranitidine',
uses: 'Used to reduce stomach acid and treat ulcers.',
sideEffects: 'Headache, dizziness, stomach pain.',
),
//34
Medicine(
name: 'Lansoprazole',
uses: 'Used to treat acid reflux and ulcers.',
sideEffects: 'Headache, diarrhea, nausea.',
),
//35
Medicine(
name: 'Omeprazole',
uses: 'Used to treat acid reflux and ulcers.',
sideEffects: 'Headache, nausea, abdominal pain.',
),
//36
Medicine(
name: 'Cimetidine',
uses: 'Used to treat heartburn and ulcers.',
sideEffects: 'Dizziness, headache, confusion.',
),
//37
Medicine(
name: 'Tamsulosin',
uses: 'Used to treat symptoms of enlarged prostate.',
sideEffects: 'Dizziness, headache, nausea.',
),
//38
Medicine(
name: 'Finasteride',
uses: 'Used to treat enlarged prostate and hair loss.',
sideEffects: 'Sexual dysfunction, dizziness, headache',
),
//39
Medicine(
name: 'Sildenafil',
uses: 'Used to treat erectile dysfunction.',
sideEffects: 'Headache, dizziness, flushing.',
),
//40
Medicine(
name: 'Vardenafil',
uses: 'Used to treat erectile dysfunction.',
sideEffects: 'Headache, flushing, indigestion',
),
//41
Medicine(
name: 'Tadalafil',
uses: 'Used to treat erectile dysfunction and pulmonary hypertension.',
sideEffects: 'Headache, flushing, back pain.',
),
//42
Medicine(
name: 'Cialis',
uses: 'Used to treat erectile dysfunction and enlarged prostate.',
sideEffects: 'Headache, back pain, indigestion.',
),
//43
Medicine(
name: 'Xanax',
uses: 'Used to treat anxiety and panic disorders.',
sideEffects: 'Drowsiness, dizziness, memory problems.',
),
//44
Medicine(
name: 'Zolpidem',
uses: 'Used for short-term treatment of insomnia.',
sideEffects: 'Drowsiness, dizziness, headache.',
),
//45
Medicine(
name: 'Melatonin',
uses: 'Used to regulate sleep cycles.',
sideEffects: 'Drowsiness, dizziness, headache.',
),
//46
Medicine(
name: 'Diphenhydramine',
uses: 'Used for allergies, sleep aid, and motion sickness.',
sideEffects: 'Drowsiness, dry mouth, dizziness.',
),
];