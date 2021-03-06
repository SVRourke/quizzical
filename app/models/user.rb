class User < ApplicationRecord
    has_secure_password

    # VALIDATIONS
    validates :first_name, presence: {message: 'Must have a first name!'}
    validates :last_name, presence: {message: 'Must have a last name!'}
    # email is present and unique and an email (can be simple format check)
    validates :email, presence: {message: 'Must have an email!'}
    validates :email, uniqueness: {message: 'Email already in use!'}
    validates :email, format: {with: /\w*@\w*\.com/, message: "Must use a valid email."}
    
    # password for presence, length and presence of special characters
    validates :password, length: {minimum: 8}

    # Teacher Relationships
    has_many :group_admins, dependent: :destroy
    has_many :taught_classes, through: :group_admins, source: :group, dependent: :destroy
    has_many :students, through: :taught_classes, source: :students
    has_many :quizzes, through: :taught_classes, source: :quizzes, dependent: :destroy
    
    # Student Relationships
    has_and_belongs_to_many :enrolled_classes, 
        :class_name => 'Group', 
        :join_table => 'groups_users', 
        :foreign_key => 'group_id', 
        :association_foreign_key => 'user_id'

    has_many :assigned_quizzes, through: :enrolled_classes, source: :quizzes
    has_many :teachers, through: :enrolled_classes, source: :teacher
    has_many :results
    has_many :notes

    def full_name
        "#{first_name} #{last_name}"
    end

    def self.from_omniauth(auth, teacher_state)
        if user = find_by_email(auth['email'])
            return user
        else
            return User.create(
                uid: auth['uid'],
                first_name: auth['first_name'],
                last_name: auth['last_name'],
                email: auth['email'],
                teacher: teacher_state,
                password: SecureRandom.hex
            )
        end
    end

end
