def checkio(offers):
    initial_cust, raise_cust, initial_driver, reduction_driver = offers

    while initial_cust < initial_driver:
        initial_cust += raise_cust
        initial_driver -= reduction_driver

    return initial_cust


if __name__ == '__main__':
    assert checkio([150, 50, 1000, 100]) == 450, 'First'
    assert checkio([150, 50, 900, 100]) == 400, 'Second'
    print('All is ok')
