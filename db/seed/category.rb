major_category_names = %w(本 コンピューター ディスプレイ)
book_categories = %w(ビジネス 文学・評論 人文・思想 スポーツ
                  コンピューター・IT 資格・検定・就職 絵本・児童書 写真集
                  ゲーム攻略 雑誌 アート・デザイン ノンフィクション)
computer_categories = %w(ノートパソコン デスクトップパソコン タブレット)
display_categories = %w(19~20インチ デスクトップパソコン タブレット)

major_category_names.each do |major_category_name|
  if major_category_name == "本"
    book_categories.each do |book_category|
      Category.create!(
        major_category_name: major_category_name,
        name: book_category,
        description: book_category
      )
    end
  elsif major_category_name == "コンピューター"
    computer_categories.each do |computer_category|
      Category.create(
        major_category_name: major_category_name,
        name: computer_category,
        description: computer_category
      )
    end
  elsif major_category_name == "ディスプレイ"
    display_categories.each do |display_category|
      Category.create(
        major_category_name: major_category_name,
        name: display_category,
        description: display_category
      )
    end
  end
end
