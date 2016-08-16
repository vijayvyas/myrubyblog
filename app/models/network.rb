class Network < ApplicationRecord

before_save do
	e= Encode.new("youarestupid")
	self.pwd= e.encrypt(self.pwd)
end

	class Encode
	  def initialize(key)
		@salt= key
	  end

		ALPHABET = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789~!@#$%^&*_"

		#generated with .split('').shuffle.join
		ENCODING = "tiHT52SGI64VzQ31wMOhqm0PnycUZeBrxoAkas9RWlXpEujLdK8YvDCgNfb7FJ*&@%$#^!~_"

		def encrypt(text)
			return (@salt.reverse+text.reverse).reverse.tr(ALPHABET, ENCODING)
		end

		def decrypt(text)
		puts "decrypt text "+text.tr(ENCODING, ALPHABET)
						.reverse
		   return text.tr(ENCODING, ALPHABET)
						.reverse
						.slice(@salt.length,200)
						.reverse
		end
	end


end
