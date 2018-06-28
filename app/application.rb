class Application
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      item_name_in_path = req.path.split("/items").last
      
      item = Item.all.select { |item| item.name == item_name_in_path }.first
      
      if item 
        resp.write item.price
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    
    resp.finish
  end
end