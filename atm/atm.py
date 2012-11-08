import math

def checkio(data):
    balance, withdrawal = data
    amount = withdrawal.pop()
    balance = withdraw(balance, amount)

    if len(withdrawal) > 0:
        balance = checkio([balance, withdrawal])

    return balance


def withdraw(balance, amount):
    if is_valid(balance, amount):
        balance -= amount + commision(amount)

    return math.floor(balance)


def is_valid(balance, amount):
    return amount % 5 == 0 and amount + commision(amount) <= balance

def commision(amount):
    return 0.5 + (amount * 0.01)

if __name__ == '__main__':
    assert checkio([120, [10 , 20, 30]]) == 57, 'First'
    
    assert checkio([120, [120, 10, 122, 2, 10, 10, 30, 1]]) == 56, 'Mixed'

    print('All Ok')
