namespace :fixed_update do
  desc "固定費をfixed_costsテーブルに登録する"

  task monthly: :environment do
    today = Date.today
    FixedCost.create(fixecate_id: 2 ,fixecate_name_id:6 ,price: 70000 ,month:  Date.new(today.year,today.month))
    FixedCost.create(fixecate_id: 2 ,fixecate_name_id: 7 ,price: 6000 ,month:  Date.new(today.year,today.month))
    FixedCost.create(fixecate_id: 6 ,fixecate_name_id: 8 ,price: 70000 ,month:  Date.new(today.year,today.month))
    FixedCost.create(fixecate_id: 6 ,fixecate_name_id: 9 ,price: 1980 ,month:  Date.new(today.year,today.month))
    FixedCost.create(fixecate_id: 6 ,fixecate_name_id: 10 ,price: 1480 ,month:  Date.new(today.year,today.month))
    FixedCost.create(fixecate_id: 6 ,fixecate_name_id: 11 ,price: 1980 ,month:  Date.new(today.year,today.month))
    FixedCost.create(fixecate_id: 4 ,fixecate_name_id: 5 ,price: 10000 ,month:  Date.new(today.year,today.month))
  end
end
