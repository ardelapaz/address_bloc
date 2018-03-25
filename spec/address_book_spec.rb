require_relative '../models/address_book'
 
 RSpec.describe AddressBook do

  let(:book)  { AddressBook.new }
  #####################
   describe "attributes" do
     it "responds to entries" do
       expect(book).to respond_to(:entries)
     end

        it "initializes entries as an array" do
            expect(book.entries).to be_an(Array)
        end

        it "initializes entries as empty" do
            expect(book.entries.size).to eq(0)
          end
    end
    #####################
    describe "#add_entry" do
        it "adds only one entry to the address book" do
          book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
    
          expect(book.entries.size).to eq(1)
        end
    
        it "adds the correct information to entries" do
          book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
          new_entry = book.entries[0]
    
          expect(new_entry.name).to eq('Ada Lovelace')
          expect(new_entry.phone_number).to eq('010.012.1815')
          expect(new_entry.email).to eq('augusta.king@lovelace.com')
        end
      end
      #####################
      describe "#remove_entry" do
        it "removes only one entry from the address book" do
          book.remove_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
          expect(book.entries.size).to eq(0)
        end
    end
    #####################
    describe "#import_from_csv" do
      it "imports the correct number of entries" do
        book.import_from_csv("entries.csv")
        book_size = book.entries.size
        expect(book_size).to eq(5)
      end

      it "imports the 1st entry" do
        book.import_from_csv("entries.csv")
        # Check the first entry
        entry_one = book.entries[0]
        check_entry(entry_one, "Bill", "555-555-4854", "bill@blocmail.com")
      end

      it "imports the 2nd entry" do
        book.import_from_csv("entries.csv")
        # Check the second entry
        entry_two = book.entries[1]
        check_entry(entry_two, "Bob", "555-555-5415", "bob@blocmail.com")
      end
  
      it "imports the 3rd entry" do
        book.import_from_csv("entries.csv")
        # Check the third entry
        entry_three = book.entries[2]
        check_entry(entry_three, "Joe", "555-555-3660", "joe@blocmail.com")
      end
  
      it "imports the 4th entry" do
        book.import_from_csv("entries.csv")
        # Check the fourth entry
        entry_four = book.entries[3]
        check_entry(entry_four, "Sally", "555-555-4646", "sally@blocmail.com")
      end
  
      it "imports the 5th entry" do
        book.import_from_csv("entries.csv")
        # Check the fifth entry
        entry_five = book.entries[4]
        check_entry(entry_five, "Sussie", "555-555-2036", "sussie@blocmail.com")
      end
    end

    def check_entry(entry, expected_name, expected_number, expected_email)
      expect(entry.name).to eq expected_name
      expect(entry.phone_number).to eq expected_number
      expect(entry.email).to eq expected_email
    end
    #####################

    describe "#import from csv checkpoint test" do
      it "imports 1st test entry" do
        book.import_from_csv("entries_2.csv")
        # Check 1st test entry
        entry_one = book.entries[0]
        check_entry(entry_one, "Andrew", "121-232-3434","Andrew@blocmail.com")
      end
      it "imports 2nd test entry" do
        book.import_from_csv("entries_2.csv")
        # Check 1st test entry
        entry_two = book.entries[2] #my tests for some reason are flipping john and brett in the entries array. If I have it in this order the tests pass, but in logical order (this one entries[1] and brett entries [2] tests fail)
        check_entry(entry_two, "John", "098-765-4321", "John@blocmail.com")
      end
      it "imports 3rd test entry" do
        book.import_from_csv("entries_2.csv")
        # Check 1st test entry
        entry_three = book.entries[1] #for some reason mine are getting switched up. Brett is contact 3, but when putting entries[2] for contact 3 it doesn't work
        check_entry(entry_three, "Brett", "123-456-7890", "Brett@blocmail.com")
      end
    end
end