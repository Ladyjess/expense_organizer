#setup database
db names = charges, charges_test
db tables = expenses, categories

Expenses
id(int)  |  description(varchar)  | date(timestamp)  | category_id(int) | amount(decimal)

Categories
id(int)  | description(varchar)  total(decimal)

Categories_Expenses
id(int)  | expense_id(int)  | category_id(int)
