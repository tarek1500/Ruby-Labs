class ComplexNumber
	attr_accessor :real, :imaginary

	@@add_operations = 0
	@@multiply_operations = 0

	def initialize(real, imaginary)
		@real = real
		@imaginary = imaginary
	end

	def +(cn)
		real = cn.real + @real
		imaginary = cn.imaginary + @imaginary
		@@add_operations += 1
		ComplexNumber.new(real, imaginary)
	end

	def *(cn)
		real = (cn.real * @real) - (cn.imaginary * @imaginary)
		imaginary = (cn.real * @imaginary) + (cn.imaginary * @real)
		@@multiply_operations += 1
		ComplexNumber.new(real, imaginary)
	end

	def self.bulk_add(cns)
		if cns.length > 1
			complex = cns[0]

			cns[1..-1].each do |cn|
				complex += cn
			end

			return complex
		end

		ComplexNumber.new(0, 0)
	end

	def self.bulk_multiply(cns)
		if cns.length > 1
			complex = cns[0]

			cns[1..-1].each do |cn|
				complex *= cn
			end

			return complex
		end

		ComplexNumber.new(0, 0)
	end

	def get_stats
		puts "Add operations: " + @@add_operations.to_s + " , Multiply operations: " + @@multiply_operations.to_s
	end

	def print
		puts real.to_s + ' + ' + imaginary.to_s + 'i'
	end
end

complex1 = ComplexNumber.new(3, 2)
complex2 = ComplexNumber.new(1, 7)
complex3 = ComplexNumber.new(5, 10)
complex4 = ComplexNumber.new(8, 4)

temp = complex1 + complex2 + complex3 + complex4
temp.print
temp.get_stats

temp = complex1 * complex2 * complex3 * complex4
temp.print
temp.get_stats