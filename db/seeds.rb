require "csv"

Category.delete_all
parents =[]
children =[]
CSV.foreach('db/category_parent.csv', encoding: 'Shift_JIS:UTF-8') do |row|
  parent = Category.create(category_name: row[0],belongs: "parent")
  parents << parent
end

parent_count = 0
parents.each do |parents|
  CSV.foreach('db/category_child.csv', encoding: 'Shift_JIS:UTF-8') do |row|
    if row[parent_count]
      child = parents.children.create(category_name: row[parent_count],belongs: "child")
      children << child
    end
  end
  parent_count += 1
end

child_count = 0
children.each do |child|
  CSV.foreach('db/category_g_child.csv', encoding: 'Shift_JIS:UTF-8') do |row|
    if row[child_count]
      child.children.create(category_name: row[child_count],belongs: "g_child")
    end
  end
  child_count += 1
end
