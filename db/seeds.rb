
# Create a Teacher
teachers = User.create([
        {first_name: "Henry", last_name: "Fogg", email: "hfogg@school.com", teacher: true, password: "password1"},
        ])

# Create 4 students
students = User.create(
    [
        {first_name: "Quinton", last_name: "Coldwater", email: "s1@test.com", password: "password1"},
        {first_name: "Penny", last_name: "Adiyodi", email: "s2@test.com", password: "password1"},
        {first_name: "Alice", last_name: "Quinn", email: "s3@test.com", password: "password1"},
        {first_name: "Elliot", last_name: "Waugh", email: "s4@test.com", password: "password1"},
        {first_name: "Margo", last_name: "Hanson", email: "s5@test.com", password: "password1"},
        {first_name: "Julia", last_name: "Wicker", email: "s6@test.com", password: "password1"},
        {first_name: "Josh", last_name: "Hoberman", email: "s7@test.com", password: "password1"},
        {first_name: "Kady", last_name: "Orlof-diaz", email: "s8@test.com", password: "password1"},
        {first_name: "Jane", last_name: "Chatwin", email: "s9@test.com", password: "password1"},
        {first_name: "Tick", last_name: "Pickwick", email: "s10@test.com", password: "password1"},
    ]
)
# Create two Groups
group = Group.create(
    name: "History",
    teacher: teachers[0]
)
# Assign students to groups
group.students << students

# create 2 Quizzes
quiz = Quiz.create(
    name: "History", 
    group: group, 
    published: false
)
qs = Question.create([
    {content: "When was the war of 1812?", quiz: quiz, answers: Answer.create([
        {content: "1812", correct_answer: true},
        {content: "wrong ", correct_answer: false},
        {content: "wrong again", correct_answer: false},
        {content: "wrong yet again", correct_answer: false},
    ])},
    {content: "Which US president declared war in 1812?", quiz: quiz, answers: Answer.create([
        {content: "Thomas Jefferson", correct_answer: false},
        {content: "James Madison", correct_answer: true},
        {content: "Andrew Jackson", correct_answer: false},
        {content: "John Adams", correct_answer: false},
    ])},
    {content: "Where was the peace treaty signed?", quiz: quiz, answers: Answer.create([
        {content: "The Hague", correct_answer: false},
        {content: "Antwerp", correct_answer: false},
        {content: "Ghent", correct_answer: true},
        {content: "Paris", correct_answer: false},
    ])},
    {content: "How many states mad up the US in 1812?", quiz: quiz, answers: Answer.create([
        {content: "13", correct_answer: false},
        {content: "45", correct_answer: false},
        {content: "19", correct_answer: false},
        {content: "17", correct_answer: true},
    ])}
])
quiz.update(published: true)
quiz.save