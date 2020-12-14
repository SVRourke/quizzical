class Group < ApplicationRecord
    validates_with GroupValidator

    has_one :group_admin, dependent: :destroy
    has_one :teacher, through: :group_admin, source: :user

    has_and_belongs_to_many :students,
        :class_name => 'User',
        :join_table => 'groups_users',
        :foreign_key => 'user_id',
        :association_foreign_key => 'group_id'

    has_many :quizzes
    has_many :results, through: :quizzes
end

