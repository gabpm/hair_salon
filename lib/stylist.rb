class Stylist
 attr_reader(:name, :id)

 define_method(:initialize) do |attributes|
   @name = attributes.fetch(:name)
   @id = attributes.fetch(:id)
 end

 define_singleton_method(:all) do
   returned_stylists = DB.exec("SELECT * FROM stylists;")
   stylists = []
   returned_stylists.each() do |stylist|
     name = stylist.fetch("name")
     id = stylist.fetch("id").to_i()
     stylists.push(Stylist.new({:name => name, :id => id}))
   end
   stylists
 end

 define_method(:save) do
   result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
   @id = result.first().fetch("id").to_i()
 end

 define_method(:==) do |another|
   self.name().==(another.name())
 end

 define_singleton_method(:find) do |id|
   found_stylist = nil
   Stylist.all().each() do |stylist|
     if stylist.id().==(id)
       found_stylist = stylist
     end
   end
   found_stylist
end

 define_method(:clients) do
  list_clients = []
  clients = DB.exec("SELECT * FROM clients WHERE stylist_id = #{self.id()};")
  clients.each do |client|
    name = client.fetch("name")
    id = client.fetch("id").to_i()
    stylist_id = client.fetch("stylist_id").to_i()
    list_clients.push(Client.new({:name => name, :id => id, :stylist_id => stylist_id}))
  end
  list_clients
end
end
