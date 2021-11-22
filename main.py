import os
import threading
import time
import tkinter as tk
import pygame as pygame
import subprocess
from tkinter import messagebox

# create window
window = tk.Tk()
window.title("UTYK")
statusLabel = tk.Label(text="Service Stauts:")
statusLabel.grid(sticky = "w", row = 1, column = 0)


# mount SMBValueShare on x (creating field for ip/domain)
def mountX():
    print(ipadressEntry.get())
    subprocess.call(r'net use x: /del /y', shell=True)
    subprocess.call(r'net use x: \\'+ ipadressEntry.get() + '\SMBValueShare')

    if os.path.isdir('X:\\'):
        ipadressEntry.config(state = 'disabled')
        ipadressButton.grid_remove()
        backgroundfunctiondhcpd = threading.Thread(name = 'dhcpdcheck', target = dhcpdcheck)
        backgroundfunctionnamed = threading.Thread(name = 'namedcheck', target = namedcheck)
        backgroundfunctionipsmd = threading.Thread(name = 'ipsmdcheck', target = ipsmdcheck)
        backgroundfunctiontomcat = threading.Thread(name = 'tomcatcheck', target = tomcatcheck)
        backgroundfunctiondhcpd.start()
        backgroundfunctionnamed.start()
        backgroundfunctionipsmd.start()
        backgroundfunctiontomcat.start()
    else:
        messagebox.showerror("NW Error", "Can't connect to the submitted IP Address. Pleas Try again.")


# status Labels
statusDHCPDLabel = tk.Label(text="rcnovell-dhcpd: ")
statusDHCPDLabel.grid(row = 2, column = 0)

statusNAMEDLabel = tk.Label(text="rcnovell-named: ")
statusNAMEDLabel.grid(row = 3, column = 0)

statusIPSMDLabel = tk.Label(text="rcnovell-ipsmd: ")
statusIPSMDLabel.grid(row = 4, column = 0)

statusTOMCATLabel = tk.Label(text="rcnovell-tomcat: ")
statusTOMCATLabel.grid(row = 5, column = 0)

# Check functions
def dhcpdcheck():
    onlineDHCPLabel = tk.Label(text="ONLINE", fg="white", bg="green")
    offlineDHCPLabel = tk.Label(text="OFFLINE", fg="white", bg="red")
    dhcpdaudioval = 0

    while True:
        if os.path.isfile('X:\dhcpdonline'):
            offlineDHCPLabel.grid_remove()
            onlineDHCPLabel.grid(sticky = "w", row = 2, column = 1)
            time.sleep(1)
            dhcpdaudioval = 0
        else:
            onlineDHCPLabel.grid_remove()
            offlineDHCPLabel.grid(sticky = "w", row = 2, column = 1)
            time.sleep(1)
            if dhcpdaudioval == 0:
                pygame.mixer.init()
                pygame.mixer.music.load('ipsmd.wav')
                pygame.mixer.music.play()
                dhcpdaudioval = 1

def namedcheck():
    onlineNAMEDLabel = tk.Label(text="ONLINE", fg="white", bg="green")
    offlineNAMEDLabel = tk.Label(text="OFFLINE", fg="white", bg="red")
    ipsmdaudioval = 0

    while True:
        if os.path.isfile('X:\\namedonline'):
            offlineNAMEDLabel.grid_remove()
            onlineNAMEDLabel.grid(sticky = "w", row = 3, column = 1)
            time.sleep(1)
            ipsmdaudioval = 0
        else:
            onlineNAMEDLabel.grid_remove()
            offlineNAMEDLabel.grid(sticky = "w", row = 3, column = 1)
            time.sleep(1)
            if ipsmdaudioval == 0:
                pygame.mixer.init()
                pygame.mixer.music.load('ipsmd.wav')
                pygame.mixer.music.play()
                ipsmdaudioval = 1

def ipsmdcheck():
    onlineIPSMDLabel = tk.Label(text="ONLINE", fg="white", bg="green")
    offlineIPSMDLabel = tk.Label(text="OFFLINE", fg="white", bg="red")
    ipsmdaudioval = 0

    while True:
        if os.path.isfile('X:\ipsmdonline'):
            offlineIPSMDLabel.grid_remove()
            onlineIPSMDLabel.grid(sticky = "w", row = 4, column = 1)
            time.sleep(1)
            ipsmdaudioval = 0
        else:
            onlineIPSMDLabel.grid_remove()
            offlineIPSMDLabel.grid(sticky = "w", row = 4, column = 1)
            time.sleep(1)
            if ipsmdaudioval == 0:
                pygame.mixer.init()
                pygame.mixer.music.load('ipsmd.wav')
                pygame.mixer.music.play()
                ipsmdaudioval = 1

def tomcatcheck():
    onlineTOMCATLabel = tk.Label(text="ONLINE", fg="white", bg="green")
    offlineTOMCATLabel = tk.Label(text="OFFLINE", fg="white", bg="red")
    ipsmdaudioval = 0

    while True:
        if os.path.isfile('X:\\tomcatonline'):
            offlineTOMCATLabel.grid_remove()
            onlineTOMCATLabel.grid(sticky = "w", row = 5, column = 1)
            time.sleep(1)
            ipsmdaudioval = 0
        else:
            onlineTOMCATLabel.grid_remove()
            offlineTOMCATLabel.grid(sticky = "w", row = 5, column = 1)
            time.sleep(1)
            if ipsmdaudioval == 0:
                pygame.mixer.init()
                pygame.mixer.music.load('ipsmd.wav')
                pygame.mixer.music.play()
                ipsmdaudioval = 1

# button and field for IP Address
ipadressLabel = tk.Label(text = "IP S01:")
ipadressLabel.grid(sticky = "w", row = 0, column = 0)
ipadressEntry = tk.Entry()
ipadressEntry.grid(row = 0, column = 1)
ipadressButton = tk.Button(text = "Submit", command = mountX)
ipadressButton.grid(sticky = "w", row = 0, column = 3)

window.mainloop()
