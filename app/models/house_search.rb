class HouseSearch
  def initialize(house)
    @house = house
  end

  def members
    raw_member_data = get_members(house)
    create_members(raw_member_data)
  end

  def get_members(house)
    @raw_member_data ||= PotterService.new.get_house_members(house)
  end

  private
    attr_reader :house

    def create_members(raw_member_data)
      raw_member_data.map do |member|
        Member.new(member)
      end
    end
end
