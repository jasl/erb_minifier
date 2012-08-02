if Rails.env == 'production'
  ActionController::Base.class_eval do
    self.view_paths = [
        ActionView::OptimizedFileSystemResolver.new("#{Rails.root}/precompiled_views",
                                                    ":prefix/:action { .: locale, } { .: formats, } { .: handlers, } ")
    ].concat self.view_paths
  end
end