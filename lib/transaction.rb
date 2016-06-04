class Transaction
	attr_accessor :product, :customer, :id, :transactions

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