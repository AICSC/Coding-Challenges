import CalDisplay as cd
import tkinter as tk

class GUI:
    def __init__(self):
        self.__main = tk.Tk(className=" ")

        self.__top_frame = tk.Frame(self.__main)
        
        self.__month = tk.Entry(self.__top_frame, width=10)
        self.__year = tk.Entry(self.__top_frame, width =10)

        self.__month.grid(row=0, column=1)
        self.__year.grid(row=1, column=1)

        tk.Label(self.__top_frame, text="Month").grid(row=0, column=0)
        tk.Label(self.__top_frame, text="Year").grid(row=1, column=0)

        tk.Button(self.__top_frame, text="Calculate",\
                  command=self.__makeCal).grid(row=2, columnspan=2)
        
        self.__top_frame.pack()

        self.__main.mainloop()

    def __makeCal(self):
        month=int(self.__month.get())
        year=int(self.__year.get())
        calendar = cd.CalDisplay(1, month, year)
