require_relative 'entry'
require "csv"

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

    def import_from_csv(file_name)
        csv_text = File.read(file_name)
        csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
        csv.each do |row|
            row_hash = row.to_hash
            add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
        end
    end

    def binary_search(name)
        


    end
end
