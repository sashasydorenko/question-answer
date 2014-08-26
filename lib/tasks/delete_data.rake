namespace :db do  
  desc 'delete custom added data'
  task delete_data: :environment do
    Api::Category.delete_all
    Api::Question.delete_all
    Api::Comment.delete_all
    puts '---> deleted all data'
  end
end
