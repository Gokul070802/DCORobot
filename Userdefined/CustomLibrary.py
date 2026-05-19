import random
from robot.api.deco import keyword

def luhn_checksum(num_str):
    digits = [int(d) for d in num_str]
    checksum = 0
    parity = len(digits) % 2
    for i, d in enumerate(digits):
        if i % 2 == parity:
            d *= 2
            if d > 9:
                d -= 9
        checksum += d
    return checksum % 10

class CustomLibrary:
    @keyword("Generate Valid SIN")
    def generate_valid_sin(self):
        while True:
            candidate = str(random.randint(100000000, 999999999))
            if luhn_checksum(candidate) == 0:
                return candidate