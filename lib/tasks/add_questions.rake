namespace :db do
  desc 'add questions'
  task add_questions: :environment do

    category = Api::Category.first
    puts "---> take first category '#{category.name}'"
  
    # Create question for first category
    quest = Api::Question.where(title: "Question 1")
    unless quest.any?
      question = Api::Question.new(
                  category_id: category.id,
                  status: 'open',
                  title: 'Question 1',
                  body: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorem, repudiandae.',
                  comments_count: 0
                )
      question.save
      puts "---> added question for #{category.name}"
    end

    quest = Api::Question.where(title: "Question 2")
    unless quest.any?
      question = Api::Question.new(
                  category_id: category.id,
                  status: 'ballot',
                  title: 'Question 2',
                  body: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorem, repudiandae.',
                  comments_count: 0
                )
      question.save
      puts "---> added question for #{category.name}"
    end

    quest = Api::Question.where(title: "Question 3")
    unless quest.any?
      question = Api::Question.new(
                  category_id: category.id,
                  status: 'close',
                  title: 'Question 3',
                  body: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorem, repudiandae.',
                  comments_count: 0
                )
      question.save
      puts "---> added question for #{category.name}"
    end
  end
end
