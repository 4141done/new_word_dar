namespace :skip_words do
  # Usage: rake skip_words:import[filename]
  desc "Import skip words into the DB from data files"
  task :import, [:file] => [:environment] do |task, args|
    file = args.file

    swi = SkipWordImporter.new

    if file.nil?
      Dir.glob('skip_words/*.data') do |file|
        swi.import_file file
      end
    else
      swi.import_file "skip_words/#{file}"
    end
  end

  task :export => :environment do
    manual_skip_words = SkipWord.where(source: 'manual')
    File.open("skip_words/manual.data", 'w') { |f|
      manual_skip_words.each { |word|
        f.write("#{word.word}\n")
      }
    }
  end

  task :clear => :environment do
    SkipWord.delete_all
  end

end