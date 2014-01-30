Event Manager wrapped in EventManager Class 
Written in Ruby 2.0

To Process an event:

my_event = EventManager.new "event_name", "my_csv.csv", "my_form.erb"
my_event.main

This will create a directory named "event_name".

- Information for target marketing is saved in "event_name/sign_up_count_sheet.txt"
- Valid phone numbers are saved in "event_name/valid_phone_numbers.txt"
- "Thank you" letters are saved in "event_name/output/"

! - This class is limited by the csv format provided in the exercise. (The methods that retrieve information from the csv file are hard coded and will not work with formats that do not include the same headings ei. :zipcode, :homephone etc.)