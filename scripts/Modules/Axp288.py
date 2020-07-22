class Axp288:
    
    CHARGE_FULL_FILE = 'charge_full'
    CHARGE_NOW_FILE = 'charge_now'
    STATUS_FILE = 'status'
    
    def __init__(self, system_path='/sys/class/power_supply/axp288_fuel_gauge'):
        self.char_full_file = open(system_path+"/"+Axp288.CHARGE_FULL_FILE)
        self.char_now_file = open(system_path+"/"+Axp288.CHARGE_NOW_FILE)
        self.status_file = open(system_path+"/"+Axp288.STATUS_FILE)
        self.full = self.getChargeFull()

    def getChargeFull(self):
        self.char_full_file.seek(0)
        charge_full = self.char_full_file.read().strip()
        return int(charge_full)

    def getChargeNow(self):
        self.char_now_file.seek(0)
        charge_now = self.char_now_file.read()
        return int(charge_now)

    def getPercent(self):
        now = self.getChargeNow()
        return (now*100) / self.full
    
    def getPowerPlugged(self):
        self.status_file.seek(0)
        status = self.status_file.read().strip()
        return status != 'Discharging'

    percent = property(getPercent)
    power_plugged= property(getPowerPlugged)


if __name__ == "__main__":
    ax = Axp288()
    print(ax.getChargeFull())
    print(ax.getChargeNow())
    print(ax.percent)
    print(ax.power_plugged)
