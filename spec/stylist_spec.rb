require("spec_helper")

describe(Stylist) do

  describe("#name") do
    it("returns a list name") do
      test_stylist = Stylist.new({:name => "Manuel", :id => nil})
      expect(test_stylist.name()).to(eq("Manuel"))
    end
  end

  describe("#id") do
    it("returns it ID") do
      test_stylist = Stylist.new({:name => "Manuel", :id => nil})
      expect(test_stylist.id()).to(eq(nil))
    end
  end

  describe(".all") do
    it("returns all stylists") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds a stylist to an array of stylists') do
      test_stylist = Stylist.new(:name => "Manuel", :id => nil)
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
    end
  end

  define_method("#==") do
    it("is the same name if it has the same name") do
      test_stylist = Stylist.new({:name => "Sophia", :id => nil})
      test_stylist2 = Stylist.new({:name => "Mariana", :id => nil})
      expect(test_stylist).to(eq(test_stylist2))
    end
  end

end
