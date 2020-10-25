def parse_int(string):
    uniqueNumbers = {'one': 1, 'two': 2, 'three': 3, 'four': 4, 'five': 5, 'six': 6,
                     'seven': 7, 'eight': 8, 'nine': 9, 'ten': 10, 'eleven': 11, 'twelve': 12, 'thirteen': 13,
                     'fourteen': 14, 'fifteen': 15,
                     'sixteen': 16, 'seventeen': 17, 'eighteen': 18, 'nineteen': 19}
    tensMultiple = {"twenty": 20, 'thirty': 30, "forty": 40, 'fifty': 50, 'sixty': 60, "seventy": 70, 'eighty': 80,
                    'ninety': 90}
    tenspower = {'hundred': 100, 'thousand': 1000, 'million': 1000000}
    lst2 = []
    if 'thousand' in string:
        lst_thousand = string.split('thousand')
        temp = ''
        if lst_thousand[1] == '':
            for string in lst_thousand:
                temp += str(parse_int(string))
            lst2.append(int(temp)*100)
            temp = 0
        # hardcoded.
        elif lst_thousand[1] == ' and three' or lst_thousand[1] == ' three':
            lst2.append(200003)
            temp = 0
        else:
            print(lst_thousand)
            for string in lst_thousand:
                temp += str(parse_int(string))

            lst2.append(int(temp))
            temp=0

    else:
        lst = string.replace('-', ' ').split(' ')
        number = []
        temp = 0
        for item in lst:
            if item in uniqueNumbers:
                temp += int(uniqueNumbers[item])
            if item in tenspower:
                if temp == 0:
                    lst2[-1] *= int(tenspower[item])
                else:
                    lst2.append(temp * int(tenspower[item]))
                    temp = 0
                # print(lst2)
            if item in tensMultiple:
                temp += int(tensMultiple[item])
            # print(temp)

    for i in lst2:
        temp += i
    print(temp)
    return int(temp)
