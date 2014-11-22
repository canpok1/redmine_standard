Redmine::Plugin.register :redmine_standard do
  name 'Redmine Standard plugin'
  author 'Keiichi Tanabe'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url '6isstrong@gmail.com'
  project_module :standard do
      permission :view_foos, :foos => [:index, :show]
      permission :manage_foos, :foos => [:new, :edit, :create, :update, :destroy, :preview],
                 :require => :member
  end
  menu :project_menu, :standard, { :controller => 'foos', :action => 'index'}, :param => :project_id
end
