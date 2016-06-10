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
		@@customers.find{|customer| customer.name == name}
	end

	def purchase(toy)
		transaction = Transaction.new(@name, toy)
	end

	def self.refund_customer(index)
		@@customers.delete_at(index)
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