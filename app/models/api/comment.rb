class Api::Comment < ActiveRecord::Base
  belongs_to :question
end
