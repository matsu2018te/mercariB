require "csv"

parents =[]
children =[]
CSV.foreach('db/category_parent.csv', encoding: 'Shift_JIS:UTF-8') do |row|
  parent = Category.create(name: row[0],belongs: "parent")
  parents << parent
end

parent_count = 0
parents.each do |parents|
  CSV.foreach('db/category_child.csv', encoding: 'Shift_JIS:UTF-8') do |row|
    if row[parent_count]
      child = parents.children.create(name: row[parent_count],belongs: "child")
      children << child
    end
  end
  parent_count += 1
end

child_count = 0
children.each do |child|
  CSV.foreach('db/category_g_child.csv', encoding: 'Shift_JIS:UTF-8') do |row|
    if row[child_count]
      child.children.create(name: row[child_count],belongs: "g_child")
    end
  end
  child_count += 1
end

CSV.foreach('db/size.csv',  encoding: 'Shift_JIS:UTF-8') do |row|
  Size.create(size: row[0])
end

# ユーザーの作成
User.create(nickname: "test1", telephone: "08011112222", email: "test@gmail.com", password: "test1test1", birth_year: 1991, birth_month: 1, birth_day: 1)

User.create(nickname: "test2", telephone: "08022223333", email: "test2@gmail.com", password: "test2test2", birth_year: 1992, birth_month: 2, birth_day: 2)

User.create(nickname: "test3", telephone: "08033334444", email: "test3@gmail.com", password: "test3test3", birth_year: 1993, birth_month: 3, birth_day: 3)

users = User.all()

# クレジットの作成
Credit.create(card_number: 1111111111, expiration_month: 1, expiration_year: 21, security_code: 1111, user_id: "#{users[0].id}")

Credit.create(card_number: 2222222222, expiration_month: 2, expiration_year: 22, security_code: 2222, user_id: "#{users[1].id}")

Credit.create(card_number: 3333333333, expiration_month: 3, expiration_year: 23, security_code: 3333, user_id: "#{users[2].id}")

# アドレスの作成
Address.create( first_name: "テスト", last_name: "一郎", first_name_phonetic: "テスト", last_name_phonetic: "イチロウ", postal_code: "123456", prefecture: 1,municipality: "テスト市テスト区", address_number: "テスト町1-1-1", building_name: "テストハウス101", user_id: "#{users[0].id}")

Address.create( first_name: "テスト", last_name: "次郎", first_name_phonetic: "テスト", last_name_phonetic: "ジロウ", postal_code: "123456", prefecture: 1,municipality: "テスト市テスト区", address_number: "テスト町1-1-1", building_name: "テストハウス101", user_id: "#{users[1].id}")

Address.create( first_name: "テスト", last_name: "三郎", first_name_phonetic: "テスト", last_name_phonetic: "サブロウ", postal_code: "123456", prefecture: 1 ,municipality: "テスト市テスト区", address_number: "テスト町1-1-1", building_name: "テストハウス101", user_id: "#{users[2].id}")

s_status = [0,1,2]
s_status.each do |s_status|
  SellStatus.create(status:s_status)
end


Brand.create(name:"アベンジャーズ")
Brand.create(name:"スタークインダストリーズ")
Brand.create(name:"ウルヴァリン")


delivery_fee_owner = ["着払い(購入者負担)","送料込み(出品者負担)"]
shipping_method = ["未定","クロネコヤマト","ゆうパック","ゆうメール"]
delivery_date = ["1〜2日で発送","2〜3日で発送","4〜7日で発送"]
status = ["新品未使用","未使用に近い","目立った傷や汚れなし","やや傷や汚れや汚れあり","傷や汚れや汚れあり","全体的に状態が悪い"]

