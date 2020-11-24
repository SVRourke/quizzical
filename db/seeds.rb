# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create two teachers
teachers = User.create([
        {first_name: "Sharain", last_name: "Lark", email: "slark@school.com", teacher: true},
        {first_name: "Sam", last_name: "Rourke", email: "srourke@school.com", teacher: true}
        ])

# Create 4 students
students = User.create(
    [
        {first_name: "Student 1", last_name: "last_name", email: "s1@test.com"},
        {first_name: "Student 2", last_name: "last_name", email: "s2@test.com"},
        {first_name: "Student 3", last_name: "last_name", email: "s3@test.com"},
        {first_name: "Student 4", last_name: "last_name", email: "s4@test.com"}
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
groups[0].students << students[0..1]
groups[0].students << students[2..3]

# create 2 Quizzes
quizzes = Quiz.create([
    {name: "Quiz 1", user: teachers[0]},
    {name: "Quiz 2", user: teachers[1]}
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

# create results for students
students[0..1].each do |st|
    res = st.results.build(quiz: quizzes.first)
    
    quizzes.first.questions.each do |qn|
        if res.answers.count <= qn.answers.count - 3
            res.answers << qn.answers.sample
        else
            res.answers << qn.answers.last
        end
    end
    st.save
end

students[2..3].each do |st|
    res = st.results.build(quiz: quizzes.last)

    quizzes.last.questions.each do |qn|
        if res.answers.count <= qn.answers.count - 1
            res.answers << qn.answers.sample
        else
            res.answers << qn.answers.last
        end
    end
    st.save
end