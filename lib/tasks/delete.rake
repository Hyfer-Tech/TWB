namespace :tempfiles do
  task :delete do
     FileUtils.rm_rf Dir.glob("#{Rails.root}/public/uploads/tmp/*")
  end
end
