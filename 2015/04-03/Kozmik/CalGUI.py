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
        try: #Check for appropriate values for month and year
            month=int(self.__month.get())
            year=int(self.__year.get())
            if year<0: #Check for positive year entry
                self.__error_window = tk.messagebox.showerror("Error", "Please input a positive value for Year")
            else:
                calendar = cd.CalDisplay(1, month, year)
        except KeyError:
            self.__error_window = tk.messagebox.showerror("Error", "Please input an appropriate value for Month")
        except ValueError:
            self.__error_window = tk.messagebox.showerror("Error", "Please input appropriate integer values\n"\
                                                          "(1-12 for Month, greater than 0 for Year")
                
