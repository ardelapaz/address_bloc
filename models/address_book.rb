require_relative 'entry'

class AddressBook 
    attr_reader :entries

    def initialize
        @entries = []
        specific = ''
    end

    def add_entry(name, phone_number, email)
        index = 0
        entries.each do |entry|
            if name < entry.name
                break
            end
            index+=1
        end
        entries.insert(index, Entry.new(name, phone_number, email))
    end

    def remove_entry(name, phone_number, email) 
        deleted = nil
        entries.each do |entry|
            if name == entry.name
                if phone_number == entry.phone_number
                    if email == entry.email
                        deleted = entry
                    end
                end
            end
        end
        entries.delete(deleted)
    end

    def search(number)
        entries.each do |entry| #loop through the entries array
            if number == entries.index #if the index desired matches the index in the array
                specific = entry.to_s #assign a new variable to the entry's details (to_s)
                puts specific #print the entries details to the console
            end
        end
    end

    def amount #determine how many elements in the array for invalid entry testing
        entries.length
    end
end
