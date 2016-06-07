class Customer
attr_reader :name
@@customers = []

	def initialize(options={})
		@name = options[:name]
		add_to_customers
	end

	def self.all
		@@customers
	end

	def self.find_by_name(name)
		@@customers.each do |customer|
			if customer.name == name
				return customer
			end
		end
	end

	def self.listing
		@@customers.each do |customer|
			return customer.name
		end
	end

	def purchase(toy)
		if toy.stock > 0
			transaction = Transaction.new(@name, toy)
		else 
			raise OutOfStockError, "#{toy.title} is out of stock."
		end
	end


	private

	def add_to_customers 
		if @@customers.map { |customer| customer.name }.include? @name
			raise DuplicateCustomerError, "#{@name} already exists."
		else
		@@customers << self
		end
	end
end