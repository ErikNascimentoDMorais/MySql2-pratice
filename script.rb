require "mysql2"

client = Mysql2::Client.new(:host =>"localhost", 
                        :username => "root",
                        :password => "",
                        :database => "people_cvs")

  
      

   
def upd(client)

    r = client.query("SELECT * FROM people_erik ").to_a 

    r.each do |n|

        id = n['id']
        firstname = n["firstname"]
        lastname =  (n["lastname"] + " edited").gsub(/( edited)\1$/,'\1')
        email = n["email"].downcase
        email2 = n["email2"].downcase
        profession = n["profession"].strip
        
        query = <<~SQL
           UPDATE people_erik SET lastname = "#{lastname}",
            email = "#{email}", email2 = "#{email2}", profession = "#{profession}" WHERE id = "#{id}"

           SQL
            client.query(query)
      
      
        

        

    end


    

end



upd(client)

client.close

