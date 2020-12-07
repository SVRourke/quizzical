class User < ApplicationRecord
    has_secure_password

    # VALIDATIONS
    validates :first_name, presence: true, message: 'Must have a first name!'
    validates :last_name, presence: true, message: 'Must have a last name!'
    # email is present and unique and an email (can be simple format check)
    validates :email, presence: true, message: 'Must have an email!'
    validates :email, uniqueness: true, message: 'Email already in use!'
    
    # password for presence, length and presence of special characters
    validates :password, presence: true, message: 'Must have a password!' 
    validates :password, length: {minimum: 8}, message: 'Password must be at least 8 characters long.'


    # Teacher Relationships
    has_many :group_admins
    has_many :taught_classes, through: :group_admins, source: :group
    has_many :students, through: :taught_classes, source: :students
    has_many :quizzes, through: :taught_classes, source: :quizzes
    
    # Student Relationships
    has_and_belongs_to_many :enrolled_classes, 
        :class_name => 'Group', 
        :join_table => 'groups_users', 
        :foreign_key => 'group_id', 
        :association_foreign_key => 'user_id'

    has_many :assigned_quizzes, through: :enrolled_classes, source: :quizzes
    has_many :teachers, through: :enrolled_classes, source: :teacher
    has_many :results

    def full_name
        "#{first_name} #{last_name}"
    end

end
