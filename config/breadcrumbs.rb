crumb :root do
  link "ホーム", root_path
end

crumb :mypage do
  link "マイページ", user_path
  parent :root
end

crumb :category do |category|
  if category.has_parent?
    if category.parent.has_parent?
      link category.parent.parent.name, category_path(category.parent.parent.id)
    end
    link category.parent.name, category_path(category.parent.id)
    link category.name, category_path(category.id)
  else
    link category.name, category_path(category.id)
  end
  parent :root
end
  
# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).