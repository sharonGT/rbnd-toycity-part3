class Transaction
	attr_accessor :product, :customer, :id

	@@transactions = []

	def initialize(customer, product)
		@customer = customer
		@product = product
		@id = 0
		add_transaction
	end

	def self.all
		@@transactions
	end

	def self.find(number)
		return @@transactions[number - 1]
	end

	def self.list_transaction
		@@transactions.each.with_index(1) do |transaction, index|
			puts "#{index}. #{transaction}"
		end
	end

	private

	def add_transaction
		if @product.stock <= 0
			raise OutOfStockError, "'{@product.title}' is out of stock"
		else
			@@transactions << self
			@product.stock -= 1
			@id += 1
		end
	end
end