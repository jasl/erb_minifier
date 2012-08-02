module ErbMinifier
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'tasks/erb_minifier_tasks.rake'
    end
  end
end
