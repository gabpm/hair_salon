require("spec_helper")


describe(Client) do

  describe("#name") do
    it("returns a clients name") do
      test_client =Client.new({:name => "Joaquin", :id => nil, :stylist_id => 1})
      expect(test_client.name()).to(eq("Joaquin"))
    end
  end
end
