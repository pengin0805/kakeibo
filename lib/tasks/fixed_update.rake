namespace :fixed_update do
  desc "固定費をfixed_costsテーブルに登録する"

  task monthly: :environment do
    today = Date.today
    FixedCost.create(fixecate_id: 2 ,fixecate_name_id: 2 ,price: 2000 ,month:  Date.new(today.year,today.month))
  end
end
