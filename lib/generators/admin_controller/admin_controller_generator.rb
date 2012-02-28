class AdminControllerGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  argument :views, :type => :array, :default => ["index"]
  def create_controller
    template "controller.rb","app/controllers/admin/#{plural_name}_controller.rb"
  end

  def create_views
    ["index","edit","new"].each do |v|
      template "#{v}.html.haml","app/views/admin/#{plural_name}/#{v}.html.haml"
    end
  end


end