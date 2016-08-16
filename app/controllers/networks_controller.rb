class NetworksController < InheritedResources::Base


def show
		@network = Network.find(params[:id])
		e= Encode.new("youarestupid")
		@network.pwd= e.decrypt(@network.pwd)
		puts "category id is "+ @network.pwd.to_s
end
	
	
def create
		@network = Network.new(network_params)
		e= Encode.new("youarestupid")
		@network.pwd= e.encrypt(@network.pwd)
		puts "category id is "+ @network.pwd.to_s
		if(@network.save)
			redirect_to networks_path, :notice => "Your Network has been saved"
		else
			render "new"
		end
    end
	
	
	def update
		@network = Network.find(params[:id])
		if(@network.update_attributes(network_params))
			redirect_to network_path, :notice => "Your Network has been updated"
		else
			render "edit"
		end
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



  private

    def network_params
      params.require(:network).permit(:name, :title, :content, :pwd, :ssid)
    end
	
	

end

