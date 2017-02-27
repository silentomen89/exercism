# Solution to Clock (Python)
# Written by David Andrews

class Clock:
    def __init__(self, hour, minute):
        self.hour = hour
        self.minute = minute

    def __str__(self):
        self.adjust()
        return '%02d:%02d' % (self.hour, self.minute)

    def __eq__(self, clock2):
        if self.__str__() == clock2.__str__():
            return True
        else:
            return False

    def add(self, add_minutes):
        self.minute += add_minutes
        return self.__str__()

    def adjust(self):
        self.add_hours = 0
        
        self.add_hours, self.minute = divmod(self.minute, 60)
        self.hour += self.add_hours
        
        while self.hour >= 24:
            self.hour -= 24

        while self.hour < 0:
            self.hour += 24
