
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
    name: "Quiz 1", 
    group: group, 
    published: false
)
qs = Question.create([
    {content: "a", quiz: quiz, answers: Answer.create([
        {content: "right", correct_answer: true},
        {content: "wrong ", correct_answer: false},
        {content: "wrong again", correct_answer: false},
        {content: "wrong yet again", correct_answer: false},
    ])},
    {content: "b", quiz: quiz, answers: Answer.create([
        {content: "right", correct_answer: true},
        {content: "wrong ", correct_answer: false},
        {content: "wrong again", correct_answer: false},
        {content: "wrong yet again", correct_answer: false},
    ])},
    {content: "c", quiz: quiz, answers: Answer.create([
        {content: "right", correct_answer: true},
        {content: "wrong ", correct_answer: false},
        {content: "wrong again", correct_answer: false},
        {content: "wrong yet again", correct_answer: false},
    ])},
    {content: "d", quiz: quiz, answers: Answer.create([
        {content: "right", correct_answer: true},
        {content: "wrong ", correct_answer: false},
        {content: "wrong again", correct_answer: false},
        {content: "wrong yet again", correct_answer: false},
    ])}
])
quiz.update(published: true)
quiz.save