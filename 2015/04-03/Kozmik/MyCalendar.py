# This is a class that can be used to instantiate a calendar object, which has attributes
# of day, month, and year and methods for retrieving and setting those attributes as well
# as a function that determines the day of the week given a date.

MONTHS_TABLE = {1:0, 2:3, 3:3, 4:6, 5:1, 6:4, 7:6, 8:2, 9:5, 10:0, 11:3, 12:5}
MONTHS_TABLE_LEAP = {1:6, 2:2, 3:3, 4:6, 5:1, 6:4, 7:6, 8:2, 9:5, 10:0, 11:3, 12:5}
WEEKDAY_TABLE = {0:"Sunday", 1:"Monday", 2:"Tuesday", 3:"Wednesday", 4:"Thursday", 5:"Friday", 6:"Saturday"}
GREGORIAN_TABLE = {0:6, 1:4, 2:2, 3:0}
JULIAN_TABLE = {4:0, 3:1, 2:2, 1:3, 0:4, 5:5}
MONTH_LEN = {1:31,2:28,3:31,4:30,5:31,6:30,7:31,8:31,9:30,10:31,11:30,12:31,13:29}

class Calendar:

    def __init__(self, day, month, year):
        self.__day = day
        self.__month = month
        self.__year = self.__correctYear(year)
        self.__month_length = self.__setMonthLength(month)
        self.__calendar_switch = 17 #Assumes a switch from Julian to Gregorian in 18th century

# Returns the user-specified item
    def get(self, item):
        if item == "date":
            return str(self.__day) + "/" + str(self.__month) + "/" + str(self.__year)
        if item == "year":
            return int(self.__year)
        if item == "day":
            return self.__day
        if item == "month":
            return self.__month
        if item == "month length":
            return self.__month_length

# Sets the user-specified value
    def set(self, item, value):
        if item == "year":
            self.__year = str(value)
        if item == "day":
            self.__day = value
        if item == "month":
            self.__month = value

    def __correctYear(self, year):
        tmp = str(year)
        if len(tmp) == 3:
            tmp = "0" + tmp
        if len(tmp) == 2:
            tmp = "00" + tmp
        if len(tmp) == 1:
            tmp = "000" + tmp
        return tmp
    
    def __setMonthLength(self, month):
        tmp = month
        if int(self.__year)%4==0 and month==2:
            tmp = MONTH_LEN[13]
        else:
            tmp = MONTH_LEN[month]
        return tmp

### Sets the year that the calendar witched from Julian to Gregorian to a user_
### specified value
##    def switchCal(self, year):
##        self.__calendar_switch = int(str(self.__year)[0] + str(self.__year)[1])

# Returns the day of the week for a given date
    def weekday(self):
        table = MONTHS_TABLE

        # determines whether a date occurs within a leap year and selects an
        # appropriate table
        if int(self.__year)%4 == 0:
            table = MONTHS_TABLE_LEAP
        month = table[self.__month]
            
        century = int(self.__year[0] + self.__year[1])
        year= int(self.__year[2] + self.__year[3])

        if century>=self.__calendar_switch:
            century = GREGORIAN_TABLE[century%4]
        else:
            century = JULIAN_TABLE[century%7]
        return (self.__day + month + year + year//4 + century)%7
        
            
