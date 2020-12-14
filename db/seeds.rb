
# Create two teachers
teachers = User.create([
        {first_name: "Sharain", last_name: "Lark", email: "slark@test.com", teacher: true, password: "password1"},
        {first_name: "Samuel", last_name: "Rourke", email: "srourke@test.com", teacher: true, password: "password1"}
        ])

# Create 4 students
students = User.create(
    [
        {first_name: "Quinton", last_name: "Coldwater", email: "s3@test.com", password: "password1"},
        {first_name: "Penny", last_name: "Adiyodi", email: "s1@test.com", password: "password1"},
        {first_name: "Alice", last_name: "Quinn", email: "s3@test.com", password: "password1"},
        {first_name: "Elliot", last_name: "Waugh", email: "s3@test.com", password: "password1"},
        {first_name: "Margo", last_name: "Hanson", email: "s2@test.com", password: "password1"},
        {first_name: "Julia", last_name: "Wicker", email: "s3@test.com", password: "password1"},
        {first_name: "Josh", last_name: "Hoberman", email: "s3@test.com", password: "password1"},
        {first_name: "Kady", last_name: "Orlof-diaz", email: "s3@test.com", password: "password1"},
        {first_name: "Jane", last_name: "Chatwin", email: "s3@test.com", password: "password1"},
        {first_name: "Tick", last_name: "Pickwick", email: "s3@test.com", password: "password1"},
        {first_name: "Henry", last_name: "Fogg", email: "s3@test.com", password: "password1"}
    ]
)
# Create two Groups
groups = Group.create(
    [
        {name: "History", teacher: teachers[0]},
        {name: "Algebra", teacher: teachers[1]},
    ]
)
# Assign students to groups
groups[0].students << students[0..5]
groups[1].students << students[6..10]

# create 2 Quizzes
quizzes = Quiz.create([
    {name: "Quiz 1", group: groups.first, published: true},
    {name: "Quiz 2", group: groups.last, published: true}
])
# Populate the quizzes with questions and answers
quizzes.each do |qz|
    qz.questions.build([
        {content: "Question 1"},
        {content: "Question 2"},
        {content: "Question 3"},
        {content: "Question 4"}
        ])
        
        qz.questions.each do |qn|
            qn.answers.build([
                {content: "Wrong", correct_answer: false},
                {content: "Wrong Again", correct_answer: false},
                {content: "Wrong Yet Again", correct_answer: false},
                {content: "Right", correct_answer: true}
                ])
                
    end
    qz.save
end

# Assign Quizzes to groups
groups.first.quizzes << quizzes.first
groups.last.quizzes << quizzes.last

