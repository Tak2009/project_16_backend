class Supporter < ApplicationRecord
    has_many :tickets
    has_many :pubs, through: :tickets
end
