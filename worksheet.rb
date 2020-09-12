########################################################
# Step 1: Establish the layers

# create a list of the layers you identify.
#   Drivers, dates, fares, riders, and ratings
#
# The outermost layer is the entire table, the list of rides.
#   Inside, 'next' to each other, will be the driver hashes. With driver and ride information.
#   Inside the ride information will be another layer, with a list of rides.
#   Inside the rides will be the ride details, with the rider, fare, date, and rating information running parallel.

########################################################
# Step 2: Assign a data structure to each layer
#
# The outermost layer is the entire table, the list of rides. Rides = {}
#   Inside, 'next' to each other, will be the driver hashes. With driver and ride information. :DriverID, ride_info
#     Inside the ride information will be another layer, with a list of rides. ride_info = [multiple rides]
#       Inside the rides will be the ride details, with the rider, fare, date, and rating information running parallel. ride = {:RiderID, :$, :*}

########################################################
# Step 3: Make the data structure!

Rideshare = {
    DR0004: [
        {Date: "3rd Feb 2016",
         Fare: 5,
         Rider: "RD0022",
         Rating: 5
        },
        {Date: "4th Feb 2016",
         Fare: 10,
         Rider: "RD0022",
         Rating: 4
        },
        {Date: "5th Feb 2016",
         Fare: 20,
         Rider: "RD0073",
         Rating: 5
        }
    ],
    DR0003: [
    {Date: "4th Feb 2016",
     Fare: 5,
     Rider: "RD0066",
     Rating: 5
    },
    {Date: "5th Feb 2016",
     Fare: 50,
     Rider: "RD0003",
     Rating: 2
    }
],
    DR0002: [
    {Date: "3rd Feb 2016",
     Fare: 25,
     Rider: "RD0073",
     Rating: 5
    },
    {Date: "4th Feb 2016",
     Fare: 15,
     Rider: "RD0013",
     Rating: 1
    },
    {Date: "5th Feb 2016",
     Fare: 35,
     Rider: "RD0066",
     Rating: 3
    }
],
    DR0001: [
    {Date: "3rd Feb 2016",
     Fare: 10,
     Rider: "RD0003",
     Rating: 3
    },
    {Date: "3rd Feb 2016",
     Fare: 30,
     Rider: "RD0015",
     Rating: 4
    },
    {Date: "5th Feb 2016",
     Fare: 45,
     Rider: "RD0003",
     Rating: 2}
]
}

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# Use an iteration blocks to print the following answers:

# - the number of rides each driver has given
def number_of_rides (driver)
  Rideshare[driver].length
end

# - the total amount of money each driver has made
def amount_made(driver)
  amount_made = 0
  Rideshare[driver].each do |ride|
    amount_made += ride[:Fare]
  end
  return amount_made
end

# - the average rating for each driver
def average_rating(driver)
  sum = 0
  Rideshare[driver].each do |rate|
    sum += rate[:Rating].to_f
  end
  average_rating = (sum / Rideshare[driver].length)
  return average_rating
end

# - Which driver made the most money?
most_made_by = ""
total_amount = 0

Rideshare.each do |driver, info|
  if amount_made(driver) > total_amount
    most_made_by = driver
    total_amount = amount_made(driver)
  end
end

# - Which driver has the highest average rating?
highest_average_rating = 0
driver_with_highest_rating = ""

Rideshare.each do |driver, info|
  if average_rating(driver) > highest_average_rating
    driver_with_highest_rating = driver
    highest_average_rating = average_rating(driver)
  end
end

#Printed output
Rideshare.each do |driver, info|
  print "\nDriver #{driver } has given #{number_of_rides(driver)} rides, has made $#{amount_made(driver)}, and has an average rating of %.2f stars. \n" % average_rating(driver)
end

print "\nDriver #{most_made_by} made the most, $#{total_amount}. \nDriver #{driver_with_highest_rating} had the highest rating, %.2f stars." % highest_average_rating
