 # Radiant-carousel-extension
 # @copyright (c) 2010 Blazing CLoud (http://www.blazingcloud.net)
 # @license MIT License
 #
 namespace :radiant do
  namespace :extensions do
    namespace :mediamaid do
      
      desc "Runs the migration of the Mediamaid extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          MediamaidExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          MediamaidExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Mediamaid to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from MediamaidExtension"
        Dir[MediamaidExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(MediamaidExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory, :verbose => false
          cp file, RAILS_ROOT + path, :verbose => false
        end
      end

      desc "Uploads batches of files from a location local to web server"
      task :batch_import => :environment do
        require File.dirname(__FILE__) + "/../../app/models/mediamaid"

        print "All the files in the given directory will be imported"
        print "Directory path should be specified like: /usr/name/myfiles/"
        print "Please enter the directory:"

        dirpath = $stdin.gets.chomp

        Dir.foreach(dirpath) do |entry|
           filepath = dirpath+entry
           if (File.file?(filepath))
             p "Importing file: #{filepath}"
             fileobject = File.new(filepath, "r")
             mediamaid = Mediamaid.new(:mediamaid => fileobject)
             p "-----------> import failed for #{filepath}" if !mediamaid.save
           end
        end

        print "Directory import complete: #{dirpath}\n"

      end
    end
  end
end
