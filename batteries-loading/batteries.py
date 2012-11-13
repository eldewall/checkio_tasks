import itertools

def checkio(batteries):
    best = sum(batteries)
    
    for i in range(0,len(batteries)):
        for c in itertools.combinations(batteries, i):
            left = sum(c)
            right = abs(left - sum(batteries))
            diff = abs(left - right)
            best = diff if diff < best else best
    
    return best

if __name__ == '__main__':
    assert checkio([10]) == 10, 'First'
    assert checkio([12,30,30,32,42,49]) == 9, 'Second' 

    print('All Ok')
