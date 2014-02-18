namespace :gettext do
  def files_to_translate
    Dir.glob("{app,lib,config,locale,spec}/**/*.{rb,erb,haml,slim,rhtml}")
  end
end