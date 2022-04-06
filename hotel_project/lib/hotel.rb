require "byebug"
require_relative "room"


class Hotel
    attr_accessor :rooms
    def initialize(name,hash)
        @name = name
        @rooms = {}
        hash.each {|k,v| @rooms[k] = Room.new(v)}
    end
    def name
        @name.split(" ").map{|word| word.capitalize}.join(" ")
    end

    def room_exists?(room_name)
        return true if @rooms.has_key?(room_name)
        false
    end

    def check_in(person, room)
        if !room_exists?(room)
            print "sorry, room does not exist" 
        else
            if @rooms[room].add_occupant(*person)
                print "check in successful"
            else
                print "sorry, room is full"
            end
        end
       
    end

    def has_vacancy?
        @rooms.each_value{|room| return true if room.available_space > 0}
        false
    end

    def list_rooms
        @rooms.each{|key, value| puts "#{key} : #{value.available_space}"}
    end

end

