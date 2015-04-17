import tkinter as tk
import MyCalendar as mC

CALENDAR_TABLE = {1:"January",2:"February",3:"March",4:"April",5:"May",6:"June",7:"July",\
                  8:"August",9:"September",10:"October",11:"November",12:"December"}
WEEKDAY_DICT = {0:"S", 1:"M", 2:"T", 3:"W", 4:"T",\
                5:"F", 6:"S"}

class CalDisplay:

    def __init__(self, day, month, year):

        self.__my_cal = mC.Calendar(day, month, year)
        
        self.__main_window = tk.Toplevel(master=None)
        self.__main_window.title(" ")

        self.__date_frame = tk.Frame(self.__main_window)
        self.__LABEL = CALENDAR_TABLE[self.__my_cal.get("month")]+" "+\
                       str(self.__my_cal.get("year"))
        tk.Label(self.__date_frame, text=self.__LABEL).pack()
        
        self.__calendar_frame = tk.Frame(self.__main_window)
        for day in WEEKDAY_DICT:
            tk.Label(self.__calendar_frame, text=WEEKDAY_DICT[day], width=3).grid(row=0, column=day)
        month_len = self.__my_cal.get("month length")
        self.__fillCalendar(self.__calendar_frame, self.__my_cal.weekday(), month_len)
            

        self.__calendar_frame.pack(side="bottom")
        self.__date_frame.pack(side="top")
        

##    def setDate(self, day, month, year):
##        self.__my_cal.set("day", day)
##        self.__my_cal.set("month", month)
##        self.__my_cal.set("year", year)

    def __fillCalendar(self, frame, weekday, length):
        counter = 1
        countingFlag = False
        for x in range(1,7):
            for y in range(0,7):
                if countingFlag:
                    if counter<=length:
                        tk.Label(frame, text=counter, width=3).grid(row=x, column=y)
                        counter+=1
                if y==weekday and not countingFlag:
                    tk.Label(frame, text=counter, width=3).grid(row=x, column=y)
                    counter+=1
                    countingFlag= True
        
