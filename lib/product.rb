class Product
	attr_reader :title, :price, :stock
	@@products = []

	def initialize(options={})
		@title = options[:title]
		@price = options[:price]
		@stock = options[:stock]
		add_to_products
	end

	def self.all
		@@products
	end

	
	def add_to_products 
		if @@products.map { |product| product.title }.include? @title
			raise DuplicateProductError, "#{@title} already exists."
		else
		@@products << self
		end
	end

	def self.find_by_title(nameOfProduct)
		@@products.find{|eachName| eachName.title == nameOfProduct}
	end
end