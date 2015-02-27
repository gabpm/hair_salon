require("spec_helper")

describe(Stylist) do

  describe("#name") do
    it("returns a list name") do
      test_stylist = Stylist.new({:name => "Manuel", :id => nil})
      expect(test_stylist.name()).to(eq("Manuel"))
    end
  end
end
