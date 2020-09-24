class Task < ApplicationRecord
    belongs_to :goal #taskは一つのgoalに所属しています
end
