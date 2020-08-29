class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def user_tall_enough
        self.user.height >= self.attraction.min_height 
    end 

    def user_has_enough_tickets
        self.user.tickets >= self.attraction.tickets 
    end 

    def take_ride
        if user_has_enough_tickets && user_tall_enough
             self.user.tickets -= self.attraction.tickets 
             self.user.nausea += self.attraction.nausea_rating 
             self.user.happiness += self.attraction.happiness_rating 
             self.user.save
             "Thanks for riding the #{self.attraction.name}!"
        elsif !self.user_tall_enough && !self.user_has_enough_tickets 
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
        elsif !self.user_tall_enough
            "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        elsif !self.user_has_enough_tickets
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        end 
     end 
end
