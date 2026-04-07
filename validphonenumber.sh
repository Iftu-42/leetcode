grep -P '^(\d{3}-\d{3}-\d{4}|\(\d{3}\) \d{3}-\d{4})$' file.txt

# Use grep with regex to filter valid phone numbers
# ^ and $ ensure full line match
# \d{3} means exactly 3 digits
# | means OR
# \( \) are used to match literal parentheses
