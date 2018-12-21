crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", mypage_path
  parent :root
end

crumb :notifications do
  link "お知らせ", mypage_notification_path
  parent :mypage
end

crumb :todo do
  link "やることリスト", mypage_todo_path
  parent :mypage
end

crumb :product do
  link "正規品！COACH【コーチ】★★大きめ ミニシグネチャー ショルダーバッグ", show_path
  parent :root
end

crumb :todo do |user|
  link "Edit #{user.name}", edit_user_path(user)
  parent :show_user, user
end
# user#new


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
