class Category

attr_reader(:description, :total, :id)

define_method(:initialize) do |attributes|
  @description = attributes[:description]
  @total= attributes[:total]
  @id = attributes[:id]
end

  define_singleton_method(:all) do
    returned_categories = DB.exec("SELECT * FROM categories;")
    categories = []
    returned_categories.each() do |category|
      description = category.fetch("description")
      total = category.fetch("total")
      id = id.fetch("id")
      categories.push(Category.new({:description => description, :total => total, :id => id}))
    end
    categories
  end

  define_method(:save) do
    DB.exec("INSERT INTO categories (description, total) VALUES ('#{@description}', #{@total})")
  end

  define_method(:==) do |another_category|
    self.description().==(another_category.description()).&(self.id().==(another_category.id()))
  end

  # define_method(:add_expense) do |expense|
  #   DB.exec("INSERT INTO categories_expenses (expense_id, category_id) VALUES ('#{expense.id}', #{@category_id})")
  # end

end
