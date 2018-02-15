module GeekHelper
  def start_date(item=nil)
    item ||= @item
    Time.parse item[:start]
  end

  def events
    @items.select do |event|
      !!event[:edition]
    end.sort_by do |event|
      -event[:edition]
    end
  end

  def latest
    @@first ||= events.first
  end

  def each_slice_with_continuous_index(collection, limit, &block)
    index = 1
    collection.each_slice(limit) do |c|
      c.each do |element|
        block.call(element, index)
        index = index + 1
      end
    end
  end
end