# 商品
8.times {
  random = Random.new

  i = 1
  brand = Brand.find(i)
  size = Size.find(i)
  user = User.find(i)
  category = Category.find(160)
  sell_status = SellStatus.find(i)
  product = Product.create!(seller_id: "#{user.id}", name:"スパイダーマン", info:"スパイダーマンは、原作者のスタン・リーとアーティストのスティーブ・ディッコによって作られて、Amazing Fantasy15（1962年8月）で初登場した。「Spidey（スパイディ）」、「Friendly Neighborhood（親愛なる隣人）」、「Web head（ウェブヘッド）」、「Web slinger（ウェブスリンガー）」などのニックネームを持つ。キャッチフレーズは「Your Friendly Neighborhood Spider-Man（あなたの親愛なる隣人スパイダーマン）」。", price:random.rand(300..90000), category_id: "#{category.id}", brand_id: "#{brand.id}", size_id: "#{size.id}", status: status.sample(), delivery_fee_owner: delivery_fee_owner.sample(), delivery_date: delivery_date.sample(), sell_status_id: "#{sell_status.id}", shipping_method: shipping_method.sample(),area: "#{i}")
  Image.create(product_id: "#{product.id}",image: open("#{Rails.root}/db/fixtures/kokeshi.jpg"))

  i = 2
  brand = Brand.find(i)
  size = Size.find(i)
  user = User.find(i)
  category = Category.find(170)
  sell_status = SellStatus.find(i)
  product = Product.create(seller_id:"#{user.id}", name:"アイアンマン",info:"『アイアンマン』（[英]):Iron Man）は、マーベル・コミックが刊行しているアメリカン・コミックス。アニメや映画作品も制作されており、2008年5月2日には実写映画『アイアンマン (映画)』が公開された。",price:random.rand(300..90000), category_id: "#{category.id}", brand_id: "#{brand.id}", size_id: "#{size.id}", status: status.sample(), delivery_fee_owner: delivery_fee_owner.sample(), delivery_date: delivery_date.sample(), sell_status_id: "#{sell_status.id}", shipping_method: shipping_method.sample(),area: "#{i}")
  Image.create(product_id: "#{product.id}",image: open("#{Rails.root}/db/fixtures/ironman.jpg"))

  i = 3
  brand = Brand.find(i)
  size = Size.find(i)
  user = User.find(i)
  category = Category.find(180)
  sell_status = SellStatus.find(i)
  product = Product.create(seller_id:"#{user.id}", name:"マグニート",info:"マグニートーは磁場を生成し操作する能力を持つ、強力なミュータントである。ミュータントとは、生まれながらに普通の人間にはない特殊な能力が備わった新たな人類種を指し、マグニートーは人類をホモサピエンスと呼ぶことから、ミュータントを「ホモ・スペリオール」（優れた人間）と呼んでいる。マグニートーは人類より優れたミュータントによる世界の支配を目的としており、人間とミュータントの平和的共存という考えは否定している。マグニートーの生い立ちや動機については作家により肉付けが行われており、ホロコースト生存者であることが明らかにされている。マグニートーのテロ活動を基本とする極端な手段やシニカルな哲学は、ミュータントを恐れ、迫害する人間達によりミュータントがホロコーストの二の舞になることを防ぎたいという決意からきている。",price:random.rand(300..90000), category_id: "#{category.id}", brand_id: "#{brand.id}", size_id: "#{size.id}", status: status.sample(), delivery_fee_owner: delivery_fee_owner.sample(), delivery_date: delivery_date.sample(), sell_status_id: "#{sell_status.id}", shipping_method: shipping_method.sample(),area: "#{i}")
  Image.create(product_id: "#{product.id}",image: open("#{Rails.root}/db/fixtures/magnet.jpg"))


  size = Size.find(i)
  user = User.find(i)
  sell_status = SellStatus.find(i)
  product = Product.create(seller_id:"#{user.id}", name:"ウルヴァリン", info:"ミュータントであるウルヴァリンは動物的な鋭い感覚と反射能力、そして実質的にどんな怪我からも回復することができる治癒能力（ヒーリング・ファクター）を持っている。この治癒能力はスーパーソルジャー製造計画「ウェポンX」において、骨格（出し入れが可能なカミソリのように鋭い爪を含む）に世界最硬の金属であるアダマンチウム合金を組み入れることを可能にした。近接戦闘の達人でもある。コードネームの「ウルヴァリン」とは、クズリというイタチ科の、小さいが獰猛な動物を意味する。また、「ウェポンX」（ウェポンエックス）の「X」はローマ数字の「10」のダブルミーニングであり「兵器第10号」を意味するが、実在するアメリカ陸軍兵器・M10 (駆逐戦車)の型番も「M10」（Model10:10型）である。",price:random.rand(300..90000), category_id: "#{category.id}", brand_id: "#{brand.id}", size_id: "#{size.id}", status: status.sample(), delivery_fee_owner: delivery_fee_owner.sample(), delivery_date: delivery_date.sample(), sell_status_id: "#{sell_status.id}", shipping_method: shipping_method.sample(),area: "#{i}")

  Image.create(product_id: "#{product.id}",image: open("#{Rails.root}/db/fixtures/wolvarine.jpg"))
}


