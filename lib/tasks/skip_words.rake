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

end