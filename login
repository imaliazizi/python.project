import ttkbootstrap as ttk
from colored import style
from ttkbootstrap.constants import *
from tkinter import messagebox
def login():
    name=entry1.get()
    lastname=entry2.get()
    email=entry3.get()
    if not name or not lastname or not email:
        messagebox.showerror("Error", "All fields must be filled!")
        return
    try:
        with open("database.txt", "a") as file:
            file.write(f"{name},{lastname},{email}\n")
        messagebox.showinfo("Success", "Data saved successfully!")
    except Exception as e:
        print("Error saving data:", e)
        messagebox.showerror("Error", "Failed to save data.")
app=ttk.Window(themename="darkly")
app.geometry("500x300+700+300")
app.title("LOGIN")
app.resizable(False , False)
label1=ttk.Label(text="NAME",font=1,bootstyle="white")
label1.grid(row=1,column=6,padx=220)
entry1=ttk.Entry(app,width=10,bootstyle="white")
entry1.grid(row=2,column=6,padx=5)
label2=ttk.Label(text="LAST NAME",font=1,bootstyle="white")
label2.grid(row=3,column=6,padx=5)
entry2=ttk.Entry(app,width=20,bootstyle="white")
entry2.grid(row=4,column=6,padx=5)
label3=ttk.Label(text="EMAIL",font=1,bootstyle="white")
label3.grid(row=5,column=6,padx=5)
entry3=ttk.Entry(app,width=35,bootstyle="white")
entry3.grid(row=6,column=6,padx=5)
button1=ttk.Button(app,text="save" ,style=INFO , command=login)
button1.grid(row=20, column=6, columnspan=2, pady=40)
app.mainloop()
