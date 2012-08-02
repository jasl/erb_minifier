class Dir
  # This function is for traverse directory.
  # The first argument is path where you want to traverse,
  # second is an array and it's optional if you don't want
  # to find given file extension, third is an array
  # if you don't want to filter file.
  # You can given a block to operate files as you want.
  #
  # Notice: The second and the third arguments are not support regex.
  def self.traverse path, ext_names = [], black_list = [], &block
    if File.directory? path
      Dir.foreach path do |file|
        unless /^\./i.match file or black_list.include?(file)
          file = path + '/' + file
          if File.directory? file
            traverse(file, ext_names, black_list, &block)
          elsif ext_names.empty? or ext_names.include? File.extname(file)
            block.call file if block_given?
          end
        end
      end
    end
  end
end

namespace :views do
  desc "Clear precompiled view's templates"
  task :clear do
    FileUtils.rm_rf(Dir["#{Rails.root}/precompiled_views"])
  end

  desc "Precompile views"
  task :precompile do
    FileUtils.rm_rf(Dir["#{Rails.root}/precompiled_views"])

    FileUtils.cp_r "#{Rails.root}/app/views/", "#{Rails.root}/tmp"
    Dir.traverse "#{Rails.root}/tmp/views", %w".erb" do |f|
      minified_body = IO.readlines(f).reduce(:+).gsub /(\s+|\n)/, " "
      IO.write f, minified_body
    end
    FileUtils.mv "#{Rails.root}/tmp/views", "#{Rails.root}/precompiled_views"
  end
end
