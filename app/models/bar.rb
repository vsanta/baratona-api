class Bar

  attr_accessor  :formatted_address, :geometry, :icon, :place_id, :name, :types

  def initialize(args={})
    @formatted_address = args.fetch(:formatted_address,"")
    @geometry =  args.fetch(:geometry,{})
    @icon = args.fetch(:icon,"")
    @place_id = args.fetch(:id,"")
    @name = args.fetch(:name,"")
    @types = args.fetch(:types,[])
  end

end
