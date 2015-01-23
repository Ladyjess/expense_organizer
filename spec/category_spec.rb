require('spec_helper')

describe(Category) do

  describe(".all") do
    it("is empty at frst") do
      expect(Category.all()).to(eq([]))
    end
  end

  
end
