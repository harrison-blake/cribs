require './lib/room'

class House
  attr_reader :address, :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def price
    # gsub(/\D/,'') returns removes non-integer characters and returns string
    # to_i takes remaining string and converts to integer
    @price.gsub(/\D/,'').to_i
  end

  def add_room(room)
    @rooms << room
  end

  def house_above_market_average?
    if price() >= 500000
      return true
    else
      return false
    end
  end

  def rooms_from_category(room_category)
    rooms_from_category = []

    @rooms.each do |room|
      if room.category == room_category
      rooms_from_category << room
      end
    end

    return rooms_from_category
  end

  def area
    house_area = 0

    @rooms.each do |room|
      house_area += room.area
    end

    return house_area
  end

  def details
    area = {"price" => price(), "address" => @address}
  end

  def price_per_square_foot
    price_per = price.to_f / area
    price_per.round(2)
  end

  def rooms_sorted_by_area
    rooms_by_area = @rooms.clone
    i = 0

    rooms_by_area.each do |room|
      j = 1
      while j < rooms_by_area.length
        if rooms_by_area[i].area < rooms_by_area[j].area
          temp = rooms_by_area[i]
          rooms_by_area[i] = rooms_by_area[j]
          rooms_by_area[j] = temp
          j += 1
        end
        i += 1
      end
    end
  end
end
