namespace :db do
  desc 'add categories'
  task add_categories: :environment do
    unless Api::Category.find_by_name('Category 1')
      category = Api::Category.new(
                  name: 'Category 1',
                  count: 0
                )
      category.save
      puts '---> added category Category 1'
    end
    
    unless Api::Category.find_by_name('Category 2')
      category = Api::Category.new(
                  name: 'Category 2',
                  count: 0
                )
      category.save
      puts '---> added category Category 2'
    end

    unless Api::Category.find_by_name('Category 3')
      category = Api::Category.new(
                  name: 'Category 3',
                  count: 0
                )
      category.save
      puts '---> added category Category 3'
    end
  end
end
