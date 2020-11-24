class UserAnswer < ApplicationRecord
    belongs_to :result
    belongs_to :answer
end
