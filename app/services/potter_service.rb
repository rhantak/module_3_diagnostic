class PotterService
  def get_house_members(house)
    response = fetch_data("/characters?house=#{house}")
    parse_data(response)
  end

  private
    def fetch_data(url)
      conn.get(url)
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new(url: "https://www.potterapi.com/v1") do |faraday|
        faraday.params["key"] = ENV['POTTER_API_KEY']
        faraday.adapter Faraday.default_adapter
      end
    end
end
