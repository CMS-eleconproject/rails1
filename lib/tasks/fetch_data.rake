namespace :data do
  desc 'Fetch data from API and create records'
  task fetch: :environment do
    Item.fetch_data
  end
end