import os
import threading
import time
import tkinter as tk

# create window
import requests as requests
window = tk.Tk()
window.title("UTYK")
window.geometry('165x180')
statusLabel = tk.Label(text="Service Stauts")
statusLabel.pack(pady=10, padx=5, anchor="w")

# rcnovell-dhcpd status
statusDHCPLabel = tk.Label(text="rcnovell-ipsmd: ")
statusDHCPLabel.pack(pady=5, padx=5, side=tk.LEFT, anchor="w")

def ipsmdcheck():
    while True:
        if os.path.isfile('X:\ipsmdonline'):
            onlineDHCPLabel = tk.Label(text="ONLINE",
                                        fg="white",
                                        bg="green")
            onlineDHCPLabel.pack(side=tk.LEFT, anchor="w")
            time.sleep(1)
            onlineDHCPLabel.pack_forget()
        else:
            offlineDHCPLabel = tk.Label(text="OFFLINE",
                                        fg="white",
                                        bg="red")
            offlineDHCPLabel.pack(side=tk.LEFT, anchor="w")
            time.sleep(1)
            offlineDHCPLabel.pack_forget()


backgroundfunctionipsmd = threading.Thread(name='ipsmdcheck', target=ipsmdcheck)
backgroundfunctionipsmd.start()

window.mainloop()
