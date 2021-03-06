class Product
	attr_reader :title, :price
	attr_accessor :stock
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

	def self.find_by_title(title)
		@@products.find {|product| product.title == title}
	end

	def in_stock?
		return @stock > 0
	end

	def self.in_stock
		stock_list = []
		@@products.each do |product|
			if product.stock > 0
				stock_list << product
			end
		end
		return stock_list
	end

	private

	def add_to_products 
		if @@products.map { |product| product.title }.include? @title
			raise DuplicateProductError, "#{@title} already exists."
		else
		@@products << self
		end
	end
end