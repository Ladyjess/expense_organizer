require('spec_helper')

describe(Expense) do
  describe(".all") do
    it("is empty at first") do
      expect(Expense.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds an expense to the array of saved expenses") do
      test_expense = Expense.new({:description => "Fries", :id => 0, :date => "4/20/14", :amount => "1.75", :category_id => 1})
      test_expense.save()
      expect(Expense.all()).to(eq([test_expense]))
    end
  end

  describe("#==") do
    it("it makes sure one thing isn't handled as two separate objects") do
      test_expense = Expense.new({:description => "Fries", :id => 0, :date => "4/20/14", :amount => "1.75", :category_id => 1})
      test_expense2 = Expense.new({:description => "Fries", :id => 0, :date => "4/20/14", :amount => "1.75", :category_id => 1})
      expect(test_expense).to(eq(test_expense2))
    end
  end

  describe(".filter") do
    it("searches for an expense by its id") do
      test_expense = Expense.new({:description => "Fries", :id => 0, :date => "4/20/14", :amount => "1.75", :category_id => 1})
      test_expense.save()
      test_expense2 = Expense.new({:description => "Cola", :id => 3, :date => "4/20/14", :amount => "150.00", :category_id => 4})
      test_expense2.save()
      expect(Expense.filter(test_expense2.id())).to(eq([test_expense2]))
    end
  end

end







  # describe(".find") do
  #   it("searches for an expense using any attribute except id") do
  #     test_expense = Expense.new({:description => "Fries", :id => 0, :date => "4/20/14", :amount => "1.75", :category_id => 3})
  #     test_expense.save()
  #     expect(Expense.find("description", "Fries").to(eq([text_expense])))
  #   end
  # end
