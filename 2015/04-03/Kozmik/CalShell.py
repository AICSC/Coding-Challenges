import MyCalendar as mc

CALENDAR_TABLE = {1:"January",2:"February",3:"March",4:"April",5:"May",6:"June",7:"July",\
                  8:"August",9:"September",10:"October",11:"November",12:"December"}
WEEKDAY_TABLE = {0:"S", 1:"M", 2:"T", 3:"W", 4:"T",\
                5:"F", 6:"S"}

def __main():
    userCont = "y"
    correctType = False
    while userCont == "y":
        while correctType == False:
            try:
                month = int(input("Which month is to be displayed? "))
                year = int(input("Which year is to be displayed? "))
                if year<0:
                    print("\nERROR! Please enter a positive integer.\n")
                else:
                    
                    userCal = mc.Calendar(1, month, year)
                    print("\n" + __makeCalendar(userCal), end="")
                    correctType = True
            except ValueError:
                print("\nERROR! Please enter a positive integer.\n")
            except KeyError:
                print("\nERROR! Enter an appropriate value for month.\n")
        

        my_exception=True
        while my_exception == True:
            userCont = input("Continue? [y/n] ")
            if userCont == "y" or userCont == "n":
                my_exception = False
                correctType =False
            else:
                print("\nERROR! Please input a [y/n].\n")

def __makeCalendar(calendar):
    length = calendar.get("month length")
    weekday = calendar.weekday()
    counter = 1
    countingFlag = False
    calString = CALENDAR_TABLE[calendar.get("month")] + " " + str(calendar.get("year"))
    calString = "\n" + calString.center(21)
    calString += "\n"
    for day in WEEKDAY_TABLE:
            calString += "{0:>3s}".format("  "+WEEKDAY_TABLE[day])
    calString += "\n"
    for x in range(1,8):
        for y in range(0,7):
            if countingFlag:
                if counter<=length:
                    calString += "{0:>3s}".format(str(counter))
                    counter+=1
            elif y==weekday and not countingFlag:
                calString += "{0:>3s}".format(str(counter))
                counter+=1
                countingFlag= True
            else:
                calString += "   "
        calString += "\n"
    return calString
__main()
print("\nEND PROGRAM")
