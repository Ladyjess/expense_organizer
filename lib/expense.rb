class Expense

  attr_reader(:description, :id, :date, :amount, :category_id)

  define_method(:initialize) do |attributes|
    @description = attributes[:description]
    @id = attributes[:id]
    @date = attributes[:date]
    @amount = attributes[:amount]
    @category_id = attributes[:category_id]
  end

  define_singleton_method(:all) do
    returned_expenses = DB.exec("SELECT * FROM expenses;")
      expenses = []
      returned_expenses.each() do |expense|
        description = expense.fetch("description")
        id = expense.fetch("id").to_i
        date = expense.fetch("date")
        amount = expense.fetch("amount")
        category_id = expense.fetch("category_id")
        expenses.push(Expense.new({:description => description, :id => id, :date => date, :amount => amount, :category_id => category_id}))
     end
     expenses
   end

   define_singleton_method(:filter) do |id|
     Expense.all().each do |expense|
       if expense.id().==(id)
         @filtered_expense = []
         @filtered_expense.push(expense)
       end
     end
     @filtered_expense
   end

  define_method(:save) do
    result = DB.exec("INSERT INTO expenses (description, id, date, amount, category_id) VALUES ('#{@description}', #{@id}, '#{@date}', '#{@amount}', #{@category_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_expense|
    self.description() == another_expense.description() && self.id() == another_expense.id()
    # self.date() == another_expense.date() && self.amount() == another_expense.amount() &&
    # self.category_id() == another_expense.category_id()
  end
end











 # define_method(:update) do |attributes|
 #   @description =attributes.fetch(:description)
 #   @id = self.id()
 #   @date = self.date()
 #   @amount = self.amount()
 #   @category_id = self.category_id()

  # define_singleton_method(:find) do |search_by, search_term|
  #   results = []
  #   the_expense = []
  #   Expense.all.each() do |searched_expense|
  #     if search_by.eql?("description")
  #       if searched_expense.description().include?(search_term)
  #         the_expense = searched_expense
  #         results.push(the_expense)
  #       end
  #     elsif search_by.eql?("amount")
  #       if searched_expense.amount().eql?(search_term)
  #         the_expense = searched_expense
  #         results.push(the_expense)
  #       end
  #     elsif search_by.eql?("category")
  #       if searched_expense.category().eql?(search_term)
  #         the_expense = searched_expense
  #         results.push(the_expense)
  #       end
  #     end
  #   end
  #   results
  # end

  # define_method(:categories) do
  #   expense_categories = []
  #   categories = DB.exec("SELECT * FROM categories WHERE category_id = #{self.id()};")
  #   categories.each do |category|
  #     description = category.fetch("description")
  #     category_id = category.fetch("category_id").to_i()
  #     expense_categories.push(Category.new(
  #   end
  # end
