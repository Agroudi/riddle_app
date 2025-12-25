import '../models/question_model.dart';

final Map<int, List<Question>> questionsPerLevel = {

  // ================= LEVEL 1 =================
  1: [
    Question(text: 'What keeps humans alive?', options: ['Money', 'Air', 'Gold', 'Cars'], correctIndex: 1),
    Question(text: 'Which planet do we live on?', options: ['Mars', 'Venus', 'Earth', 'Jupiter'], correctIndex: 2),
    Question(text: 'What do humans breathe?', options: ['Water', 'Oxygen', 'Fire', 'Dust'], correctIndex: 1),
    Question(text: 'What is essential to drink daily?', options: ['Oil', 'Water', 'Juice', 'Milk'], correctIndex: 1),
    Question(text: 'What gives us light during the day?', options: ['Moon', 'Stars', 'Sun', 'Fire'], correctIndex: 2),
    Question(text: 'Which organ pumps blood?', options: ['Brain', 'Heart', 'Lungs', 'Stomach'], correctIndex: 1),
    Question(text: 'What do plants need to grow?', options: ['Plastic', 'Sunlight', 'Metal', 'Smoke'], correctIndex: 1),
    Question(text: 'What covers most of Earth?', options: ['Land', 'Water', 'Sand', 'Ice'], correctIndex: 1),
    Question(text: 'Which sense helps us see?', options: ['Smell', 'Touch', 'Sight', 'Hearing'], correctIndex: 2),
    Question(text: 'What helps humans think?', options: ['Heart', 'Brain', 'Bones', 'Skin'], correctIndex: 1),
  ],

  // ================= LEVEL 2 =================
  2: [
    Question(text: 'What is the largest ocean?', options: ['Atlantic', 'Indian', 'Pacific', 'Arctic'], correctIndex: 2),
    Question(text: 'What gas do plants absorb?', options: ['Oxygen', 'Carbon Dioxide', 'Nitrogen', 'Hydrogen'], correctIndex: 1),
    Question(text: 'What causes rain?', options: ['Clouds', 'Sun', 'Wind', 'Dust'], correctIndex: 0),
    Question(text: 'Which animal lives in water?', options: ['Lion', 'Fish', 'Camel', 'Dog'], correctIndex: 1),
    Question(text: 'What force keeps us on the ground?', options: ['Magnetism', 'Gravity', 'Wind', 'Light'], correctIndex: 1),
    Question(text: 'What do bees make?', options: ['Milk', 'Honey', 'Water', 'Wax'], correctIndex: 1),
    Question(text: 'Which is a natural resource?', options: ['Plastic', 'Gold', 'Paper', 'Glass'], correctIndex: 1),
    Question(text: 'What season is the coldest?', options: ['Summer', 'Winter', 'Spring', 'Autumn'], correctIndex: 1),
    Question(text: 'What do birds use to fly?', options: ['Legs', 'Wings', 'Tail', 'Beak'], correctIndex: 1),
    Question(text: 'What is Earth’s satellite?', options: ['Mars', 'Sun', 'Moon', 'Venus'], correctIndex: 2),
  ],

  // ================= LEVEL 3 =================
  3: [
    Question(text: 'What is money mainly used for?', options: ['Sleeping', 'Trading', 'Eating', 'Walking'], correctIndex: 1),
    Question(text: 'Which is a source of income?', options: ['Job', 'Sleep', 'Rain', 'Wind'], correctIndex: 0),
    Question(text: 'What should you do to save money?', options: ['Spend more', 'Invest wisely', 'Ignore it', 'Lose it'], correctIndex: 1),
    Question(text: 'What is inflation?', options: ['Price increase', 'Price drop', 'Free money', 'Tax'], correctIndex: 0),
    Question(text: 'What do banks offer?', options: ['Loans', 'Food', 'Cars', 'Phones'], correctIndex: 0),
    Question(text: 'What is a budget?', options: ['Plan', 'Loan', 'Gift', 'Risk'], correctIndex: 0),
    Question(text: 'What is debt?', options: ['Saved money', 'Borrowed money', 'Free cash', 'Profit'], correctIndex: 1),
    Question(text: 'What is profit?', options: ['Loss', 'Debt', 'Gain', 'Expense'], correctIndex: 2),
    Question(text: 'Why invest?', options: ['Waste money', 'Grow money', 'Lose money', 'Hide money'], correctIndex: 1),
    Question(text: 'What is a salary?', options: ['Gift', 'Income', 'Loan', 'Debt'], correctIndex: 1),
  ],

  // ================= LEVEL 4 =================
  4: [
    Question(text: 'What is time management?', options: ['Wasting time', 'Organizing time', 'Ignoring time', 'Sleeping'], correctIndex: 1),
    Question(text: 'What habit improves focus?', options: ['Discipline', 'Laziness', 'Overthinking', 'Noise'], correctIndex: 0),
    Question(text: 'What helps success?', options: ['Consistency', 'Excuses', 'Fear', 'Luck only'], correctIndex: 0),
    Question(text: 'What ruins productivity?', options: ['Planning', 'Distractions', 'Goals', 'Focus'], correctIndex: 1),
    Question(text: 'What builds confidence?', options: ['Action', 'Fear', 'Doubt', 'Delay'], correctIndex: 0),
    Question(text: 'What is a goal?', options: ['Wish', 'Target', 'Dream only', 'Luck'], correctIndex: 1),
    Question(text: 'What causes failure?', options: ['Learning', 'Quitting', 'Trying', 'Patience'], correctIndex: 1),
    Question(text: 'What improves skills?', options: ['Practice', 'Waiting', 'Complaining', 'Avoiding'], correctIndex: 0),
    Question(text: 'What is discipline?', options: ['Control', 'Punishment', 'Anger', 'Fear'], correctIndex: 0),
    Question(text: 'What creates results?', options: ['Action', 'Thinking only', 'Talking', 'Waiting'], correctIndex: 0),
  ],

  // ================= LEVEL 5 =================
  5: [
    Question(text: 'What does exercise improve?', options: ['Health', 'Laziness', 'Stress', 'Weakness'], correctIndex: 0),
    Question(text: 'What food is healthy?', options: ['Fruits', 'Junk food', 'Candy', 'Soda'], correctIndex: 0),
    Question(text: 'What helps muscle growth?', options: ['Protein', 'Sugar', 'Fat only', 'Water only'], correctIndex: 0),
    Question(text: 'What causes fatigue?', options: ['Rest', 'Overwork', 'Sleep', 'Nutrition'], correctIndex: 1),
    Question(text: 'What improves sleep?', options: ['Routine', 'Caffeine', 'Noise', 'Screens'], correctIndex: 0),
    Question(text: 'What reduces stress?', options: ['Exercise', 'Anger', 'Overthinking', 'Fear'], correctIndex: 0),
    Question(text: 'What damages health?', options: ['Smoking', 'Walking', 'Water', 'Sleep'], correctIndex: 0),
    Question(text: 'What strengthens heart?', options: ['Cardio', 'Sugar', 'Salt', 'Sitting'], correctIndex: 0),
    Question(text: 'What keeps body hydrated?', options: ['Water', 'Coffee', 'Juice', 'Soda'], correctIndex: 0),
    Question(text: 'What boosts immunity?', options: ['Nutrition', 'Stress', 'Lack of sleep', 'Smoking'], correctIndex: 0),
  ],

  // ================= LEVEL 6 =================
  6: [
    Question(text: 'What is leadership?', options: ['Control', 'Influence', 'Fear', 'Force'], correctIndex: 1),
    Question(text: 'What builds trust?', options: ['Honesty', 'Lies', 'Fear', 'Manipulation'], correctIndex: 0),
    Question(text: 'What ruins relationships?', options: ['Communication', 'Ego', 'Respect', 'Support'], correctIndex: 1),
    Question(text: 'What improves communication?', options: ['Listening', 'Interrupting', 'Ignoring', 'Shouting'], correctIndex: 0),
    Question(text: 'What shows respect?', options: ['Understanding', 'Insults', 'Arrogance', 'Mocking'], correctIndex: 0),
    Question(text: 'What is empathy?', options: ['Feeling others', 'Judging', 'Ignoring', 'Dominating'], correctIndex: 0),
    Question(text: 'What weakens teams?', options: ['Conflict', 'Unity', 'Trust', 'Support'], correctIndex: 0),
    Question(text: 'What builds influence?', options: ['Value', 'Fear', 'Money only', 'Power'], correctIndex: 0),
    Question(text: 'What creates loyalty?', options: ['Respect', 'Fear', 'Control', 'Threats'], correctIndex: 0),
    Question(text: 'What improves teamwork?', options: ['Collaboration', 'Competition', 'Isolation', 'Ego'], correctIndex: 0),
  ],

  // ================= LEVEL 7 =================
  7: [
    Question(text: 'What is technology?', options: ['Tools', 'Magic', 'Luck', 'Art'], correctIndex: 0),
    Question(text: 'What does AI do?', options: ['Think', 'Learn patterns', 'Sleep', 'Eat'], correctIndex: 1),
    Question(text: 'What improves coding skills?', options: ['Practice', 'Watching only', 'Copying', 'Avoiding'], correctIndex: 0),
    Question(text: 'What is software?', options: ['Programs', 'Hardware', 'Electricity', 'Wires'], correctIndex: 0),
    Question(text: 'What protects data?', options: ['Security', 'Sharing', 'Ignoring', 'Public access'], correctIndex: 0),
    Question(text: 'What speeds computers?', options: ['Optimization', 'Clutter', 'Viruses', 'Overload'], correctIndex: 0),
    Question(text: 'What is debugging?', options: ['Fixing errors', 'Creating bugs', 'Ignoring bugs', 'Deleting code'], correctIndex: 0),
    Question(text: 'What does the internet provide?', options: ['Information', 'Only games', 'Only videos', 'Nothing'], correctIndex: 0),
    Question(text: 'What is cloud computing?', options: ['Online storage', 'Weather', 'Rain', 'Fog'], correctIndex: 0),
    Question(text: 'What improves apps?', options: ['User experience', 'Confusion', 'Bugs', 'Lag'], correctIndex: 0),
  ],

  // ================= LEVEL 8 =================
  8: [
    Question(text: 'What defines success?', options: ['Consistency', 'Luck', 'Excuses', 'Fear'], correctIndex: 0),
    Question(text: 'What creates freedom?', options: ['Discipline', 'Comfort', 'Delay', 'Fear'], correctIndex: 0),
    Question(text: 'What builds wealth?', options: ['Assets', 'Liabilities', 'Spending', 'Debt'], correctIndex: 0),
    Question(text: 'What improves mindset?', options: ['Learning', 'Complaining', 'Blaming', 'Excuses'], correctIndex: 0),
    Question(text: 'What destroys growth?', options: ['Comfort zone', 'Discomfort', 'Learning', 'Action'], correctIndex: 0),
    Question(text: 'What builds character?', options: ['Challenges', 'Ease', 'Luck', 'Avoidance'], correctIndex: 0),
    Question(text: 'What creates mastery?', options: ['Repetition', 'Talent only', 'Luck', 'Shortcuts'], correctIndex: 0),
    Question(text: 'What fuels progress?', options: ['Purpose', 'Fear', 'Doubt', 'Excuses'], correctIndex: 0),
    Question(text: 'What shapes destiny?', options: ['Choices', 'Luck', 'Others', 'Circumstances'], correctIndex: 0),
    Question(text: 'What separates winners?', options: ['Discipline', 'Excuses', 'Fear', 'Comfort'], correctIndex: 0),
  ],
};
