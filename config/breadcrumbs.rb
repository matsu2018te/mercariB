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
  link "#{Product.find(id = params[:id]).name}", product_path
  parent :root
end

crumb :profile do
  link "プロフィール", mypage_profile_path
  parent :mypage
end

crumb :logout do #ログアウトのビュー完成後実装
  link "ログアウト", mypage_logout_path
  parent :mypage
end

crumb :search do
  link "#{ params[:q][:info_or_name_or_brand_name_or_category_name_cont_all] }", search_path
  parent :root
end

crumb :categories do
  link "カテゴリー検索", categories_path
  parent :root
end

crumb :brands do
  link "ブランド検索", brands_categories_path
  parent :root
end
