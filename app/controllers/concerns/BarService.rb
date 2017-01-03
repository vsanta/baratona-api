require 'yelp'

class BarService

  def initialize
    @limit = 20
    @bars = []
    @total_bars = 0
  end

  def filtered(args={})
    filters = {term: args.fetch(:bar_name),
      category_filter: "bars",
      offset: 0,
      limit: @limit,
      sort: 0}
      response = api_call_filtered(filters)

      @total_bars = response.total

      populate_bars response
      while number_of_extra_calls > 0 do
        filters[:offset] = @bars.size
        populate_bars api_call_filtered(filters)
      end

      @bars
  end

  def all
    response = api_call
    @total_bars = response.total

    populate_bars response
    while number_of_extra_calls > 0 do
      populate_bars api_call(@bars.size)
    end

    @bars
  end

  private

  def populate_bars(response)
    response.businesses.each do |business|
      bar = Bar.new
      bar.name = business.name
      bar.image_url = business.image_url
      bar.yelp_id = business.id
      @bars << bar
    end
  end

  def api_call(offset=0)
    Yelp.client.search("Park Slope", {term:"the double windsor", category_filter: "bars", offset: offset, limit: @limit, sort: 0})
  end

  def api_call_filtered(filters)
    Yelp.client.search("Park Slope", filters)
  end

  def number_of_extra_calls
    ((@total_bars - @bars.size) / @limit.to_f).ceil
  end
end
