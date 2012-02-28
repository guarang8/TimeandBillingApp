class MyControllerGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  
  argument :views, :type => :array, :default => ["index"]
  
  def create_controller
    template "controller.rb", "app/controllers/#{plural_name}_controller.rb"
  end
  
  def create_views
    views.each do |v|
      template "view.html.haml","app/views/#{plural_name}/#{v}.html.haml"
    end
  end
  
end
