def checkio(data):
    has_digit = False
    has_upper = False
    has_lower = False
    has_length = len(data) >= 10

    for c in data:
        has_upper = c.isupper() if not has_upper else has_upper
        has_lower = c.islower() if not has_lower else has_lower
        has_digit = c.isdigit() if not has_digit else has_digit

    return has_digit and has_upper and has_lower and has_length


if __name__ == '__main__':
    assert checkio('A1213pokl')==False, 'First'
    assert checkio('bAse730onE4')==True, 'Second'
    assert checkio('asasasasasasasaas')==False, 'Third'
    assert checkio('QWERTYqwerty')==False, 'Fourth'
    assert checkio('123456123456')==False, 'Fifth'
    assert checkio('QwErTy911poqqqq')==True, 'Sixth'
    print('All ok')
