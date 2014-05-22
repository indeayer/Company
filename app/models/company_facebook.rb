class CompanyFacebook < ActiveRecord::Base

	require 'nokogiri'
	require 'open-uri'
	require 'net/http'

	validates_uniqueness_of :fid
	validates_uniqueness_of :company_name
	validates_uniqueness_of :f_url

	def self.updatelike        #Defining a method (.self means calling the method Detail from what I created eg: rails g Detail "tablename and data")
		 
		url = "http://localhost:3000/company_facebooks"
		data = Nokogiri::HTML(open(url).read) #Opening the whole 9gag content and store it into data

		value = data.css("tbody") #(Now we shorten the area of class of what we want and store it into a new variable )

		id = value.css("tr")
		 #( Now we open back the shorten class inside value and shorten it more to 9gag article)
		
		id.count #(.count will count how many articles that are inside the value.css("article") used for confimation if the details are grabbed on the page)
		
		
		id.each do |x|     #Because there alot of article inside 9gag , we will be required to use ARRAYS to store in, the system will reloop once each article is founded.
			x.css("td.facebook_id").text  

	        facebook_id = x.css("td.facebook_id").text

	        url = "graph.facebook.com/#{facebook_id}"

	        puts url

	        uri = URI("http://graph.facebook.com/#{facebook_id}")
            data = Net::HTTP.get(uri)
            @likes = JSON.parse(data)['likes']


            puts "#{@likes}"

            CompanyFacebook.all

            details = CompanyFacebook.where(:fid => "#{facebook_id}").first
            details.f_likes
            details.f_likes = "#{@likes}"
            details.save

       
            #Detail.create(title: x.css("h2.badge-item-title").css("a.badge-evt").text.strip , article_url: x.css("h2.badge-item-title").css("a.badge-evt").attr('href').text, image: x.css("img.badge-item-img/@src").text, points:x.css("a.badge-evt").css("span.badge-item-love-count").text, comments:x.css("a.comment").text)
            #After confirmation from what we grabbed is correct by the last step , we now generate a query to Insert into Sqlite3 database Detail table.

		end
	end
end
