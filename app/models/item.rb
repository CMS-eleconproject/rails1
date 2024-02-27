class Item < ApplicationRecord
  require 'net/http'
  require 'json'

  def self.fetch_data
    uri = URI('https://jsonplaceholder.typicode.com/comments')

    begin
      response = Net::HTTP.get(uri)
      data = JSON.parse(response)

      data.each do |item_data|
        Item.create(
          title: item_data['name'],
          body: item_data['body'],
          image_url: 'https://via.placeholder.com/250'
        )
      end
    rescue StandardError => e
      Rails.logger.error("Error fetching data from API: #{e.message}")
    end
  end
end