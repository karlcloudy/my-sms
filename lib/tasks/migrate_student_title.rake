namespace :db do
  namespace :data do
    desc 'Migrate Student legacy Title field to Title table reference.'
    task migrate_student_title: :environment do
      DEFAULT_TITLES = %w[Miss Mrs Ms Mr Dr]

      puts 'Performing sanity checks'
      # Check table existance
      raise "Could not find table 'titles' - did you forget to db:migrate?" if not Title.table_exists?
      # Check column existance
      raise "Could not find column 'student_id' in table 'student' - did you forget to db:migrate?" if not Student.column_names.include?('title_id')

      # Import initial data
      puts 'Adding default titles'
      DEFAULT_TITLES.each do |t|
        Title.create(title: t)
      end

      puts 'Adding other titles'
      titles = Student.uniq.pluck(:title_migrated)
      titles.each do |title|
        Title.find_or_create_by_title(title)
      end

      puts 'Setting title_id values for students'
      Title.find_each do |title|
        Student.where('title_migrated = ?', title.title).update_all(title_id: title.id)
      end
    end
  end
end
